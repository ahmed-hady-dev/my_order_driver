import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_order_driver/constants/constants.dart';
import 'package:my_order_driver/core/cacheHelper/cache_helper.dart';
import 'package:my_order_driver/core/dioHelper/dio_helper.dart';
import 'package:my_order_driver/core/router/router.dart';
import 'package:my_order_driver/view/home/model/orders_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
//===============================================================
  OrdersModel? ordersModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final alertController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//===============================================================
  Future<void> deliveryProblem(
      {required int id, required String message}) async {
    MagicRouter.pop();
    final response =
        await DioHelper.postData(url: '/delivery/orders/onDelivery', data: {
      'order_id': id,
      'cancel_reason': message,
    });
    if (response.data['status'] == 1) {
      final index =
          ordersModel!.data!.indexWhere((element) => element.id! == id);
      ordersModel!.data![index].state = 'Canceled';
    }
    Fluttertoast.showToast(msg: response.data['message']);
    emit(HomeInitial());
  }

  Future<void> callClient(String phone) async {
    print(phone);
  }

  Future<void> onDelivery(int id) async {
    emit(OrderLoading());
    final response = await DioHelper.postData(
        url: '/delivery/orders/onDelivery', data: {'order_id': id});
    if (response.data['status'] == 1) {
      final index =
          ordersModel!.data!.indexWhere((element) => element.id! == id);
      ordersModel!.data![index].state = 'OnDelivery';
    }
    Fluttertoast.showToast(msg: response.data['message']);
    emit(HomeInitial());
  }

  Future<void> accept(int id) async {
    emit(OrderLoading());
    final response = await DioHelper.postData(
        url: '/delivery/orders/accept', data: {'order_id': id});
    if (response.data['status'] == 1) {
      final index =
          ordersModel!.data!.indexWhere((element) => element.id! == id);
      ordersModel!.data![index].state = 'Accepted';
    }
    Fluttertoast.showToast(msg: response.data['message']);
    emit(HomeInitial());
  }

  Future<void> delivered(int id) async {
    emit(OrderLoading());
    final response = await DioHelper.postData(
        url: '/delivery/orders/deliver', data: {'order_id': id});
    if (response.data['status'] == 1) {
      final index =
          ordersModel!.data!.indexWhere((element) => element.id! == id);
      ordersModel!.data![index].state = 'Delivered';
    }
    Fluttertoast.showToast(msg: response.data['message']);
    emit(HomeInitial());
  }

//===============================================================
  Future<void> signOut() async {
    emit(LogoutLoadingState());
    await DioHelper.getDataByToken(url: logout);
    try {
      await CacheHelper.signOut();
      emit(LogoutSuccessState());
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(LogoutErrorState());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(LogoutErrorState());
    }
  }

//===============================================================
  Future<void> getOrders() async {
    emit(HomeLoading());
    try {
      final response = await DioHelper.getDataByToken(url: order);
      ordersModel = OrdersModel.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.error.toString());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
    }
    emit(HomeInitial());
  }
}

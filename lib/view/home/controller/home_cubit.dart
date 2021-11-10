import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order_driver/constants/constants.dart';
import 'package:my_order_driver/core/cacheHelper/cache_helper.dart';
import 'package:my_order_driver/core/dioHelper/dio_helper.dart';
import 'package:my_order_driver/view/home/model/logout_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
//===============================================================
  LogoutModel? logoutModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final alertController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//===============================================================
  //TODO: add send problem message function here
  sendDeliveryProblem({required String message}) async {}
//===============================================================
  Future<void> signOut() async {
    emit(LogoutLoadingState());
    final response = await DioHelper.postData(url: logout, data: {});
    try {
      logoutModel = LogoutModel.fromJson(response.data);
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
    emit(LogoutLoadingState());
    final response = await DioHelper.getData(url: order);
    try {
      logoutModel = LogoutModel.fromJson(response.data);
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
}

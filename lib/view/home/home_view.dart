// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order_driver/view/drawer/drawer.dart';
import 'package:my_order_driver/widgets/loading_indicator.dart';

import 'component/drawer_icon.dart';
import 'component/home_order_card.dart';
import 'controller/home_cubit.dart';
import 'model/store_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()..getOrders(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            if(state is HomeLoading){
              return Scaffold(
                body: LoadingIndicator(),
              );
            }
            return Scaffold(
              key: cubit.scaffoldKey,
              appBar: AppBar(
                title: Text("home.appBar_title".tr()),
                leading: DrawerIcon(
                    onPressed: () =>
                        cubit.scaffoldKey.currentState!.openDrawer()),
              ),
              drawer: const NavigationDrawer(),
              body: cubit.ordersModel == null || cubit.ordersModel!.data!.isEmpty ? SizedBox() : ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                itemCount: cubit.ordersModel!.data!.length,
                itemBuilder: (context, index) => HomeOrderCard(
                  order: cubit.ordersModel!.data![index],
                  cubit: cubit,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

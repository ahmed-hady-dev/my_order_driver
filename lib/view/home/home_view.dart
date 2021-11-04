// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order_driver/view/drawer/drawer.dart';

import 'component/drawer_icon.dart';
import 'component/order_card.dart';
import 'controller/home_cubit.dart';
import 'model/orders_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Scaffold(
            key: cubit.scaffoldKey,
            appBar: AppBar(
              title: Text("home.appBar_title".tr()),
              leading: DrawerIcon(
                  onPressed: () =>
                      cubit.scaffoldKey.currentState!.openDrawer()),
            ),
            drawer: const NavigationDrawer(),
            body: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
              itemCount: recentModelList.length,
              itemBuilder: (context, index) => OrderCard(
                orderModel: recentModelList,
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}

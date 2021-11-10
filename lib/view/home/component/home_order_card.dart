// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order_driver/constants/app_colors.dart';
import 'package:my_order_driver/core/router/router.dart';
import 'package:my_order_driver/view/home/controller/home_cubit.dart';
import 'package:my_order_driver/view/home/widgets/card_text.dart';
import 'package:my_order_driver/view/home/widgets/total_price_text.dart';
import 'package:my_order_driver/view/order/order_view.dart';

import '../model/store_model.dart';

class HomeOrderCard extends StatelessWidget {
  final List<StoreModel> storeModel;
  final int index;
  final HomeCubit cubit;

  const HomeOrderCard({
    Key? key,
    required this.storeModel,
    required this.index,
    required this.cubit,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.redColor)),
      child: InkWell(
        onTap: () => MagicRouter.navigateTo(BlocProvider.value(
          value: cubit,
          child: OrderView(
            notes: storeModel[index].notes,
          ),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.0,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(storeModel[index].storeImage))),
            ),
            const SizedBox(height: 4),
            CardText(
              text: storeModel[index].storeName,
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CardText(
                text: "home.state".tr() + storeModel[index].state.toString()),
            CardText(
                text: "home.notes".tr() + storeModel[index].notes.toString()),
            TotalPriceText(
              text: "home.total_price".tr() +
                  storeModel[index].totalPrice.toString() +
                  ' ' +
                  "home.egp".tr(),
            ),
            const SizedBox(height: 4)
          ],
        ),
      ),
    );
  }
}

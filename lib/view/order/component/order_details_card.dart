// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order_driver/constants/app_colors.dart';
import 'package:my_order_driver/view/home/widgets/card_text.dart';
import 'package:my_order_driver/view/order/component/total_text.dart';

import 'order_details_header.dart';
import 'order_details_row.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    Key? key,
    required this.notes,
    required this.state,
    required this.totalPrice,
    required this.subTotalPrice,
    required this.deliveryFees,
    required this.payment,
  }) : super(key: key);
  final String notes;
  final String state;
  final double totalPrice;
  final double subTotalPrice;
  final double deliveryFees;
  final String payment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        border:
            Border.all(color: AppColors.redColor.withOpacity(0.5), width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderDetailsHeader(),
          CardText(
            text: "home.state".tr() + state,
            color: Colors.black,
          ),
          CardText(
            text: "home.payment".tr() + payment, color: Colors.black,
            // orderModel[index].payment.toString()
          ),
          CardText(
            text: "home.notes".tr() + notes,
            color: Colors.black,
          ),
          CardText(
            text: "home.sub_total".tr() +
                subTotalPrice.toString() +
                ' ' +
                "home.egp".tr(),
            color: Colors.black,
          ),
          OrderDetailsRow(
            title: "home.delivery_price".tr(),
            price: deliveryFees,
          ),
          TotalText(totalPrice: totalPrice),
        ],
      ),
    );
  }
}

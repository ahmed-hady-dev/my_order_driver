// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order_driver/view/home/model/orders_model.dart';
import 'package:my_order_driver/widgets/price_text.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/restaurant_name.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.index,
    required this.orderModel,
  }) : super(key: key);
  final int index;
  final List<OrdersModel> orderModel;
  @override
  Widget build(BuildContext context) {
    String image = orderModel[index].itemImage;
    String name = orderModel[index].itemName;
    String description = orderModel[index].itemName;
    double price = orderModel[index].price;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 84.0,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.redColor, width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 84.0,
              width: 120.0,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: context.locale.languageCode == 'en'
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0))
                      : const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover)),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RestaurantName(name: name),
                        PriceText(
                          price: "home.description".tr() + description,
                          fontSize: 12.0,
                        ),
                        PriceText(
                          price: "home.price".tr() +
                              price.toString() +
                              ' ' +
                              "home.egp".tr(),
                          fontSize: 12.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

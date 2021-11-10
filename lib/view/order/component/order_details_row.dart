// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class OrderDetailsRow extends StatelessWidget {
  final String title;
  final double price;
  const OrderDetailsRow({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.redColor, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              price.toString() + ' ' + "home.egp".tr(),
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order_driver/constants/app_colors.dart';

class CityDropDownButton extends StatelessWidget {
  const CityDropDownButton(
      {Key? key,
      required this.itemsList,
      required this.onChanged,
      required this.value})
      : super(key: key);
  final List itemsList;
  final Function(String?)? onChanged;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColors.redColor)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          items: itemsList
              .map(
                (city) => DropdownMenuItem<String>(
                  value: city.id.toString(),
                  child: Text(city.name.toString()),
                ),
              )
              .toList(),
          onChanged: onChanged,
          value: value,
          elevation: 2,
          isDense: false,
          iconSize: 40.0,
          hint: SizedBox(
            width: 150, //and here
            child: Text(
              "register.choose_city".tr(),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    );
  }
}

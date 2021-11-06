// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onFieldSubmitted,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return "validation.phone_empty".tr();
        } else if (value.length < 11) {
          return "validation.phone_valid".tr();
        } else {
          return null;
        }
      },
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          hintText: hintText, prefixIcon: const Icon(Icons.phone_outlined)),
    );
  }
}

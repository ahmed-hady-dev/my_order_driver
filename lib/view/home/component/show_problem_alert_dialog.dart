// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order_driver/core/router/router.dart';

showProblemAlertDialog({
  required BuildContext context,
  required TextEditingController controller,
  required GlobalKey<FormState> formKey,
  required var sendDeliveryMessage,
}) {
  Widget cancelButton = TextButton(
    child: Text("home.cancel".tr()),
    onPressed: () => MagicRouter.pop(),
  );
  Widget sendButton = TextButton(
    child: Text("home.send".tr()),
    onPressed: () {
      if (formKey.currentState!.validate()) {
        sendDeliveryMessage();
      }
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("home.what_happened".tr()),
    content: Form(
      key: formKey,
      child: TextFormField(
        maxLines: 3,
        autofocus: true,
        validator: (value) {
          if (value!.isEmpty) {
            return "home.empty".tr();
          } else {
            return null;
          }
        },
        controller: controller,
        decoration: InputDecoration(
          hintText: "home.enter_why".tr(),
          contentPadding: const EdgeInsets.all(6.0),
        ),
      ),
    ),
    actions: [
      cancelButton,
      sendButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

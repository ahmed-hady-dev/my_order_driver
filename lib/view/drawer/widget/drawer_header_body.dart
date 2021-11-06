// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order_driver/core/cacheHelper/cache_helper.dart';
import 'package:my_order_driver/core/router/router.dart';
import 'package:my_order_driver/view/drawer/widget/user_avatar.dart';
import 'package:my_order_driver/view/login/login_view.dart';
import 'package:my_order_driver/view/user_details/user_details_view.dart';
import 'empty_avatar.dart';

class DrawerHeaderBody extends StatelessWidget {
  const DrawerHeaderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: <Widget>[
          CacheHelper.isLogged ? const UserAvatar() : const EmptyAvatar(),
          const SizedBox(height: 8),
          InkWell(
            onTap: CacheHelper.isLogged
                ? () {
                    MagicRouter.pop();
                    MagicRouter.navigateAndPopUntilFirstPage(
                        const UserDetailsView());
                  }
                : () =>
                    MagicRouter.navigateAndPopUntilFirstPage(const LoginView()),
            child: SizedBox(
              width: 160,
              child: Text(
                CacheHelper.isLogged
                    ? CacheHelper.userFirstName
                    : "drawer.login".tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

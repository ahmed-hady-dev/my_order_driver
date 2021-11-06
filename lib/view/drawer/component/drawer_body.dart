// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order_driver/core/cacheHelper/cache_helper.dart';
import 'package:my_order_driver/core/router/router.dart';
import 'package:my_order_driver/view/drawer/widget/drawer_item.dart';
import 'package:my_order_driver/view/home/controller/home_cubit.dart';
import 'package:my_order_driver/view/home/home_view.dart';
import 'package:my_order_driver/view/login/login_view.dart';
import 'package:my_order_driver/view/notifications/notifications_view.dart';
import 'package:my_order_driver/view/settings/settings_view.dart';
import 'package:my_order_driver/view/user_details/user_details_view.dart';

import 'drawer_home_item.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerHomeItem(
          icon: Icons.home,
          text: "drawer.home".tr(),
          onTap: () {
            MagicRouter.pop();
            MagicRouter.navigateAndPopAll(const HomeView());
          },
        ),
        CacheHelper.isLogged
            ? DrawerItem(
                icon: Icons.person,
                text: "drawer.profile".tr(),
                onTap: () {
                  MagicRouter.pop();
                  MagicRouter.navigateAndPopUntilFirstPage(
                      const UserDetailsView());
                },
              )
            : const SizedBox(),
        // CacheHelper.isLogged
        //     ? DrawerItem(
        //         icon: FontAwesomeIcons.clipboardList,
        //         text: "drawer.your_orders".tr(),
        //         onTap: () {
        //           MagicRouter.pop();
        //           MagicRouter.navigateAndPopUntilFirstPage(const HomeView());
        //         },
        //       )
        //     : const SizedBox(),
        CacheHelper.isLogged
            ? DrawerItem(
                icon: Icons.notifications,
                text: "drawer.notifications".tr(),
                onTap: () {
                  MagicRouter.pop();
                  MagicRouter.navigateAndPopUntilFirstPage(
                      const NotificationsView());
                },
              )
            : const SizedBox(),
        // DrawerItem(
        //   icon: FontAwesomeIcons.bullhorn,
        //   text: "drawer.get_help".tr(),
        //   onTap: () {
        //     MagicRouter.pop();
        //     MagicRouter.navigateAndPopUntilFirstPage(const HelpView());
        //   },
        // ),
        // DrawerItem(
        //   icon: Icons.info_outline,
        //   text: "drawer.about_us".tr(),
        //   onTap: () {
        //     MagicRouter.pop();
        //     MagicRouter.navigateAndPopUntilFirstPage(const AboutView());
        //   },
        // ),
        CacheHelper.isLogged
            ? BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      DrawerItem(
                        icon: Icons.logout,
                        text: "drawer.logout".tr(),
                        onTap: () async {
                          await HomeCubit.get(context).signOut();
                          Fluttertoast.showToast(
                              msg: "drawer.logout_success".tr());
                          MagicRouter.pop();
                          MagicRouter.navigateAndPopAll(const LoginView());
                        },
                      ),
                      state is LogoutLoadingState
                          ? const CupertinoActivityIndicator(animating: true)
                          : const SizedBox(),
                    ],
                  );
                },
              )
            : DrawerItem(
                icon: Icons.login,
                text: "drawer.login".tr(),
                onTap: () {
                  MagicRouter.pop();
                  MagicRouter.navigateAndPopUntilFirstPage(const LoginView());
                },
              ),
        DrawerItem(
          icon: FontAwesomeIcons.cog,
          text: "drawer.settings".tr(),
          onTap: () {
            MagicRouter.pop();
            MagicRouter.navigateTo(const SettingsView());
          },
        )
      ],
    );
  }
}

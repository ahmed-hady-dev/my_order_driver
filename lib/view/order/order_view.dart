// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order_driver/view/home/component/show_problem_alert_dialog.dart';
import 'package:my_order_driver/view/home/controller/home_cubit.dart';
import 'package:my_order_driver/view/home/model/orders_model.dart';
import 'package:my_order_driver/view/order/component/order_details_card.dart';
import 'package:my_order_driver/view/order/widgets/order_card.dart';
import 'package:my_order_driver/widgets/main_button.dart';

class OrderView extends StatelessWidget {
  const OrderView({
    Key? key,
    required this.notes,
  }) : super(key: key);
  final String notes;

  @override
  Widget build(BuildContext context) {
    bool isAccepted = true;
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text("order.appBar_title".tr())),
            body: ListView(
              children: [
                ListView.builder(
                  itemCount: ordersModelList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => OrderCard(
                    index: index,
                    orderModel: ordersModelList,
                  ),
                ),
                OrderDetailsCard(
                  totalPrice: 20.0,
                  deliveryFee: 20.0,
                  notes: notes,
                ),
                isAccepted
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: MainButton(
                                  onPressed: () {},
                                  text: "home.deliver".tr(),
                                  style: const TextStyle(fontSize: 14.0)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: MainButton(
                                onPressed: () {
                                  showProblemAlertDialog(
                                      context: context,
                                      controller: cubit.alertController,
                                      formKey: cubit.formKey,
                                      sendDeliveryMessage:
                                          cubit.sendDeliveryProblem(
                                              message: cubit
                                                  .alertController.value.text
                                                  .trim()));
                                },
                                text: "home.error".tr(),
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: MainButton(
                          onPressed: () {},
                          text: "home.accept".tr(),
                        ),
                      ),
                const SizedBox(height: 8.0),
              ],
            ),
          );
        },
      ),
    );
  }
}

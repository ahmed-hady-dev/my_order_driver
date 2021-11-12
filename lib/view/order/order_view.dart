// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order_driver/view/home/component/show_problem_alert_dialog.dart';
import 'package:my_order_driver/view/home/controller/home_cubit.dart';
import 'package:my_order_driver/view/home/model/orders_model.dart';
import 'package:my_order_driver/view/order/component/order_details_card.dart';
import 'package:my_order_driver/view/order/widgets/order_card.dart';
import 'package:my_order_driver/widgets/loading_indicator.dart';
import 'package:my_order_driver/widgets/main_button.dart';

class OrderView extends StatelessWidget {
  const OrderView({
    Key? key, required this.order,

  }) : super(key: key);
  final Datum order;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text("order.appBar_title".tr())),
            body: ListView(
              children: [
                if(order.items != null && order.items!.isNotEmpty)
                ListView.builder(
                  itemCount: order.items!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => OrderCard(item: order.items![index],),
                ),
                OrderDetailsCard(
                    state: order.state!,
                    totalPrice: order.total!,
                    subTotalPrice: order.subTotal!,
                    deliveryFees: order.deliveryFees == null ? 0.0 : order.deliveryFees!,
                    payment: order.payment!),
                state is OrderLoading ? LoadingIndicator() : Builder(
                  builder: (context) {
                    if(order.state == 'Ordered' || order.state == 'Preparing'){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: MainButton(
                          onPressed: () => cubit.accept(order.id!),
                          text: "home.accept".tr(),
                        ),
                      );
                    }else if(order.state == 'Accepted'){
                      return Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: MainButton(
                                onPressed: () => cubit.onDelivery(order.id!),
                                text: 'On Delivery',
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: MainButton(
                                // TODO: Phone number of client
                                onPressed: () => cubit.callClient(order.delivery!.phone!),
                                text: 'Call',
                              ),
                            ),
                          ),
                        ],
                      );
                    }else if(order.state == 'OnDelivery'){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child: MainButton(
                                  onPressed: () => cubit.delivered(order.id!),
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
                                      sendDeliveryMessage: ()=>
                                      cubit.deliveryProblem(
                                          id: order.id!,
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
                      );
                    }else if(order.state == 'Delivered' || order.state == 'Canceled' || order.state == 'Cancelled'){
                      return SizedBox();
                    }else{
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MainButton(
                          onPressed: () {
                            showProblemAlertDialog(
                                context: context,
                                controller: cubit.alertController,
                                formKey: cubit.formKey,
                                sendDeliveryMessage: () =>
                                cubit.deliveryProblem(
                                  id: order.id!,
                                    message: cubit
                                        .alertController.value.text
                                        .trim()));
                          },
                          text: "home.error".tr(),
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      );
                    }
                  },
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

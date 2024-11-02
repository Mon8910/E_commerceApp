import 'package:ecommerce_app/controller/orders/archive_orders_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/data/model/orders_model.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class ArchiveOrdersItems extends GetView<ArchiveOrdersController> {
  const ArchiveOrdersItems({super.key, required this.ordersModel});
  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Orders Number:  ${ordersModel.ordersId}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Text(
                "Order Type:${controller.printOrdersType(ordersModel.ordersType.toString())}"),
            Text("Order Price:${ordersModel.ordersPrice}\$"),
            Text("Delivery Price :${ordersModel.ordersPricedelivery}\$"),
            Text(
                "Payment Method:  ${controller.printPaymentType(ordersModel.ordersPaymrntmethods.toString())}"),
            Text(
                "Orders Status:  ${controller.printOrdersStatus(ordersModel.ordersStatus.toString())}"),
            const Divider(),
            Row(
              children: [
                Text("Total Price:${ordersModel.ordersTotalPrice}\$"),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.orderDetails,
                          arguments: {"orderdetails": ordersModel});
                    },
                    child: const Text(
                      'Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.secoundColor),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

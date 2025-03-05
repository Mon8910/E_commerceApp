import 'package:ecommerce_app/controller/orders/archive_orders_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';

import 'package:ecommerce_app/view/widget/orders/archive_orders_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrder extends StatelessWidget {
  const ArchiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive Orders'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<ArchiveOrdersController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) =>
                        ArchiveOrdersItems(ordersModel: controller.data[index]),
                  ),
                )),
      ),
    );
  }
}

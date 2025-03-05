import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/offer_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/widget/offer/custom_list_offer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});

  @override
  Widget build(BuildContext context) {
    OfferController offerController = Get.put(OfferController());
     FavoriteController controllerImpl = Get.put(FavoriteController());
    return GetBuilder<OfferController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                return  CustomListOffer(items: controller.data[index]);
              }),
            )));
  }
}

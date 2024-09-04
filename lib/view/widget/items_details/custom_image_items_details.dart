import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/controller/items_details_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageItemsDetails extends GetView<ItemsDetailsControllerImpl>{
  const CustomImageItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
   return  Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: Get.width / 8,
                  left: Get.width / 8,
                  child: Hero(
                    tag: "${controller.itemsModel!.itemsName}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.itemsImage}/${controller.itemsModel!.itemsImage}",
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            );
  }

}
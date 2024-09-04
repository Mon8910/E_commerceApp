import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImpl> {
  const CustomCardHome(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: 150,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                title,
                // 'A Summer surprise'
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              subtitle: Text(
                subTitle,
                //'Cash back 20%',
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Positioned(
              right:controller.lang=="en"? -10:null,
              top: -10,
              left: controller.lang=="ar"? -40:null,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: AppColor.secoundColor,
                  borderRadius: BorderRadius.circular(160),
                ),
              ))
        ],
      ),
    );
  }
}

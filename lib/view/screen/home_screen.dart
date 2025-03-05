import 'dart:io';

import 'package:ecommerce_app/controller/home_screen_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/view/widget/home/custom_bottom_appbar_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImpl());

    return GetBuilder<HomeScreenControllerImpl>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.toNamed(AppRoutes.cart);
              },
              backgroundColor: AppColor.primaryColor,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.shopping_basket_outlined,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppbarHomescreen(),
            body: WillPopScope(
                child: controller.listpage.elementAt(controller.currentPage),
                onWillPop: () {
                  Get.defaultDialog(
                    title: 'warning',
                    middleText: 'Do you want to exit the app',
                    onCancel: (){},
                    cancelTextColor: AppColor.primaryColor,
                    confirmTextColor: Colors.white,
                    buttonColor: AppColor.primaryColor,
                    
                    onConfirm: () {
                      exit(0);
                    },
                  );
                  return Future.value(false);
                })));
  }
}

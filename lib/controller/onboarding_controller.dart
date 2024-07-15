import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnboardingControllerImpl extends OnboardingController {
  MyServices services=Get.find();
  int currenttPage = 0;
  late PageController pageController;
  @override
  next() {
    currenttPage++;
    if (currenttPage > onboardingList.length - 1) {
      services.sharedPreferences.setString('onboarding', "1");

      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(
        currenttPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currenttPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}

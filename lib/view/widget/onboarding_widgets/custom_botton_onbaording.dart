import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottonOnbaording extends GetView<OnboardingControllerImpl> {
  const CustomBottonOnbaording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 120),
          backgroundColor: AppColor.primaryColor,
          textStyle: const TextStyle(color: Colors.white),
        ),
        onPressed: () {
          controller.next();
        },
        child:  Text('29'.tr),
      ),
    );
  }
}

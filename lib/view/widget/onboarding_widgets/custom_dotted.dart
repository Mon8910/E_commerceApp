import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotted extends StatelessWidget {
  const CustomDotted({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImpl>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onboardingList.length,
                  (index) => AnimatedContainer(
                    height: 6,
                    width: controller.currenttPage==index ? 20:6,
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(milliseconds: 900),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ));
  }
}

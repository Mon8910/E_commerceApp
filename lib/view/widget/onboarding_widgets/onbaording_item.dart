import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingItem extends GetView<OnboardingControllerImpl> {
  const OnboardingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      controller: controller.pageController,
      itemCount: onboardingList.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Text(
              onboardingList[i].title,
              style:const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.black),
            ),
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              onboardingList[i].image,
              width: 200,
              height: 250,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onboardingList[i].body,
                style:const TextStyle(
                fontSize: 16,
                height: 2,
                fontWeight: FontWeight.bold,
                color: AppColor.grey)
              ),
            ),
          ],
        );
      },
    );
  }
}

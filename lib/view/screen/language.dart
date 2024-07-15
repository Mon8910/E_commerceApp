import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/localization/local.dart';
import 'package:ecommerce_app/view/widget/language_widets/custom_button_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalControl> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('1'.tr),
            CustomButtonLanguage(
              title: 'Ar',
              onPressed: () {
                controller.changelanguage('ar');
                Get.toNamed(AppRoutes.onBoarding);

              },
            ),
         const   SizedBox(height: 20,),
            CustomButtonLanguage(
              title: 'En',
              onPressed: () {
                controller.changelanguage('en');
                 Get.toNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}

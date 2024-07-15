import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyController extends GetxController {
  goToResetPassword();
  checkCode();
}

class VerifyControllerImpl extends VerifyController {
  late TextEditingController email;
  @override
  checkCode() {
    
  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}

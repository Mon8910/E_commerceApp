import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/forget_password.dart/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  goToSucceseRestPassword();
  checkEmail();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;
  late StatusRequest statusRequest;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;

  @override
  checkEmail() {
    throw UnimplementedError();
  }

  @override
  goToSucceseRestPassword() async {
    if (password != rePassword) {
      return Get.defaultDialog(
          title: 'warning', middleText: "password does'nt match ");
    }
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await resetPasswordData.postDtat(email!, password.text);
      print('======================= $response');
      statusRequest = handlingData(response);
      if (response['status'] == 'success') {
        //data.addAll(response);
        Get.offNamed(AppRoutes.successResetPassword);
      } else {
        Get.defaultDialog(title: 'warning', middleText: 'try again ');
        statusRequest = StatusRequest.failure;
      }
    } else {
      print('not valid');
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}

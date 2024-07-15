import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignup();
  goToForgetPassword();
}

class LoginControllerImpl extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  late TextEditingController email;
  late TextEditingController password;
  late StatusRequest statusRequest;
  LoginData loginData = LoginData(Get.find());
  @override
  goToSignup() {
    Get.toNamed(AppRoutes.signup);
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await loginData.postDtat(email.text, password.text);
      print('======================= $response');
      statusRequest = handlingData(response);
      if (response['status'] == 'success') {
        //data.addAll(response);
        Get.offNamed(
          AppRoutes.home,
        );
      } else {
        Get.defaultDialog(
            title: 'warning', middleText: 'email or password are incorrect ');
        statusRequest = StatusRequest.failure;
      }
    } else {
      print('not valid');
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}

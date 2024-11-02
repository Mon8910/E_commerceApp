import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/signp_datas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


abstract class SignupController extends GetxController {
  signup();
  gotoLogin();
}

class SignupControllerImpl extends SignupController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController password;
  late TextEditingController phone;
  SignupData signupData = SignupData(
    Get.find(),
  );
  MyServices myServices = Get.find();
  List data = [];
  late StatusRequest statusRequest;
  @override
  gotoLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  signup() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signupData.postDtat(
          username.text, email.text, phone.text, password.text);
      print('======================= $response');
      statusRequest = handlingData(response);
      if (response['status'] == 'success') {
        //data.addAll(response);
        Get.offNamed(AppRoutes.veriftyCodeSignUp,
            arguments: {'email': email.text});
      } else {
        Get.defaultDialog(
            title: 'warning', middleText: 'phone or email already exists');
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
    username = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }
}

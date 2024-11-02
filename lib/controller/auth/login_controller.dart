import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignup();
  goToForgetPassword();
  permision();
  
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
  MyServices myServices = Get.find();
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
        if(response['data']['users_approve']==1){
        myServices.sharedPreferences
            .setInt('id', response['data']['users_id']);
        myServices.sharedPreferences
            .setString('username', response['data']['users_name']);
        myServices.sharedPreferences
            .setString('email', response['data']['users_email']);
        myServices.sharedPreferences
            .setString('phone', response['data']['users_phone']);
            myServices.sharedPreferences
            .setString('step','2');
        
       
        //data.addAll(response);
        Get.offNamed(
          AppRoutes.home,
        );
        } else{
           Get.toNamed(AppRoutes.veriftyCodeSignUp,
            arguments: {'email': email.text});
        }
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
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    permision();

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

  @override
  permision() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }
}

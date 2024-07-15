import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware{
  @override
   int?get priority => 1;
   MyServices services =Get.find();
   @override
   RouteSettings? redirect(String? route) {
    if(services.sharedPreferences.getString('onboarding')=="1"){
      return const RouteSettings(name: AppRoutes.login);

    }
    
   }
}
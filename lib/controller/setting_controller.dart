import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{
  MyServices myServices=Get.find();
  logout(){
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);

  }
}
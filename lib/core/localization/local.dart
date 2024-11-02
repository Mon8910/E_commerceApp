import 'package:ecommerce_app/core/constant/app_theme.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalControl extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changelanguage(String langaugeCode) {
    Locale locale = Locale(langaugeCode);
    myServices.sharedPreferences.setString("lang", langaugeCode);
    appTheme = langaugeCode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }
  requestPermision()async{
     bool serviceEnabled;
  LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
    
    return Get.snackbar('warning', 'please open location');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      
      return Get.snackbar('warning', 'please give permission location');
    }
  }
   if (permission == LocationPermission.deniedForever) {
     
     return Get.snackbar('warning', 'Location permissions are permanently denied, we cannot request permissions.');
    // return Future.error(
    //   'Location permissions are permanently denied, we cannot request permissions.');
  } 
  }

  @override
  void onInit() {
    requestPermision();
    String? sharedLanguage = myServices.sharedPreferences.getString("lang");
    if (sharedLanguage == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedLanguage == "en") {
      language = const Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}

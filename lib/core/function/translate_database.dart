 import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase (columnar,coulmnen){
  MyServices myServices=Get.find();

  if(myServices.sharedPreferences.getString('lang')=='ar'){
    return columnar;
  }else{
    return coulmnen;
  }

}
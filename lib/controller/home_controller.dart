import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

}
class HomeControllerImpl extends HomeController{
  MyServices myServices= Get.find();
  String? username;
  int ? id;

  intialData(){
    username=myServices.sharedPreferences.getString("username");
    id=myServices.sharedPreferences.getInt('id');
  }
  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
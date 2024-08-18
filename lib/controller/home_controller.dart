import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home.data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  intialData();
  getData();
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  int? id;
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  List categories = [];

  @override
  intialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt('id');
  }

  @override
  void onInit() {
    getData();
    intialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      categories.addAll(response['categories']);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}

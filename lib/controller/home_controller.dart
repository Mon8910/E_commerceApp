import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home.data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  intialData();
  getData();
  goToItems(List categories , int selectedItem,int catid);
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  int? id;
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  List categories = [];
  List items = [];
  String? lang;

  @override
  intialData() {
    lang=myServices.sharedPreferences.getString("lang");
    
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
      categories.addAll(response['categories']['data']);
       items.addAll(response['items']['data']);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
  
  @override
  goToItems( categories,  selectedItem,catid) {
   Get.toNamed(AppRoutes.items,arguments: {
    "categories": categories,
    "Selectedcat":selectedItem,
    "catid":catid
   });
  }
}

import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  intialData();
  goTocart();
}

class ItemsDetailsControllerImpl extends ItemsDetailsController {
  CartController cartController = Get.put(CartController());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  MyServices myServices=Get.find();
  
 
  var countitem=0;
  @override
  intialData() async {
    statusRequest=StatusRequest.loading;
    
    itemsModel = Get.arguments['itemsModel'] ;
    countitem=await cartController.getCountCart(itemsModel.itemsId);
    statusRequest=StatusRequest.success;
    update();
    
  }
  add(){
    cartController.addCart(itemsModel.itemsId);
    countitem++;
    update();
  }
  remove(){
    if(countitem >0){
      cartController.removeCart(itemsModel.itemsId);
      countitem --;
      update();
    }
  }

  List subitmes = [
    {"name": "red", "id": 1, "active": "0"},
    {"name": "black", "id": 2, "active": "0"},
    {"name": "blue", "id": 3, "active": "1"}
  ];
  @override
  void onInit() {
    intialData();
    super.onInit();
  }
  
  @override
  goTocart() {
    Get.toNamed(AppRoutes.cart);
   
  }
}

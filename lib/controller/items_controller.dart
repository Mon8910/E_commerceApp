import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/items_data.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(var val, int catval);
  getData(int catId);
  goToItemsDetails(ItemsModel itemsModel);
}

class ItemsControllerImpl extends ItemsController {
  int? selectedCat;
  int? catId;
  List categories = [];
  List items = [];
  late StatusRequest statusRequest;
  ItemsData itemsData = ItemsData(Get.find());
 MyServices myServices = Get.find();

  @override
  void onInit() {
    initialData();
    getData(catId!);
    super.onInit();
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    getData(catval);
    update();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['Selectedcat'];
    catId = Get.arguments['catid'];
  }

  @override
  getData(catId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(catId,myServices.sharedPreferences.getInt('id')!);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      items.addAll(response['data']);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  goToItemsDetails(itemsModel) {
    Get.toNamed(AppRoutes.itemsDetaisl, arguments: {"itemsModel": itemsModel});
  }
}

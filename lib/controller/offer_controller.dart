import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/offer_data.dart';
import 'package:ecommerce_app/data/datasource/remote/test_data.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

class OfferController extends GetxController {
  OfferData offerData = OfferData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await offerData.getData();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map(
          (e) => ItemsModel.fromJson(e),
        ));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

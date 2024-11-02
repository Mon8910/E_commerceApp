import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/model/address_model.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData viewAddress = AddressData(Get.find());

  List<AddressModel> data = [];

   StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices = Get.find();
  

  deleteAddress(int addressid){
    viewAddress.removeAddress(addressid);
    data.removeWhere((element)=>element.addressId == addressid);
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await viewAddress
        .getAddress(myServices.sharedPreferences.getInt('id')!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(
          listData.map(
            (e) => AddressModel.fromJson(e),
          ),
        );
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

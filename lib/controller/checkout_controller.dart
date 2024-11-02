import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce_app/data/model/address_model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = Get.put(
    AddressData(
      Get.find(),
    ),
  );
  CheckoutData checkoutData = Get.put(
    CheckoutData(
      Get.find(),
    ),
  );
  MyServices myServices = Get.find();

  List<AddressModel> data = [];
  late int couponid;
  late num priceorders;
  late int coupondiscount;

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getAddress(myServices.sharedPreferences.getInt('id')!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
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

  checkout() async {
    if (paymentMetods == null)
      return Get.snackbar('Error', 'Please choose the payment methods');
    if (deliveryMetohds == null)
      return Get.snackbar('Error', 'Please choose the delivery methods');
    statusRequest = StatusRequest.loading;

    var response = await checkoutData.getData(
      myServices.sharedPreferences.getInt('id')!,
      addressMetohds,
      deliveryMetohds!,
      10,
      priceorders,
      couponid,
      paymentMetods!,
      coupondiscount,
    );

    statusRequest = handlingData(response);
    print('monmon $statusRequest');

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.home);
        Get.snackbar('success', 'The order was successfully');
      } else {
        Get.snackbar('Error', 'Try again');
      }
      // End
    }
    update();
  }

  int? paymentMetods;
  int? deliveryMetohds;
  int addressMetohds=0;

  choosePayment(int val) {
    paymentMetods = val;
    update();
  }

  chooseDelivery(int val) {
    deliveryMetohds = val;
    update();
  }

  chooseAddress(int val) {
    addressMetohds = val;
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorders'];
    coupondiscount = Get.arguments['coupondisscount'];

    getData();
    super.onInit();
  }
}

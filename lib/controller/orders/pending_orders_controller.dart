import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/pending_orders_data.dart';
import 'package:ecommerce_app/data/model/orders_model.dart';
import 'package:get/get.dart';

class PendingOrdersController extends GetxController {
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  PendingOrdersData pendingOrdersData = PendingOrdersData(Get.find());
  MyServices myServices = Get.find();
  String printOrdersType(String val) {
    if (val == '0') {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentType(String val) {
    if (val == '0') {
      return "cash";
    } else {
      return "card";
    }
  }

  String printOrdersStatus(String val) {
    if (val == '0') {
      return "Await approval";
    } else if (val == '1') {
      return 'The orders is being prepared';
    } else if (val == '2') {
      return 'the order is picked up by delivery man';
    } else if (val == '3') {
      return 'on the way';
    } else {
      return 'archive';
    }
  }

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await pendingOrdersData
        .getData(myServices.sharedPreferences.getInt('id')!);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      List orders = response['data'];
      data.addAll(orders.map((e) => OrdersModel.fromJson(e)));
      // data.addAll(response['data']);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  deleteOrders(int ordersid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await pendingOrdersData.deleteOrders(ordersid);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      refreshData();
    } else {
      statusRequest = StatusRequest.failure;
      print(response);
    }
    update();
  }

  refreshData() {
    getData();
  }

  @override
  void onInit() {
    getData();
    //rfershorders();
    super.onInit();
  }
}

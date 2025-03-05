import 'dart:async';

import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/order_details_data.dart';
import 'package:ecommerce_app/data/model/cart_model.dart';
import 'package:ecommerce_app/data/model/orders_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel ordersModel;
  Completer<GoogleMapController>? completercontroller;
  CameraPosition? kGooglePlex;

  Position? position;
  List<Marker> markers = [];
  late double lat;
  late double long;
  intialData() {
   if(ordersModel.ordersType==0){
     kGooglePlex = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 12.4746,
    );
    markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      ),
    );
   }
  }

  OrderDetailsData testData = OrderDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await testData.getData(ordersModel.ordersId!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List datas = response['data'];
        data.addAll(
          datas.map(
            (e) => CartModel.fromJson(e),
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
    
    ordersModel = Get.arguments['orderdetails'];
    intialData();
    getData();

    super.onInit();
  }
}

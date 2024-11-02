import 'dart:async';

import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? completercontroller;

  Position? position;
  List<Marker> markers = [];
  double? lat;
  double? long;
  addMarkers(LatLng latlong) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: latlong));
    lat = latlong.latitude;
    long = latlong.longitude;
    update();
  }

  goTopageAddDetails() {
    Get.toNamed(AppRoutes.addressAdd2,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  CameraPosition? kGooglePlex;

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}

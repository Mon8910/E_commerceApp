import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/favorite_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  List data = [];
  late StatusRequest statusRequest;
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();

  addFavorirte(itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getInt('id')!, itemsId);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      // items.addAll(response['data']);
      Get.rawSnackbar(
          title: 'alert', messageText: const Text('data is added to favortie'));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
  removeFavorirte(itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getInt('id')!, itemsId);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      // items.addAll(response['data']);
      Get.rawSnackbar(
          title: 'alert', messageText: const Text('data is removed to favorite'));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}

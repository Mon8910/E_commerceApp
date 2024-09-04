import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  int priceOrders=0;
  int countItems=0;
  

addCart(itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getInt('id')!, itemsId);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      // items.addAll(response['data']);
      Get.rawSnackbar(
          title: 'alert', messageText: const Text('data is added to cart'));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
  removeCart(itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getInt('id')!, itemsId);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      // items.addAll(response['data']);
      Get.rawSnackbar(
          title: 'alert', messageText: const Text('data is removed to cart'));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
  getCountCart(itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCount(
        myServices.sharedPreferences.getInt('id')!, itemsId);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      int countItems=0;
      countItems=response['data'];
      // items.addAll(response['data']);
      return countItems;
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
  viewCart() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart(
        myServices.sharedPreferences.getInt('id')!);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      if(response['datacart']['status']=='success'){
        List dataresponse= response['datacart']['data'];
      Map dataresponses= response['countprice'];
      print("-=-=-=-=$dataresponses");
      data.clear();
      data.addAll(dataresponse.map((e)=> CartModel.fromJson(e)));
      priceOrders=(dataresponses['totalprice']);
      countItems=int.parse(dataresponses['totalcount']);

      }
      
    
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }


  restVarCart(){
    priceOrders=0;
    countItems=0;
    data.clear();
    
  }
  refreshPage(){
    restVarCart();
    viewCart();
  }
  @override
  void onInit() {
    viewCart();
    super.onInit();
  }

}
import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';
import 'package:flutter/material.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(int userid, int id) async {
    var response = await crud.postRequest(
      AppLink.addCart,
      {"usersid": userid.toString(), "itemsid": id.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }

  removeCart(int userid, int id) async {
    var response = await crud.postRequest(
      AppLink.removeCart,
      {"usersid": userid.toString(), "itemsid": id.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }

  getCount(int userid, int id) async {
    var response = await crud.postRequest(
      AppLink.getCountCart,
      {"usersid": userid.toString(), "itemsid": id.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }
  viewCart(int userid) async {
    var response = await crud.postRequest(
      AppLink.viewCart,
      {"userid": userid.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }
}

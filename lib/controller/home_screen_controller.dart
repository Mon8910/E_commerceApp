import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImpl extends HomeScreenController {
  int currentPage = 0;

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }

  List<Widget> listpage = [
    const Home(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('setting'),
        )
      ],
    ),
   const Profile(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('order'),
        )
      ],
    )
  ];
  List titleIcon = ["Home", "Settings", "Profile", "favourite"];
  List<IconData> icons = [
    Icons.home,
    Icons.settings,
    Icons.account_box,
    Icons.notification_add_outlined
  ];
}

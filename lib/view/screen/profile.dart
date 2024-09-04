import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImpl conntroller = Get.put(LoginControllerImpl());
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primaryColor,
              ),
              Positioned(
                top: Get.width / 3.5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage:const  AssetImage('assets/images/avatar.png'),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 100,),
          Card(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('${conntroller.myServices.sharedPreferences.getString('username')}'),
              ),
              ListTile(
                title: Text('${conntroller.myServices.sharedPreferences.getString('email')}'),
              ),
              ListTile(
                title: Text('${conntroller.myServices.sharedPreferences.getString('phone')}'),
              )
            ],
          ),)
        ],
      ),
    );
  }
}

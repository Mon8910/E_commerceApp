import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(HomeControllerImpl());

    return Scaffold(
      body:  GetBuilder<HomeControllerImpl>(builder: (controllerImpl)=>Container(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Find product',
                        hintStyle: const TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: Colors.grey[100]),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Container(
                  width: 60,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_on_outlined,
                        color: Colors.grey[400],
                        size: 30,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    )),
    );
  }
}

import 'package:ecommerce_app/controller/items_details_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomSubitems extends GetView<ItemsDetailsControllerImpl>{
  const CustomSubitems({super.key});

  @override
  Widget build(BuildContext context) {
   return Row(
                    children: [
                      ...List.generate(controller.subitmes.length, (index)=> Container(
                        margin: const EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(bottom: 5),
                        height: 60,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColor.fourthColor,
                          ),
                          color: controller.subitmes[index]["active"]=="1"? AppColor.fourthColor:Colors.white
                        ),
                        child:  Text(
                        controller.subitmes[index]["name"] ,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: controller.subitmes[index]["active"]=="1"? Colors.white:   AppColor.fourthColor),
                        ),
                      ),   )
                      
                      
                    ],
                  );
  }

}
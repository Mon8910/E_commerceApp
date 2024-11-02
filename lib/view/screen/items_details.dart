import 'package:ecommerce_app/controller/items_details_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/function/translate_database.dart';
import 'package:ecommerce_app/view/widget/items_details/custom_image_items_details.dart';
import 'package:ecommerce_app/view/widget/items_details/custom_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});
  

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImpl controller=Get.put(ItemsDetailsControllerImpl());
   
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: AppColor.secoundColor,
          onPressed: () {
            controller.cartController.refreshPage();
            controller.goTocart();
          },
          child: const Text(
            "Add to Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ItemsDetailsControllerImpl>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(
          children: [
            const CustomImageItemsDetails(),
            const SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${translateDatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColor.fourthColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  const SizedBox(height: 10),
                  CustomPrice(
                      price: "${controller.itemsModel!.itemsPrice}",
                      number: "${controller.countitem}",
                      add: () {
                        controller.add();
                      },
                      remove: () {
                        controller.remove();
                      }),
                    // controller.itemsModel!.itemsDesc
                  Text(
                      '${translateDatabase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)}',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Color',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColor.fourthColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  const SizedBox(height: 10),
                
                  //const CustomSubitems()
                ],
              ),
            )
          ],
        ))));
    
  }
}

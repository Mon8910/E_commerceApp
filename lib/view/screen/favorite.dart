import 'package:ecommerce_app/controller/myfavorite_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/widget/favorite/list_item_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<MyFavoriteController>(
            builder: (controller) => ListView(
              children: [
                // CustomAppbarHome(
                //   title: '22'.tr,
                
                //   search: () {},
                //   onPressedIconfavorite: () {
                //     Get.toNamed(AppRoutes.myfavorite);
                //   },
                // ),
                const SizedBox(
                  height: 20,
                ),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      itemCount: controller.data.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .7,
                              crossAxisCount: 2,
                              ),
                      itemBuilder: (context, index) => ListItemFavorite(
                            favoriteModel: controller.data[index],
                          )),
                ),
              ],
            ),
          )),
    );
  }
}

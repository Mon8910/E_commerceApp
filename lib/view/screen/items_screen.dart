import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:ecommerce_app/view/widget/custom_appbar_home.dart';
import 'package:ecommerce_app/view/widget/items/custom_list_items.dart';
import 'package:ecommerce_app/view/widget/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImpl());
    FavoriteController controllerImpl = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImpl>(
          builder: (controller) => ListView(
            children: [
              CustomAppbarHome(
                title: 'Find Products',
                search: () {},
                onPressedIconfavorite: () {
                  Get.toNamed(AppRoutes.myfavorite);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const ListCategoriesItems(),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  itemCount: controller.items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                  ),
                  itemBuilder: (context, index) {
                    controllerImpl
                            .isFavorite[controller.items[index]['items_id']] =
                        controller.items[index]["favorite"];
                    return CustomListItems(
                      items: ItemsModel.fromJson(
                        controller.items[index],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/view/widget/custom_appbar_home.dart';
import 'package:ecommerce_app/view/widget/home/custom_card_home.dart';
import 'package:ecommerce_app/view/widget/home/custom_list_categories_home.dart';
import 'package:ecommerce_app/view/widget/home/custom_list_items_home.dart';
import 'package:ecommerce_app/view/widget/home/custom_title_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());

    return
      GetBuilder<HomeControllerImpl>(
        builder: (controllerImpl) => HandlingDataView(
          statusRequest: controllerImpl.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppbarHome(
                  title: '22'.tr,
                  
                  search: () {}, onPressedIconfavorite: () {
                    Get.toNamed(AppRoutes.myfavorite);
                    },
                ),
                 CustomCardHome(
                    title: '25'.tr,
                     subTitle: '24'.tr),
                const SizedBox(
                  height: 20,
                ),
                const CustomListCategoriesHome(),
                const SizedBox(
                  height: 10,
                ),
                 CustomTitleHome(title: '25'.tr),
                const SizedBox(
                  height: 10,
                ),
                const CustomListItemsHome(),
                  CustomTitleHome(title: '26'.tr),
                const SizedBox(
                  height: 10,
                ),
                const CustomListItemsHome(),
                
              ],
            ),
          ),
        ),
      );
    
  }
}//SvgPicture.network( '${AppLink.catImage}/${controllerImpl.categories[index]['categories_image']},');

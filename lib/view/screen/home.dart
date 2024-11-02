import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
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
    HomeControllerImpl controllerImpl = Get.put(HomeControllerImpl());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          CustomAppbarHome(
            textEditingController: controllerImpl.search!,
            onChanged: (val) {
              controllerImpl.checkSearch(val);
            },
            title: '22'.tr,
            search: () {
              controllerImpl.onSearchItems();
            },
            onPressedIconfavorite: () {
              Get.toNamed(AppRoutes.myfavorite);
            },
          ),
          GetBuilder<HomeControllerImpl>(
              builder: (controllerImpl) => HandlingDataView(
                  statusRequest: controllerImpl.statusRequest,
                  widget: controllerImpl.isSearch
                      ? SearchListView(itemsData: controllerImpl.itemsData)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomCardHome(title: '25'.tr, subTitle: '24'.tr),
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
                        )))
        ],
      ),
    );
  }
} //SvgPicture.network( '${AppLink.catImage}/${controllerImpl.categories[index]['categories_image']},');

class SearchListView extends GetView<HomeControllerImpl> {
  const SearchListView({
    super.key,
    required this.itemsData,
  });
  final List<ItemsModel> itemsData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemsData.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: InkWell(
              onTap: () {
                controller.goToItemsDetails(itemsData[index]);
              },
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                '${AppLink.itemsImage}/${itemsData[index].itemsImage}'),
                      ),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('${itemsData[index].itemsName}'),
                            subtitle: Text('${itemsData[index].itemsPrice}\$'),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

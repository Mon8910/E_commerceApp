import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/function/translate_database.dart';
import 'package:ecommerce_app/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomListCategoriesHome extends GetView<HomeControllerImpl> {
  const CustomListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel: CategoriesModel.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImpl> {
  const Categories({super.key, required this.categoriesModel, required this.i});
  final CategoriesModel categoriesModel;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!,categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 191, 168, 166),
                borderRadius: BorderRadius.circular(10)),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.catImage}/${categoriesModel.categoriesImage}",
              // color: AppColor.primaryColor,
            ),
          ),
          Text(
            '${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}',
            style: const TextStyle(fontSize: 13, color: Colors.black),
          )
        ],
      ),
    );
  }
}

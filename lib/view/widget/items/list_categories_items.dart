import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/function/translate_database.dart';
import 'package:ecommerce_app/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImpl> {
  const ListCategoriesItems({super.key});

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

class Categories extends GetView<ItemsControllerImpl> {
  const Categories({super.key, required this.categoriesModel, required this.i});
  final CategoriesModel categoriesModel;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToItems(controller.categories, i!);
        controller.changeCat(i!,categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
       
          GetBuilder<ItemsControllerImpl>(builder: (controller)=>Container(
            padding:const EdgeInsets.symmetric(horizontal: 10),
            decoration:controller.selectedCat==i?
           const  BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 3,
                  color: AppColor.primaryColor
                )
              )
            ):null,
            child: Text(
              '${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}',
              style:  TextStyle(fontSize: 20, color: Colors.grey[800],fontWeight: FontWeight.bold),
            ),
          ))
        ],
      ),
    );
  }
}

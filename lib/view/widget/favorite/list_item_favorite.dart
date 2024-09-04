import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/controller/myfavorite_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/function/translate_database.dart';
import 'package:ecommerce_app/data/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemFavorite extends GetView<MyFavoriteController> {
  const ListItemFavorite({super.key, required this.favoriteModel});
  final FavoriteModel favoriteModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToItemsDetails(items);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "${favoriteModel.itemsName}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.itemsImage}/${favoriteModel.itemsImage}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                '${translateDatabase(favoriteModel.itemsNameAr, favoriteModel.itemsName)}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rating 3.5',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${favoriteModel.itemsPrice} \$",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sans'),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.removefromFavorirte(favoriteModel.favoriteId!);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColor.primaryColor,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

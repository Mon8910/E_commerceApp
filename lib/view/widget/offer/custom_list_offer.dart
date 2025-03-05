import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/controller/offer_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/function/translate_database.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListOffer extends GetView<OfferController> {
  const CustomListOffer({super.key, required this.items});
  final ItemsModel items;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToItemsDetails(items);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${items.itemsName}",
                    child: CachedNetworkImage(
                      imageUrl: "${AppLink.itemsImage}/${items.itemsImage}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    '${translateDatabase(items.itemsNameAr, items.itemsName)}',
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
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${items.itemsDiscounts} \$",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sans'),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[items.itemsId] == 1) {
                              controller.setFavorite(items.itemsId, 0);
                              controller.removeFavorirte(items.itemsId);
                            } else {
                              controller.setFavorite(items.itemsId, 1);
                              controller.addFavorirte(items.itemsId);
                            }
                          },
                          icon: Icon(
                            controller.isFavorite[items.itemsId] == 1
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            if(items.itemsDiscount != 0)
            Positioned(
              top: 4,
              left: 4,
              child: Image.asset(
                'assets/images/sale.png',
                width: 40,
              ),
            ),
            
              
            
          ],
        ),
      ),
    );
  }
}

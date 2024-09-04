import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomItemsCart extends StatelessWidget {
  const CustomItemsCart(
      {super.key,
      required this.image,
      required this.title,
      required this.count,
      required this.price,
      required this.add,
      required this.remove});
  final String image;
  final String title;
  final String price;
  final String count;
  final void Function() add;
  final void Function() remove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        imageUrl: '${AppLink.itemsImage}/$image',
                      )),
                  Expanded(
                      flex: 3,
                      child: ListTile(
                        title: Text(title),
                        subtitle: Text(
                          price,
                          style: const TextStyle(color: AppColor.primaryColor),
                        ),
                      )),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        height: 35,
                        child: IconButton(
                            onPressed: add, icon: const Icon(Icons.add)),
                      ),
                      Container(
                        height: 30,
                        child: Text(
                          count,
                          style: const TextStyle(fontFamily: 'sans'),
                        ),
                      ),
                      Container(
                        height: 25,
                        child: IconButton(
                            onPressed: remove, icon: const Icon(Icons.remove)),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

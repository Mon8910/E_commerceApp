import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/view/widget/language_widets/custom_button_language.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  const CustomBottomNavigatorBar(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalPrice});
  final String price;
  final String shipping;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'price',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  price,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'shipping',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  shipping,
                  style:const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'total',
                  style: TextStyle(fontSize: 18, color: AppColor.primaryColor),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  totalPrice,
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButtonLanguage(
            title: 'place order',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

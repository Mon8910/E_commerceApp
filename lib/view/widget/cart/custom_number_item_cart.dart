import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomNumberItemCart extends StatelessWidget{
  const CustomNumberItemCart({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.only(bottom: 4),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Text(
                title,
                style:const TextStyle(
                  color: AppColor.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            );
  }

}
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomDeliveryType extends StatelessWidget {
  const CustomDeliveryType({
    super.key,
    required this.title,
    required this.image,
    required this.isActive,
  });
  final String title;
  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.secoundColor,
        ),
        color: isActive ? AppColor.secoundColor : Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 60,
            color:isActive? Colors.white:null,
          ),
           Text(
            title
            ,
            style: TextStyle(
              color:isActive? Colors.white: AppColor.secoundColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

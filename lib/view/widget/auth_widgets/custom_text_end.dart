import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextEnd extends StatelessWidget {
  const CustomTextEnd({super.key, required this.title1, required this.title2, required this.onTap});
  final String title1;
  final String title2;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title1),
        GestureDetector(
          onTap:onTap ,
          child: Text(
            title2,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
                fontSize: 18),
          ),
        )
      ],
    );
  }
}

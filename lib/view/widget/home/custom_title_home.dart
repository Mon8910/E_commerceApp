import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  const CustomTitleHome({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      // 'Product for you'
      style: const TextStyle(
        fontSize: 20,
        color: AppColor.primaryColor,
      ),
    );
  }
}

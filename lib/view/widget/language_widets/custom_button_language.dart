import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomButtonLanguage extends StatelessWidget {
  const CustomButtonLanguage(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      color: AppColor.primaryColor,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

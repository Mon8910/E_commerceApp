import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: AppColor.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 12),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

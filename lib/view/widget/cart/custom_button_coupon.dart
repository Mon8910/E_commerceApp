import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  const CustomButtonCoupon(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
     // padding: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      color: AppColor.primaryColor,
      child: MaterialButton(
        height: 1,
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

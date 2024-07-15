import 'package:ecommerce_app/core/constant/app_assets.dart';
import 'package:flutter/material.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      child: ClipOval(
        child: Image.asset(
          AppAssets.logoAuth,
          height: 170,
        ),
      ),
    );
  }
}

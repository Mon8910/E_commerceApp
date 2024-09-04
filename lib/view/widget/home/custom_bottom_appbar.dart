import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomBottomAppbar extends StatelessWidget {
  const CustomBottomAppbar({
    super.key,
    required this.onPressed,
    required this.title,
    required this.iconData,
    required this.isActive,
  });
  final void Function() onPressed;
  final String title;
  final IconData iconData;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: isActive == true ? AppColor.primaryColor : Colors.black,
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive == true ? AppColor.primaryColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

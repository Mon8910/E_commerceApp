import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.grey[50],
    titleTextStyle: const TextStyle(
      color: AppColor.primaryColor,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    iconTheme:const IconThemeData(color: AppColor.primaryColor)
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  fontFamily: 'PlayfairDisplay',
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
      bodyMedium: TextStyle(
          fontSize: 16,
          height: 2,
          fontWeight: FontWeight.bold,
          color: AppColor.grey)),
);
ThemeData themeArabic = ThemeData(
  fontFamily: 'Cairo',
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
      bodyMedium: TextStyle(
          fontSize: 16,
          height: 2,
          fontWeight: FontWeight.bold,
          color: AppColor.grey)),
);

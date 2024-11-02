import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomCardAddress extends StatelessWidget{
  const CustomCardAddress({super.key, required this.title, required this.subTitle, required this.isActive,});
  final String title;
  final String subTitle;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Card(
              color:isActive? AppColor.secoundColor:null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child:  ListTile(
                title: Text(
                title  ,
                  style: TextStyle(color:isActive? Colors.white : null),
                ),
                subtitle: Text(subTitle,
                    style: TextStyle(color:isActive? Colors.white : null)),
              ),
            );
  }

}
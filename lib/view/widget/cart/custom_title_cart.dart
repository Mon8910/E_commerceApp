import 'package:flutter/material.dart';

class CustomTitleCart extends StatelessWidget{
  const CustomTitleCart({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
   return  Row(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                )),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child:  Text(
                     title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Spacer()
              ],
            );
  }

}
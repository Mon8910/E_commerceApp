import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomPrice extends StatelessWidget{
  const CustomPrice({super.key, required this.price, required this.number, required this.add, required this.remove});
  final String price;
  final String number;
final void Function() add;
final void Function() remove;

  @override
  Widget build(BuildContext context) {
   return Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: add,
                            icon: const Icon(Icons.add),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            padding:const EdgeInsets.only(bottom: 3),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child:  Text(
                              '$number',
                              style:const TextStyle(fontSize: 20, height: 1.1),
                            ),
                          ),
                          IconButton(
                            onPressed: remove,
                            icon: const Icon(Icons.remove),
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "${price} \$",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 30,
                            height: 1.1),
                      )
                    ],
                  );
  }

}
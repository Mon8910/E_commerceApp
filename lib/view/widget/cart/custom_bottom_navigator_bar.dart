import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/view/widget/cart/custom_button_coupon.dart';
import 'package:ecommerce_app/view/widget/language_widets/custom_button_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigatorBar extends GetView<CartController> {
  const CustomBottomNavigatorBar(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalPrice,
      required this.couponController,
      required this.onPressed, required this.placeOrder});
  final String price;
  final String shipping;
  final String totalPrice;
  final TextEditingController couponController;
  final void Function() onPressed;
  final void Function() placeOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            GetBuilder<CartController>(builder: (controller)=> 
           controller.couponName==null? 
            Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: couponController,
                    decoration: const InputDecoration(
                        hintText: 'Enter coupon',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        isDense: true),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 1,
                    child: CustomButtonCoupon(
                      onPressed: onPressed,
                      title: 'Apply',
                    ))
              ],
            ),
          ) :
          Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'Coupon Name',
                        style: TextStyle(fontSize: 18,color: AppColor.primaryColor),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '${controller.couponName}',
                        style:const TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                )
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'price',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        price,
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'disscount',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        shipping,
                        style: const TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'total',
                        style: TextStyle(
                            fontSize: 18, color: AppColor.primaryColor),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        totalPrice,
                        style: const TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButtonLanguage(
            title: 'place order',
            onPressed: (){
              controller.goToCheckout();
             
            },
          )
        ],
      ),
    );
  }
}

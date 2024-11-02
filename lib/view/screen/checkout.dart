import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/view/widget/checkout/custom_card_address.dart';
import 'package:ecommerce_app/view/widget/checkout/custom_delivery_type.dart';
import 'package:ecommerce_app/view/widget/checkout/custom_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            onPressed: () {
              checkoutController.checkout();
            },
            textColor: Colors.white,
            color: AppColor.secoundColor,
            child: const Text('Checkout'),
          ),
        ),
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      const Text(
                        'Choose Payment Method',
                        style: TextStyle(
                            color: Color.fromARGB(255, 42, 16, 13),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            controller.choosePayment(0);
                          },
                          child: CustomPaymentMethod(
                              title: 'Cash on Delivery',
                              isActive: controller.paymentMetods == 0
                                  ? true
                                  : false)),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.choosePayment(1);
                        },
                        child: CustomPaymentMethod(
                            title: 'Payments Card',
                            isActive: controller.paymentMetods == 1
                                ? true
                                : false),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Choose Delivery Type',
                        style: TextStyle(
                            color: AppColor.secoundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.chooseDelivery(0);
                            },
                            child: CustomDeliveryType(
                                title: 'Delivery',
                                image: 'assets/images/006-delivery.png',
                                isActive:
                                    controller.deliveryMetohds == 0
                                        ? true
                                        : false),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              controller.chooseDelivery(1);
                            },
                            child: CustomDeliveryType(
                                title: 'Delivery Thru',
                                image: 'assets/images/drivethru.png',
                                isActive:
                                    controller.deliveryMetohds == 1
                                        ? true
                                        : false),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (controller.deliveryMetohds == 0)
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Choose Shiping Address',
                              style: TextStyle(
                                  color: AppColor.secoundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ...List.generate(controller.data.length, (index) {
                              return InkWell(
                                onTap: () {
                                  controller.chooseAddress(controller
                                      .data[index].addressId!
                                     );
                                },
                                child: CustomCardAddress(
                                    title:
                                        '${controller.data[index].addressName}',
                                    subTitle:
                                        '${controller.data[index].addressStreet} ${controller.data[index].addressCity}',
                                    isActive: controller.addressMetohds ==
                                            controller.data[index].addressId
                                                
                                        ? true
                                        : false),
                              );
                            }),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        )

                    ],
                  ),
                ))));
  }
}

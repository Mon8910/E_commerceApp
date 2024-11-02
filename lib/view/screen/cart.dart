import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/view/widget/cart/custom_bottom_navigator_bar.dart';
import 'package:ecommerce_app/view/widget/cart/custom_items_cart.dart';
import 'package:ecommerce_app/view/widget/cart/custom_number_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) => CustomBottomNavigatorBar(
          placeOrder: () {
            Get.toNamed(AppRoutes.checkout);
          },
          price: '${cartController.priceOrders}\$',
          shipping: '${cartController.couponDiscount}%',
          totalPrice: '${cartController.getTotalPrice()}\$',
          couponController: cartController.couponText!,
          onPressed: () {
            cartController.addCoupon();
          },
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomNumberItemCart(
                  title: 'you have ${controller.countItems} items in order'),
              ...List.generate(
                controller.data.length,
                (index) => CustomItemsCart(
                  add: () async {
                    await cartController
                        .addCart(controller.data[index].itemsId);
                    cartController.refreshPage();
                  },
                  remove: () async {
                    await cartController
                        .removeCart(controller.data[index].itemsId);
                    cartController.refreshPage();
                  },
                  image: "${controller.data[index].itemsImage}",
                  title: "${controller.data[index].itemsName}",
                  count: "${controller.data[index].countiems}",
                  price:
                      "${controller.data[index].itemsprice!.floorToDouble()}",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

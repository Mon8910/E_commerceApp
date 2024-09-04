import 'package:ecommerce_app/controller/home_screen_controller.dart';
import 'package:ecommerce_app/view/widget/home/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppbarHomescreen extends StatelessWidget {
  const CustomBottomAppbarHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImpl>(
        builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.listpage.length + 1, (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : CustomBottomAppbar(
                            onPressed: () {
                              controller.changePage(i);
                            },
                            title: controller.titleIcon[i],
                            iconData: controller.icons[i],
                            isActive:
                                controller.currentPage == i ? true : false,
                          );
                  })
                ],
              ),
            ));
  }
}

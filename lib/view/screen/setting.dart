import 'package:ecommerce_app/controller/setting_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller =Get.put(SettingController());
    return  ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primaryColor,
              ),
              Positioned(
                top: Get.width / 3.5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage:
                        const AssetImage('assets/images/avatar.png'),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Disable Notifications'),
                  trailing: Switch(
                    onChanged: (value) {},
                    value: true,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.addressView);
                  },
                  child: const ListTile(
                    title: Text('Address'),
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.pendingOrders);
                  },
                  child: const ListTile(
                    title: Text('orders'),
                    trailing: Icon(Icons.card_giftcard_outlined),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.archiveOrders);
                  },
                  child: const ListTile(
                    title: Text('archive'),
                    trailing: Icon(Icons.archive),
                  ),
                ),
                const ListTile(
                  title: Text('About us'),
                  trailing: Icon(Icons.help_outline_rounded),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse("tel:01022492218"));
                  },
                  child: const ListTile(
                    title: Text('Contact us'),
                    trailing: Icon(Icons.phone_callback_outlined),
                  ),
                ),
                InkWell(
                  child: ListTile(
                    onTap: () {
                      controller.logout();

                    },
                    title: const Text('Logout'),
                    trailing:const Icon(Icons.logout),
                  ),
                ),
              ],
            ),
          )
        ],
      
    );
  }
}

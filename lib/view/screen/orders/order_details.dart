import 'package:ecommerce_app/controller/orders/order_details_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Order Details'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GetBuilder<OrderDetailsController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Table(
                              children:  [
                              const  TableRow(children: [
                                  Text(
                                    'Item',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor),
                                  ),
                                  Text(
                                    'QTY',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor),
                                  ),
                                  Text(
                                    'Price',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor),
                                  )
                                ]),
                                
                                ...List.generate(controller.data.length, (index)=> TableRow(children: [
                                  Text(
                                    '${controller.data[index].itemsName}',
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                   '${controller.data[index].countiems}',
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '${controller.data[index].itemsprice}\$',
                                    textAlign: TextAlign.center,
                                  )
                                ]),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child:  Text(
                              'Price: ${controller.ordersModel.ordersTotalPrice}\$',
                              textAlign: TextAlign.center,
                              style:const TextStyle(color: AppColor.primaryColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                     if(controller.ordersModel.ordersType==0)   Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const ListTile(
                              title: Text(
                                'Shipping Address',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                              subtitle: Text('el knoz moharm beek'),
                            ),
                          ),
                        ),
                      if(controller.ordersModel.ordersType==0)  Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 300,
                            width: double.infinity,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              markers: controller.markers.toSet(),
                              initialCameraPosition: controller.kGooglePlex!,
                              onMapCreated:
                                  (GoogleMapController controllerMap) {
                                controller.completercontroller!
                                    .complete(controllerMap);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }
}

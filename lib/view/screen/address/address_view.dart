import 'package:ecommerce_app/controller/address/address_view_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addressAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            child: ListView.builder(
              itemCount: controller.data.length
              ,itemBuilder: (context,index){
              return CardAddressView(addressModel: controller.data[index],onPressed: () {
                controller.deleteAddress(controller.data[index].addressId!);
              },);
            }),
          ),
        ),
      ),
    );
  }
}


class CardAddressView extends StatelessWidget{
  const CardAddressView({super.key, required this.addressModel, required this.onPressed});
  final AddressModel addressModel;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding:const EdgeInsets.all(20),
        child: ListTile(
          title: Text(addressModel.addressName!),
          subtitle: Text("${addressModel.addressStreet} ${addressModel.addressCity}"),
          trailing: IconButton(onPressed: onPressed, icon:const Icon(Icons.delete_forever_outlined)),
        ),
      ),
    );
  }

}

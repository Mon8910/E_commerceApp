import 'package:ecommerce_app/controller/address/add_address_parttwo_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/shared/custom_button.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    
        Get.put(AddAddressParttwoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address Details'),
      ),
      body: GetBuilder<AddAddressParttwoController>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            CustomTextFormField(
                title: 'city',
                hint: 'Enter the city',
                iconData: Icons.location_city,
                controller: controller.city!,
                validator: (val) {},
                isNumber: false),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                title: 'street',
                hint: 'Enter the street',
                iconData: Icons.streetview_outlined,
                controller: controller.street!,
                validator: (val) {},
                isNumber: false),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                title: 'name',
                hint: 'Enter the name',
                iconData: Icons.near_me,
                controller: controller.name!,
                validator: (val) {},
                isNumber: false),
                const SizedBox(height: 30,),
            CustomButton(
              title: 'Add',
              onPressed: () {
                controller.addAddress();
              },
            )
          ],
        ),
      ),))
    );
  }
}

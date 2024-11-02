import 'package:ecommerce_app/controller/address/add_address_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      body: Container(
        child: GetBuilder<AddAddressController>(
          builder: (controllerPage) => HandlingDataView(
            statusRequest: controllerPage.statusRequest,
            widget: Stack(
              alignment: Alignment.center,
              children: [
                if (controllerPage.kGooglePlex != null)
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height, // Set height here
                    child: GoogleMap(
                      onTap: (latlong) {
                        controllerPage.addMarkers(latlong);
                      },
                      mapType: MapType.normal,
                      markers: controllerPage.markers.toSet(),
                      initialCameraPosition: controllerPage.kGooglePlex!,
                      onMapCreated: (GoogleMapController controllerMap) {
                        controllerPage.completercontroller!.complete(controllerMap);
                      },
                    ),
                  ),
                Positioned(
                  bottom: 10,
                  child: MaterialButton(
                    onPressed: () {
                      controllerPage.goTopageAddDetails();
                    },
                    minWidth: 100,
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    child: Text('Complete'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

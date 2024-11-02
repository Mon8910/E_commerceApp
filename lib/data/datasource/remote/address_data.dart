import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getAddress(int userid) async {
    var response = await crud.postRequest(AppLink.viewAddress, {
      "userid":userid.toString()

    });
    return response.fold((l) => l, (r) => r);
  }

  addAddress(int userid, String name , String city, String street,String lat,String long) async {
    var response = await crud.postRequest(AppLink.addAddress, {
       "userid":userid.toString(),
       "name":name,
       "city":city,
       "street":street,
       "lat":lat.toString(),
       "long":long.toString()


    });
    return response.fold((l) => l, (r) => r);
  }

  editAddress() async {
    var response = await crud.postRequest(AppLink.editAddress, {});
    return response.fold((l) => l, (r) => r);
  }

  removeAddress(int addressid) async {
    var response = await crud.postRequest(AppLink.deleteAddress, {
      "addressid":addressid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}

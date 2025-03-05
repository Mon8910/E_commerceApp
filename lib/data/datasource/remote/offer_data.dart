import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class OfferData {
  Crud crud;
  OfferData(this.crud);
  getData() async {
    var response = await crud.postRequest(AppLink.offer, {});
    return response.fold((l) => l, (r) => r);
  }
}

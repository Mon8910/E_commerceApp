import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postRequest(AppLink.addCart, {});
    return response.fold((l) => l, (r) => r);
  }
}

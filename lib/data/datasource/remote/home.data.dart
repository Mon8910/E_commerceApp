import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
  getData()async{
    var response = await crud.postRequest(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }
}
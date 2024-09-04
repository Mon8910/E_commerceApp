import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(int id,int userid) async {
    var response = await crud.postRequest(
      AppLink.items,
      {
        "id": id.toString(),
        "usersid":userid.toString()
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

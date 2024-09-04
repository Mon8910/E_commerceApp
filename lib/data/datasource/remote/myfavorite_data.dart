import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  addFavorite(int userid) async {
    var response = await crud.postRequest(
      AppLink.viewFavorite,
      {
        "id": userid.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
  
  removefromFavorite(int id) async {
    var response = await crud.postRequest(
      AppLink.deleteFromFavorite,
      {
        "id": id.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

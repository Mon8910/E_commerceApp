import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class FavoriteData{
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(int userid,int id) async {
    var response = await crud.postRequest(
      AppLink.addFavrite,
      {
        "usersid": userid.toString(),
        "itemsid":id.toString()
      },
    );
    return response.fold((l) => l, (r) => r);
  }
  removeFavorite(int userid,int id) async {
    var response = await crud.postRequest(
      AppLink.removeFavrite,
      {
        "usersid": userid.toString(),
        "itemsid":id.toString()
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
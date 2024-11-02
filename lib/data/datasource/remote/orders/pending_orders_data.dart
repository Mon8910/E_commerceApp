import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class PendingOrdersData {
  Crud crud;
  PendingOrdersData(this.crud);
  getData(int userid) async {
    var response = await crud
        .postRequest(AppLink.pendingOrders, {"id": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

   deleteOrders(int ordersid) async {
    var response = await crud
        .postRequest(AppLink.deleteorders, {"id": ordersid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}

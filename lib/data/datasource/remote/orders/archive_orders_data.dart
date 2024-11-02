import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class ArchiveOrdersData {
  Crud crud;
  ArchiveOrdersData(this.crud);
  getData(int userid) async {
    var response = await crud
        .postRequest(AppLink.archiveOrders, {"id": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}

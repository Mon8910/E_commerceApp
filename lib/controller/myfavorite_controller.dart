import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommerce_app/data/model/favorite_model.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  List<FavoriteModel> data = [];
  late StatusRequest statusRequest;
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  MyServices myServices = Get.find();

  getFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .addFavorite(myServices.sharedPreferences.getInt('id')!);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      // items.addAll(response['data']);
      List responseDaata = response['data'];
      data.addAll(
        responseDaata.map(
          (e) => FavoriteModel.fromJson(e),
        ),
      );
      print("==========================mmmmmm$data");
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  removefromFavorirte(int id) {
 
    
    var response = favoriteData.removefromFavorite(id);

    data.removeWhere(
      (element) => element.favoriteId == id,
    );

    update();
  }

  @override
  void onInit() {
    getFavorite();
    super.onInit();
  }
}

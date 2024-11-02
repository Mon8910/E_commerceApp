import 'package:ecommerce_app/core/class/crud.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  getData(int userid, int addressid, int orderstype, int pricedelivery,
      num ordersprice, int couponid, int paymentmethods,int coupondisscounts) async {
    var response = await crud
        .postRequest('http://10.0.2.2/ecommerce/orders/checkout.php', {
      "userid": userid.toString(),
      "addressid": addressid.toString(),
      "orderstype": orderstype.toString(),
      "pricedelivery": pricedelivery.toString(),
      "ordersprice": ordersprice.toString(),
      "couponid": couponid.toString(),
      "paymentmethods": paymentmethods.toString(),
      "coupondisscount":coupondisscounts.toString()
    });

    print('response is ${response}');
    // print('ggg ${response.statusCode}');
    return response.fold((l) => l, (r) => r);
  }
}



//  "userid": myServices.sharedPreferences.getInt('id').toString(),
//       "addressid": addressMetohds.toString(),
//       "orderstype": deliveryMetohds.toString(),
//       "pricedelivery": 123.toString(),
//       "ordersprice": priceorders.toString(),
//       "couponid": couponid.toString(),
//       "paymentmethods": paymentMetods.toString()
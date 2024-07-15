import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class VeriftyCodeData {
  Crud crud;
  VeriftyCodeData(this.crud);
  postDtat(
    String verifyCode,
    String email,
  ) async {
    var response = await crud.postRequest(AppLink.veriftySignupLink, {
      "verifyvode": verifyCode,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}

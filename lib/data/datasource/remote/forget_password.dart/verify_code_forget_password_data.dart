import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postDtat(
    String email,
    String verifycode,
  ) async {
    var response = await crud.postRequest(AppLink.veriftyForgetpasswordLink, {
      "email": email,
      "verifyvode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}

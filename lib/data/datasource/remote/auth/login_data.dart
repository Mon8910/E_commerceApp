import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postDtat(
    String email,
    String password,
  ) async {
    var response = await crud.postRequest(AppLink.loginLink, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
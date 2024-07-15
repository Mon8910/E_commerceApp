import 'package:ecommerce_app/app_link.dart';
import 'package:ecommerce_app/core/class/crud.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postDtat(
    String username,
    String email,
    String phone,
    String password,
  ) async {
    var response = await crud.postRequest(AppLink.signupLink, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}

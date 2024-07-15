import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController{
  goToLogin();
}
class SuccessSignUpControllerImpl extends SuccessSignUpController{
  @override
  goToLogin() {
   Get.offAllNamed(AppRoutes.login);
  }

}
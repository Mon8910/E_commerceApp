import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{
  goToLogin();
}
class SuccessResetPasswordControllerImpl extends SuccessResetPasswordController{
  @override
  goToLogin() {
   Get.offAllNamed(AppRoutes.login);
  }

}
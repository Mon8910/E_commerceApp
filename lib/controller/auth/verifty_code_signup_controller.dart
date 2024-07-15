import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/verifty_code_data.dart';
import 'package:get/get.dart';

abstract class VeriftyCodeSignupController extends GetxController {
  goToSuccessSignup(String veriftyCodeSignUp);
  checkCode();
}

class VeriftyCodeSignupControllerImpl extends VeriftyCodeSignupController {
  String? email;
  VeriftyCodeData veriftyCodeData = VeriftyCodeData(Get.find());
  late StatusRequest statusRequest;

  @override
  checkCode() {}

  @override
  goToSuccessSignup(veriftyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    var response = await veriftyCodeData.postDtat(veriftyCodeSignUp, email!);
    print('======================= $response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      //data.addAll(response);
      Get.offNamed(
        AppRoutes.successSignup,
      );
    } else {
      Get.defaultDialog(title: 'warning', middleText: 'this code is incorrect');
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}

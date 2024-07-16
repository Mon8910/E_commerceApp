import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/forget_password.dart/verify_code_forget_password_data.dart';
import 'package:get/get.dart';

abstract class VerifyController extends GetxController {
  goToResetPassword(String veriftyCode);
  checkCode();
}

class VerifyControllerImpl extends VerifyController {
  String? email;
  late StatusRequest statusRequest;
  VerifyCodeForgetPasswordData veriftyCodeData=VerifyCodeForgetPasswordData(Get.find());

  @override
  checkCode() {
    
  }

  @override
  goToResetPassword(veriftyCode) async{
    //Get.offNamed(AppRoutes.resetPassword);
    statusRequest = StatusRequest.loading;
    var response = await veriftyCodeData.postDtat(email!,veriftyCode);
    print('======================= $response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      //data.addAll(response);
      Get.offNamed(AppRoutes.resetPassword, arguments: {'email': email});
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

  

 


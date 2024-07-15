import 'package:ecommerce_app/controller/auth/verifty_code_signup_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VeriftyCodeSignUp extends StatelessWidget {
  const VeriftyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    VeriftyCodeSignupControllerImpl controllerImpl=Get.put(VeriftyCodeSignupControllerImpl());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            ' Forget Password',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              const CustomTitleAuth(title: 'Check code'),
              const SizedBox(
                height: 20,
              ),
              const CustomBodyauth(
                body: 'Please Enter The Digit Code Sent To ayman@gmail.com',
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                numberOfFields: 5,
                borderRadius: BorderRadius.circular(15),

                showFieldAsBox: true,

                onCodeChanged: (String code) {},
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controllerImpl.goToSuccessSignup(verificationCode);
                 
                }, // end onSubmit
              ),
            const  SizedBox(
                height: 40,
              ),
              
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }
}

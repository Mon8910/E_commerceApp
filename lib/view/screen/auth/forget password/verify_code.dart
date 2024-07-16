import 'package:ecommerce_app/controller/auth/verifty_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyControllerImpl controllerImpl=Get.put(VerifyControllerImpl());
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
               CustomBodyauth(
                body: 'Please Enter The Digit Code Sent To ${controllerImpl.email}',
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
                  controllerImpl.goToResetPassword(verificationCode);
                 
                }, // end onSubmit
              ),
            const  SizedBox(
                height: 40,
              ),
              CustomButtonAuth(
                title: 'check',
                onPressed: () {},
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }
}

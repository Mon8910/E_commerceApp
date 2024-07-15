import 'package:ecommerce_app/controller/auth/success_sign_up_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImpl controllerImpl=Get.put(SuccessSignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Success',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTitleAuth(title: 'congratulations'),
            const SizedBox(
              height: 15,
            ),
            const CustomBodyauth(body: 'successfully registered'),
            const Spacer(),
            Container(
                width: double.infinity,
                child:
                    CustomButtonAuth(title: 'Go To Login', onPressed: () {
                      controllerImpl.goToLogin();

                    })),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

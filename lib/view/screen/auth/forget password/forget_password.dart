import 'package:ecommerce_app/controller/auth/forget_password_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/function/valid_input.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImpl conntroller =
        Get.put(ForgetPasswordControllerImpl());
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
          child: Form(
            key: conntroller.formState,
            child: ListView(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const CustomTitleAuth(title: 'Check email'),
                const SizedBox(
                  height: 20,
                ),
                const CustomBodyauth(
                  body:
                      'Sign up With Your Email And password Or Continue With Social Media',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  isNumber: false,
                  validator: (value) {
                    return validInput(value!, 5, 100, "email");
                  },
                  controller: conntroller.email,
                  title: 'Email',
                  hint: 'enter your email',
                  iconData: Icons.email_outlined,
                ),
                CustomButtonAuth(
                  title: 'check',
                  onPressed: () {
                    conntroller.goToverifty();
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }
}

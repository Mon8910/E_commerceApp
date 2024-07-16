import 'package:ecommerce_app/controller/auth/reset_password_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/function/valid_input.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImpl conntroller =
        Get.put(ResetPasswordControllerImpl());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            ' Reset Password',
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
                const CustomTitleAuth(title: 'New Password'),
                const SizedBox(
                  height: 20,
                ),
                const CustomBodyauth(body: 'please enter new password'),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  isNumber: false,
                  validator: (value) {
                    return validInput(value!, 5, 30, "password");
                  },
                  controller: conntroller.password,
                  title: 'password',
                  hint: 'enter your password',
                  iconData: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  isNumber: false,
                  validator: (value) {
                    return validInput(value!, 5, 30, "password");
                  },
                  controller: conntroller.rePassword,
                  title: 'password',
                  hint: 'enter your re password',
                  iconData: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButtonAuth(
                  title: 'check',
                  onPressed: () {
                    conntroller.goToSucceseRestPassword();
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

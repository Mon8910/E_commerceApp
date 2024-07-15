import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/function/altert_exit_app.dart';
import 'package:ecommerce_app/core/function/valid_input.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_logo_auth.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_text_end.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/view/widget/auth_widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImpl conntroller = Get.put(LoginControllerImpl());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '2'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(onWillPop:altretExitApp ,child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Form(
            key: conntroller.formState,
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 15,
                ),
                CustomTitleAuth(title: '6'.tr),
                const SizedBox(
                  height: 20,
                ),
                CustomBodyauth(
                  body: '3'.tr,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomLogoAuth(),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  isNumber: false,
                  validator: (value) {
                    return validInput(value!, 5, 100, "email");
                    
                  },
                  controller: conntroller.email,
                  title: '4'.tr,
                  hint: '7'.tr,
                  iconData: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 25,
                ),
                GetBuilder<LoginControllerImpl>(builder: (showpass)=>
                CustomTextFormField(isNumber: false,
                  validator: (value) {
                    return validInput(value!, 5, 30, "password");
                  },
                  obscuretext:showpass.isShowPassword ,
                  onTap:
                  (){
                     showpass.showPassword();
                  },
                  controller: conntroller.password,
                  title: '5'.tr,
                  hint: '8'.tr,
                  iconData: Icons.lock_outline,
                ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    conntroller.goToForgetPassword();
                  },
                  child:  Text(
                    '9'.tr,
                    style: TextStyle(color: AppColor.grey),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonAuth(
                  title: '10'.tr,
                  onPressed: () {
                    conntroller.login();
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextEnd(
                  onTap: () {
                    conntroller.goToSignup();
                  },
                  title1: "11".tr,
                  title2: '12'.tr,
                )
              ],
            ),
          ),
        )));
  }
}

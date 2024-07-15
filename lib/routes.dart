import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/middleware/my_middleware.dart';
import 'package:ecommerce_app/view/screen/auth/forget%20password/forget_password.dart';
import 'package:ecommerce_app/view/screen/auth/forget%20password/reset_password.dart';
import 'package:ecommerce_app/view/screen/auth/forget%20password/verify_code.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/signup.dart';
import 'package:ecommerce_app/view/screen/auth/forget%20password/success_reset_password.dart';
import 'package:ecommerce_app/view/screen/auth/success_signup.dart';
import 'package:ecommerce_app/view/screen/auth/verifty_code_sign_up.dart';
import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/screen/language.dart';
import 'package:ecommerce_app/view/screen/onboarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name:'/',
    page: () => const Language(),
    middlewares: [MyMiddleware()]
  ),
  
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnboardingScreen(),
  ),
  GetPage(
    name: AppRoutes.signup,
    page: () => const Signup(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successSignup,
    page: () => const SuccessSignup(),
  ),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoutes.veriftyCodeSignUp,
    page: () => const VeriftyCodeSignUp(),
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => const Home(),
  ),
];

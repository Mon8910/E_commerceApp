import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/middleware/my_middleware.dart';
import 'package:ecommerce_app/view/screen/address/add_address2.dart';
import 'package:ecommerce_app/view/screen/address/address_add.dart';
import 'package:ecommerce_app/view/screen/address/address_view.dart';
import 'package:ecommerce_app/view/screen/auth/forget%20password/forget_password.dart';
import 'package:ecommerce_app/view/screen/auth/forget%20password/reset_password.dart';
import 'package:ecommerce_app/view/screen/auth/forget%20password/success_reset_password.dart';
import 'package:ecommerce_app/view/screen/auth/forget%20password/verify_code.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/signup.dart';
import 'package:ecommerce_app/view/screen/auth/success_signup.dart';
import 'package:ecommerce_app/view/screen/auth/verifty_code_sign_up.dart';
import 'package:ecommerce_app/view/screen/cart.dart';
import 'package:ecommerce_app/view/screen/checkout.dart';
import 'package:ecommerce_app/view/screen/favorite.dart';
import 'package:ecommerce_app/view/screen/home_screen.dart';
import 'package:ecommerce_app/view/screen/items_details.dart';
import 'package:ecommerce_app/view/screen/items_screen.dart';
import 'package:ecommerce_app/view/screen/language.dart';
import 'package:ecommerce_app/view/screen/onboarding.dart';
import 'package:ecommerce_app/view/screen/orders/archive_order.dart';
import 'package:ecommerce_app/view/screen/orders/order_details.dart';
import 'package:ecommerce_app/view/screen/orders/pending_order.dart';
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
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.items,
    page: () => const ItemsScreen(),
  ),
  GetPage(
    name: AppRoutes.itemsDetaisl,
    page: () => const ItemsDetails(),
  ),
  GetPage(
    name: AppRoutes.myfavorite,
    page: () => const Favorite(),
  ),
  GetPage(
    name: AppRoutes.cart,
    page: () => const Cart(),
  ),
  GetPage(
    name: AppRoutes.addressView,
    page: () => const AddressView(),
  ),
  GetPage(
    name: AppRoutes.addressAdd,
    page: () => const AddressAdd(),
  ),
  GetPage(
    name: AppRoutes.checkout,
    page: () => const Checkout(),
  ),
  GetPage(
    name: AppRoutes.addressAdd2,
    page: () => const AddAddressDetails(),
  ),
  GetPage(
    name: AppRoutes.pendingOrders,
    page: () => const PendingOrder(),
  ),
  GetPage(
    name: AppRoutes.archiveOrders,
    page: () => const ArchiveOrder(),
  ),
  GetPage(
    name: AppRoutes.orderDetails,
    page: () => const OrderDetails(),
  ),
];

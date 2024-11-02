class AppLink {
  static const String baseUrl = 'http://10.0.2.2/ecommerce';
  static const String baseImage = 'http://10.0.2.2/ecommerce/upload';
  static const String catImage = 'http://10.0.2.2/ecommerce/upload/categories';
  static const String itemsImage = 'http://10.0.2.2/ecommerce/upload/items';
  /////////auth
  static const String signupLink = '$baseUrl/auth/signup.php';
  static const String loginLink = '$baseUrl/auth/login.php';
  static const String veriftySignupLink = '$baseUrl/auth/veriftycode.php';
  static const String resendCode = '$baseUrl/auth/resend.php';
  ///////////forgetpassword//////////
  static const String checkemail = '$baseUrl/forgetpassword/checkemail.php';

  static const String veriftyForgetpasswordLink =
      '$baseUrl/forgetpassword/veriftycode.php';

  static const String resestpassword =
      '$baseUrl/forgetpassword/resetpassword.php';

  /////////home
  static const String home = '$baseUrl/home.php';
  static const String items = '$baseUrl/items/items.php';
  static const String search = '$baseUrl/items/search.php';

  ////favorite
  static const String addFavrite = '$baseUrl/favorite/add.php';
  static const String removeFavrite = '$baseUrl/favorite/remove.php';
  static const String viewFavorite = '$baseUrl/favorite/view.php';
  static const String deleteFromFavorite =
      '$baseUrl/favorite/deletefromfavorite.php';
  //// cart
  static const String addCart = '$baseUrl/cart/addcart.php';
  static const String removeCart = '$baseUrl/cart/deletecart.php';
  static const String getCountCart = '$baseUrl/cart/getcount.php';
  static const String viewCart = '$baseUrl/cart/view.php';
  static const String coupon = '$baseUrl/coupon/checkcoupon.php';
  //address
  static const String addAddress = '$baseUrl/address/add.php';
  static const String viewAddress = '$baseUrl/address/view.php';
  static const String editAddress = '$baseUrl/address/edit.php';
  static const String deleteAddress = '$baseUrl/address/delete.php';
  //orders
  static const String checkout = '$baseUrl/orders/checkout.php';
  static const String pendingOrders = '$baseUrl/orders/pendingorders.php';
  static const String orderDetails = '$baseUrl/orders/detials.php';
  static const String deleteorders = '$baseUrl/orders/delete.php';
  static const String archiveOrders = '$baseUrl/orders/archive.php';

}

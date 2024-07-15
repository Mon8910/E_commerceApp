class AppLink {
  static const String baseUrl = 'http://10.0.2.2/ecommerce';
  static const String signupLink = '$baseUrl/auth/signup.php';
  static const String loginLink = '$baseUrl/auth/login.php';
  static const String veriftySignupLink = '$baseUrl/auth/veriftycode.php';
  ///////////forgetpassword//////////
  static const String checkemail = '$baseUrl/forgetpassword/checkemail.php';

  static const String veriftyForgetpasswordLink =
      '$baseUrl/forgetpassword/veriftycode.php';

  static const String resestpassword =
      '$baseUrl/forgetpassword/resetpassword.php';
}

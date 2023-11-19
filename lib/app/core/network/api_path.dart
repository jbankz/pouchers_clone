/// Author: JayTech👨🏾‍💻
/// Date: September 6, 2023
/// A class that defines API paths for API endpoints.
class ApiPath {
  static const String _apiVersionOne = '/v1';

  /// The path for registering new users
  static const String signup = '$_apiVersionOne/auth/signup';

  /// The path for loging in users
  static const String login = '$_apiVersionOne/auth/login';

  /// The path for verifying users email address
  static const String verifyAccount = '$_apiVersionOne/auth/verify-email';

  /// The path for requesting a new OTP
  static const String requestOtp = '$_apiVersionOne/auth/resend-otp';

  /// The path for creating a new users tag
  static const String createTag = '$_apiVersionOne/auth/create-tag';

  /// The path for creating a new users pin
  static const String createPin = '$_apiVersionOne/auth/create-pin';

  /// The path for forgot password
  static const String forgotPassword = '$_apiVersionOne/auth/forgot-password';

  /// The path for validating of reset password
  static const String validatePasswordResetPassword =
      '$_apiVersionOne/auth/validate-password-reset-code';

  /// The path for reset password
  static const String resetPassword = '$_apiVersionOne/auth/reset-password';

  /// Return users wallet
  static const String wallet = '$_apiVersionOne/payment/wallet';

  /// Returns users tiers
  static const String tiers = '$_apiVersionOne/user/tiers';

  /// Validates users BVN
  static const String validateBVN = '$_apiVersionOne/user/validate-bvn';

  /// Validates users ID
  static const String validateID = '$_apiVersionOne/user/validate-ID';
}

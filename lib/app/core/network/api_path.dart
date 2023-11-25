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
  static const String validateID = '$_apiVersionOne/user/validate-id';

  static const String _cardPath = '$_apiVersionOne/card';

  /// Creates new dollar card
  static const String createDollarVirtualCard = _cardPath;

  /// Creates new naira card
  static const String createNairaVirtualCard = _cardPath;

  /// Freeze card
  static const String freezeCard = '$_apiVersionOne/$_cardPath/';

  /// Fund virtual card
  static const String fundVirtualCard = '$_apiVersionOne/$_cardPath/fund';

  /// virtual card balance
  static const String balance = '$_apiVersionOne/$_cardPath/accounts/';

  /// Card token
  static const String token = '$_apiVersionOne/$_cardPath/';

  /// Card transactions
  static const String transactions = '$_apiVersionOne/$_cardPath/';

  /// Cards
  static const String cards = _cardPath;

  /// Exchange Rate
  static const String rate = '$_cardPath/exchange_rate/USDNGN';

  /// Virtual Account
  static const String virtualAccount = '$_apiVersionOne/$_cardPath/accounts';

  /// get signed url bucket
  static const String getSignedUrl = '$_apiVersionOne/user/pre-signed-url';

  /// get users profile
  static const String profile = '$_apiVersionOne/user/profile';

  /// get admins envs
  static const String envs = '$_apiVersionOne/admin-settings/envs';
}

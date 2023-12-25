import 'dart:io';

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
  static const String accountDetails = '$_apiVersionOne/payment/bank-account';

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
  static const String freezeCard = _cardPath;

  /// Fund virtual card
  static const String fundVirtualCard = '$_cardPath/fund';

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

  /// Request for phone number
  static const String requestPhoneChange =
      '$_apiVersionOne/user/request-phone-change';

  /// Change for phone number
  static const String changePhone = '$_apiVersionOne/user/change-phone';

  /// Validate the otp for phone number
  static const String validatePhoneOtp =
      '$_apiVersionOne/auth/validate-password-reset-code';

  /// Get users referrals and rewards
  static const String referrals = '$_apiVersionOne/user/referral-trail';

  /// Change of pin
  static const String resetPin = '$_apiVersionOne/user/reset-pin';

  static const String validatePin = '$_apiVersionOne/auth/validate-pin';
  static const String securityQuestions =
      '$_apiVersionOne/auth/security-questions';
  static const String setQuestions = '$_apiVersionOne/auth/set-questions';
  static const String generate2fa = '$_apiVersionOne/user/generate-2fa-token';
  static const String validate2Fa = '$_apiVersionOne/user/validate-2fa-token';
  static const String validate2FaQuestion = '$_apiVersionOne/auth/validate-2fa';
  static const String disable2fa = '$_apiVersionOne/user/disable-2fa';
  static const String selectedQuestions =
      '$_apiVersionOne/auth/selected-questions';
  static const String disable = '$_apiVersionOne/user/disable';
  static const String delete = '$_apiVersionOne/user';
  static const String localBanks = '$_apiVersionOne/payment/banks';
  static const String localBankTransfer =
      '$_apiVersionOne/payment/local-bank-transfer';
  static const String notification = '$_apiVersionOne/notification';
  static const String banners = '$_apiVersionOne/admin-settings/banners';
  static const String billers = '$_apiVersionOne/utility/billers';
  static const String billersDiscounts =
      '$_apiVersionOne/utility/discount/value';
  static const String mobile = '$_apiVersionOne/utility/mobile';
  static const String merchantPayment =
      '$_apiVersionOne/utility/merchantPayment';
  static const String dataProviders = '$_apiVersionOne/utility/data/operators';
  static const String schedule = '$_apiVersionOne/utility/schedule';
  static const String merchants = '$_apiVersionOne/utility/merchantServices';
  static const String getMerchants = '$_apiVersionOne/utility/merchants';
  static const String validateCustomerInfo =
      '$_apiVersionOne/utility/customer-validation';
  static const String buyVoucher = '$_apiVersionOne/voucher/buy';
  static const String vouchers = '$_apiVersionOne/voucher';
  static const String redeemVoucher = '$_apiVersionOne/voucher/redeem';
  static const String giftVoucher = '$_apiVersionOne/voucher/gift';

  static String authenticator = Platform.isAndroid
      ? 'https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2'
      : 'https://apps.apple.com/us/app/google-authenticator/id388497605';
}

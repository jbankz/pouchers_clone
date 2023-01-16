import 'package:flutter/material.dart';
import 'package:pouchers/ui/login/screens/reset_password_code.dart';
import 'package:pouchers/ui/onboarding/screens/onboarding.dart';
import 'package:pouchers/ui/onboarding/screens/pay_ussd.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/voucher.dart';
import 'ui/account/account_settings.dart';
import 'ui/account/biometric_settings.dart';
import 'ui/account/change_password/change_password.dart';
import 'ui/account/change_pin.dart';
import 'ui/account/delete_account/delete_account.dart';
import 'ui/account/disable_account/disable_account.dart';
import 'ui/account/disable_account/disable_account_confirmation.dart';
import 'ui/account/disable_account/disable_success.dart';
import 'ui/account/reset_pin.dart';
import 'ui/account/schedule_payments.dart';
import 'ui/account/two_factor_auth/confirm_auth_pin.dart';
import 'ui/account/two_factor_auth/copy_code.dart';
import 'ui/account/two_factor_auth/disable_auth_question.dart';
import 'ui/account/two_factor_auth/disable_auth_question2.dart';
import 'ui/account/two_factor_auth/google_authenticator_download.dart';
import 'ui/account/two_factor_auth/second_security_question.dart';
import 'ui/account/two_factor_auth/security_question.dart';
import 'ui/account/two_factor_auth/success_auth_page.dart';
import 'ui/account/two_factor_auth/two_factor.dart';
import 'ui/account/two_factor_auth/two_factor_disable.dart';
import 'ui/cards/screens/card_home.dart';
import 'ui/cards/screens/card_residential_address.dart';
import 'ui/cards/screens/card_summary.dart';
import 'ui/cards/screens/create_card.dart';
import 'ui/cards/screens/create_virtual_card.dart';
import 'ui/create_account/screens/biometrics_page.dart';
import 'ui/create_account/screens/create_account.dart';
import 'ui/create_account/screens/create_pin.dart';
import 'ui/create_account/screens/poucher_tag.dart';
import 'ui/create_account/screens/verify_account.dart';
import 'ui/login/screens/forgot_password.dart';
import 'ui/login/screens/login.dart';
import 'ui/login/screens/reset_successful.dart';
import 'ui/login/screens/set_password.dart';
import 'ui/make_payment/screens/transfer_poucher_friend.dart';
import 'ui/make_payment/screens/transfer_summary.dart';
import 'ui/onboarding/screens/guest_email.dart';
import 'ui/onboarding/screens/pay_card.dart';
import 'ui/onboarding/screens/welcome_guest.dart';
import 'ui/schedule_purchase/screens/schedule_airtime_topup.dart';
import 'ui/schedule_purchase/screens/schedule_cable_topup.dart';
import 'ui/schedule_purchase/screens/schedule_data_topup.dart';
import 'ui/schedule_purchase/screens/schedule_electricity_topup.dart';
import 'ui/schedule_purchase/screens/schedule_transfer.dart';
import 'ui/tab_layout/screens/homepage/betting.dart';
import 'ui/tab_layout/screens/homepage/buy_airtime.dart';
import 'ui/tab_layout/screens/homepage/buy_cable.dart';
import 'ui/tab_layout/screens/homepage/buy_data.dart';
import 'ui/tab_layout/screens/homepage/buy_electricity.dart';
import 'ui/tab_layout/screens/homepage/buy_internet.dart';
import 'ui/tab_layout/screens/homepage/fund_wallet.dart';
import 'ui/tab_layout/screens/homepage/homepage.dart';
import 'ui/tab_layout/screens/homepage/voucher/buy_voucher.dart';
import 'ui/tab_layout/screens/homepage/voucher/gift_voucher.dart';
import 'ui/tab_layout/screens/homepage/voucher/redeem_voucher.dart';
import 'ui/tab_layout/screens/homepage/voucher/view_voucher_history.dart';
import 'ui/tab_layout/screens/profile/profile_account_verification.dart';
import 'ui/tab_layout/screens/profile/profile_bvn.dart';
import 'ui/tab_layout/screens/profile/profile_change_number.dart';
import 'ui/tab_layout/screens/profile/profile_kyc.dart';
import 'ui/tab_layout/screens/profile/profile_page.dart';
import 'ui/tab_layout/screens/profile/profile_success.dart';
import 'ui/tab_layout/screens/profile/profile_tier_list.dart';
import 'ui/tab_layout/screens/profile/profile_utility_bill.dart';
import 'ui/tab_layout/screens/profile/profile_valid_id.dart';
import 'ui/tab_layout/screens/tab_layout.dart';
import 'ui/transactions/screens/history.dart';
import 'ui/transactions/screens/history_detail.dart';
import 'ui/transactions/screens/transactions.dart';

Map<String, WidgetBuilder> appRoutes = {
  BiometricsPage.routeName: (context) => BiometricsPage(),
  CreateAccount.routeName: (context) => CreateAccount(),
  PoucherTag.routeName: (context) => PoucherTag(),
  VerifyAccount.routeName: (context) => VerifyAccount(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  LogInAccount.routeName: (context) => LogInAccount(),
  ResetPasswordCode.routeName: (context) => ResetPasswordCode(),
  ResetSuccessful.routeName: (context) => ResetSuccessful(),
  SetPassword.routeName: (context) => SetPassword(),
  OnBoardingPage.routeName: (context) => OnBoardingPage(),
  WelcomeGuest.routeName: (context) => WelcomeGuest(),
  ChangePassword.routeName: (context) => ChangePassword(),
  DeleteAccount.routeName: (context) => DeleteAccount(),
  DisableAccount.routeName: (context) => DisableAccount(),
  DisableConfirm.routeName: (context) => DisableConfirm(),
  DisableSuccessful.routeName: (context) => DisableSuccessful(),
  ConfirmAuthPin.routeName: (context) => ConfirmAuthPin(),
  CopyCode.routeName: (context) => CopyCode(),
  DisableAuthQuestion.routeName: (context) => DisableAuthQuestion(),
  GoogleAuthenticatorDownload.routeName: (context) =>
      GoogleAuthenticatorDownload(),
  SecurityQuestion.routeName: (context) => SecurityQuestion(),
  SuccessAuthPage.routeName: (context) => SuccessAuthPage(),
  TwoFactor.routeName: (context) => TwoFactor(),
  TwoFactorDisable.routeName: (context) => TwoFactorDisable(),
  AccountSettings.routeName: (context) => AccountSettings(),
  BiometricSettings.routeName: (context) => BiometricSettings(),
  ChangeTransactionPin.routeName: (context) => ChangeTransactionPin(),
  ResetPin.routeName: (context) => ResetPin(),
  Betting.routeName: (context) => Betting(),
  BuyAirtime.routeName: (context) => BuyAirtime(),
  BuyCable.routeName: (context) => BuyCable(),
  BuyData.routeName: (context) => BuyData(),
  BuyElectricity.routeName: (context) => BuyElectricity(),
  BuyInternet.routeName: (context) => BuyInternet(),
  HomePage.routeName: (context) => HomePage(),
  TabLayout.routeName: (context) => TabLayout(),
  CreatePin.routeName: (context) => CreatePin(),
  ProfileKYC.routeName: (context) => ProfileKYC(),
  AccountVerificationStatus.routeName: (context) => AccountVerificationStatus(),
  BVNPage.routeName: (context) => BVNPage(),
  ProfileSuccessful.routeName: (context) => ProfileSuccessful(),
  ValidId.routeName: (context) => ValidId(),
  SecondSecurityQuestion.routeName: (context) => SecondSecurityQuestion(),
  DisableAuthQuestion2.routeName: (context) => DisableAuthQuestion2(),
  ProfilePage.routeName: (context) => ProfilePage(),
  ProfileUtilityBill.routeName: (context) => ProfileUtilityBill(),
  PouchersTierList.routeName: (context) => PouchersTierList(),
  ChangePhoneNumber.routeName: (context) => ChangePhoneNumber(),
  CreateCard.routeName: (context) => CreateCard(),
  CreateVirtualCard.routeName: (context) => CreateVirtualCard(),
  CardSummary.routeName: (context) => CardSummary(),
  CardHome.routeName: (context) => CardHome(),
  FundWallet.routeName: (context) => FundWallet(),
  TransferPoucherFriend.routeName: (context) => TransferPoucherFriend(),
  TransferSummary.routeName: (context) => TransferSummary(),
  GetGuestEmail.routeName: (context) => GetGuestEmail(),
  PayWithCard.routeName: (context) => PayWithCard(),
  PayWithUssd.routeName: (context) => PayWithUssd(),
  Vouchers.routeName: (context) => Vouchers(),
  BuyVouchers.routeName: (context) => BuyVouchers(),
  RedeemVoucher.routeName: (context) => RedeemVoucher(),
  GiftVoucher.routeName: (context) => GiftVoucher(),
  VoucherHistory.routeName: (context) => VoucherHistory(),
  ScheduleAirtimeTopUp.routeName: (context) => ScheduleAirtimeTopUp(),
  ScheduleDataTopUp.routeName: (context) => ScheduleDataTopUp(),
  ScheduleElectricity.routeName: (context) => ScheduleElectricity(),
  ScheduleCableTopUp.routeName: (context) => ScheduleCableTopUp(),
  ScheduleTransfer.routeName: (context) => ScheduleTransfer(),
  SchedulePayments.routeName: (context) => SchedulePayments(),
  ResidentialAddress.routeName: (context) => ResidentialAddress(),
  Transactions.routeName: (context) => Transactions(),
  History.routeName: (context) => History(),
  HistoryDetail.routeName: (context) => HistoryDetail()
};

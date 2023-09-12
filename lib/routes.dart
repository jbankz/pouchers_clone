import 'package:Pouchers/modules/account/screens/request/received_details.dart';
import 'package:Pouchers/modules/account/screens/request/requests.dart';
import 'package:Pouchers/modules/utilities/screens/buy_education.dart';
import 'package:flutter/material.dart';
import 'package:Pouchers/modules/account/screens/account_settings/biometric_settings.dart';
import 'package:Pouchers/modules/account/screens/account_settings/change_pin.dart';
import 'package:Pouchers/modules/account/screens/account_settings/reset_pin.dart';
import 'package:Pouchers/modules/account/screens/account_settings/schedule_payments.dart';
import 'package:Pouchers/modules/account/screens/change_password/change_password.dart';
import 'package:Pouchers/modules/account/screens/delete_account/delete_account.dart';
import 'package:Pouchers/modules/account/screens/disable_account/disable_account.dart';
import 'package:Pouchers/modules/account/screens/disable_account/disable_account_confirmation.dart';
import 'package:Pouchers/modules/account/screens/disable_account/disable_success.dart';
import 'package:Pouchers/modules/account/screens/referral/referral.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/copy_code.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/disable_auth_question.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/disable_auth_question2.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/google_authenticator_download.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/second_security_question.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/security_question.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/success_auth_page.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/two_factor.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/two_factor_disable.dart';
import 'package:Pouchers/modules/login/screens/reset_password_code.dart';
import 'package:Pouchers/modules/onboarding/screens/onboarding.dart';
import 'package:Pouchers/modules/onboarding/screens/pay_ussd.dart';
import 'package:Pouchers/modules/profile/profile_utility_bill.dart';
import 'package:Pouchers/modules/transactions/screens/analytics.dart';
import 'package:Pouchers/modules/utilities/screens/buy_airtime.dart';
import 'package:Pouchers/modules/utilities/screens/buy_cable.dart';
import 'package:Pouchers/modules/utilities/screens/buy_data.dart';
import 'package:Pouchers/modules/utilities/screens/buy_electricity.dart';
import 'package:Pouchers/modules/utilities/screens/buy_internet.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/buy_voucher.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/gift_voucher.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/redeem_voucher.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/view_voucher_history.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/voucher.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'modules/account/screens/account_settings/account_settings.dart';
import 'modules/account/screens/two_factor_auth/confirm_auth_pin.dart';
import 'modules/cards/screens/card_home.dart';
import 'modules/cards/screens/card_residential_address.dart';
import 'modules/cards/screens/card_summary.dart';
import 'modules/cards/screens/create_card.dart';
import 'modules/cards/screens/create_virtual_card.dart';
import 'modules/create_account/screens/biometrics_page.dart';
import 'modules/create_account/screens/create_account.dart';
import 'modules/create_account/screens/create_pin.dart';
import 'modules/create_account/screens/poucher_tag.dart';
import 'modules/create_account/screens/verify_account.dart';
import 'modules/login/screens/forgot_password.dart';
import 'modules/login/screens/login.dart';
import 'modules/login/screens/reset_successful.dart';
import 'modules/login/screens/set_password.dart';
import 'modules/make_payment/screens/transaction_receipt.dart';
import 'modules/make_payment/screens/transfer_poucher_friend.dart';
import 'modules/make_payment/screens/transfer_summary.dart';
import 'modules/onboarding/screens/guest_email.dart';
import 'modules/onboarding/screens/pay_card.dart';
import 'modules/onboarding/screens/welcome_guest.dart';
import 'modules/profile/profile_account_verification.dart';
import 'modules/profile/profile_bvn.dart';
import 'modules/profile/profile_change_number.dart';
import 'modules/profile/profile_kyc.dart';
import 'modules/profile/profile_page.dart';
import 'modules/profile/profile_success.dart';
import 'modules/profile/profile_tier_list.dart';
import 'modules/profile/profile_valid_id.dart';
import 'modules/schedule_purchase/screens/schedule_airtime_topup.dart';
import 'modules/schedule_purchase/screens/schedule_cable_topup.dart';
import 'modules/schedule_purchase/screens/schedule_data_topup.dart';
import 'modules/schedule_purchase/screens/schedule_electricity_topup.dart';
import 'modules/schedule_purchase/screens/schedule_transfer.dart';
import 'modules/utilities/screens/betting.dart';
import 'modules/tab_layout/screens/homepage/fund_wallet.dart';
import 'modules/tab_layout/screens/homepage/homepage.dart';
import 'modules/tab_layout/screens/tab_layout.dart';
import 'modules/transactions/screens/history.dart';
import 'modules/transactions/screens/history_detail.dart';
import 'modules/transactions/screens/transactions.dart';

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
  BuyEducation.routeName: (context)=>BuyEducation(),
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
  HistoryDetail.routeName: (context) => HistoryDetail(),
  TransactionReceipt.routeName : (context) => TransactionReceipt(),
  Analytics.routeName : (context) => Analytics(),
  Referral.routeName : (context) => Referral(),
  SuccessMessage.routeName: (context) => SuccessMessage(),
  ManageRequest.routeName: (context) => ManageRequest(),
};

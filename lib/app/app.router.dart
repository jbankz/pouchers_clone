// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i81;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/enum/two_fa_type.dart'
    as _i83;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/first_security_question_view.dart'
    as _i41;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/second_security_question_view.dart'
    as _i42;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/selected_question_view.dart'
    as _i46;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_code_generator_view.dart'
    as _i44;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_code_view.dart'
    as _i45;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_view.dart'
    as _i43;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_intro_view.dart'
    as _i40;
import 'package:Pouchers/ui/features/authentication/presentation/view/otp/otp_view.dart'
    as _i13;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/confirm_password_view.dart'
    as _i48;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/enum/password_confirmation_type.dart'
    as _i84;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/forgot_password_view.dart'
    as _i20;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/set_new_password_view.dart'
    as _i22;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/verify_change_of_password_view.dart'
    as _i21;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/change_pin_view.dart'
    as _i19;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/cofirm_pin_view.dart'
    as _i17;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/create_pin_view.dart'
    as _i16;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/password_confirmation_view.dart'
    as _i18;
import 'package:Pouchers/ui/features/authentication/presentation/view/signin/sign_in_view.dart'
    as _i5;
import 'package:Pouchers/ui/features/authentication/presentation/view/signup/sign_up_view.dart'
    as _i4;
import 'package:Pouchers/ui/features/authentication/presentation/view/tag/tag_view.dart'
    as _i15;
import 'package:Pouchers/ui/features/authentication/presentation/view/verify_password/verify_password_account.dart'
    as _i23;
import 'package:Pouchers/ui/features/dashboard/views/account/views/account_settings_view.dart'
    as _i14;
import 'package:Pouchers/ui/features/dashboard/views/account/views/account_verification.dart'
    as _i26;
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart'
    as _i82;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/bvn_requirement_view.dart'
    as _i30;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/card_calculator_view.dart'
    as _i49;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/card_creation_summary_view.dart'
    as _i31;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/virtual_card_detail_view.dart'
    as _i33;
import 'package:Pouchers/ui/features/dashboard/views/dashboard_view.dart'
    as _i7;
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart'
    as _i89;
import 'package:Pouchers/ui/features/dashboard/views/transaction/presentation/view/transaction_details_view.dart'
    as _i76;
import 'package:Pouchers/ui/features/guest/guest_email_view.dart' as _i9;
import 'package:Pouchers/ui/features/guest/guest_view.dart' as _i8;
import 'package:Pouchers/ui/features/notification/domain/model/notification_model.dart'
    as _i86;
import 'package:Pouchers/ui/features/notification/presentation/view/notification_details_view.dart'
    as _i53;
import 'package:Pouchers/ui/features/notification/presentation/view/notification_view.dart'
    as _i52;
import 'package:Pouchers/ui/features/onboarding/presentation/views/onboarding_view.dart'
    as _i3;
import 'package:Pouchers/ui/features/onboarding/presentation/views/splash_view.dart'
    as _i2;
import 'package:Pouchers/ui/features/payment/presentation/view/debit_card_view.dart'
    as _i12;
import 'package:Pouchers/ui/features/payment/presentation/view/inapp_web_view.dart'
    as _i80;
import 'package:Pouchers/ui/features/payment/presentation/view/ussd_view.dart'
    as _i71;
import 'package:Pouchers/ui/features/profile/presentation/views/account/account_details_view.dart'
    as _i54;
import 'package:Pouchers/ui/features/profile/presentation/views/biometric/biometric_setup_view.dart'
    as _i39;
import 'package:Pouchers/ui/features/profile/presentation/views/biometric/biometric_view.dart'
    as _i24;
import 'package:Pouchers/ui/features/profile/presentation/views/delete/delete_view.dart'
    as _i50;
import 'package:Pouchers/ui/features/profile/presentation/views/disable/disable_view.dart'
    as _i47;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/bvn/bvn_view.dart'
    as _i27;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/id/id_view.dart'
    as _i28;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/utility/utility_bill_view.dart'
    as _i29;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/phone/change_password_view.dart'
    as _i37;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/phone/requst_change_of_phone_number_view.dart'
    as _i35;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/phone/verify_phone_number_view.dart'
    as _i36;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/profile_image_view.dart'
    as _i64;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/profile_view.dart'
    as _i34;
import 'package:Pouchers/ui/features/profile/presentation/views/referral/referral_view.dart'
    as _i38;
import 'package:Pouchers/ui/features/profile/presentation/views/wallet/fund_wallet_view.dart'
    as _i32;
import 'package:Pouchers/ui/features/requests/domain/model/request_model.dart'
    as _i90;
import 'package:Pouchers/ui/features/requests/presentation/view/request_money_view.dart'
    as _i78;
import 'package:Pouchers/ui/features/requests/presentation/view/request_view.dart'
    as _i77;
import 'package:Pouchers/ui/features/schedules/domain/model/schedule_model.dart'
    as _i87;
import 'package:Pouchers/ui/features/schedules/presentation/view/schedule_view.dart'
    as _i79;
import 'package:Pouchers/ui/features/tiers/presentation/view/tier_view.dart'
    as _i25;
import 'package:Pouchers/ui/features/transfer/domain/dto/confirm_transfer_money_dto.dart'
    as _i85;
import 'package:Pouchers/ui/features/transfer/domain/model/transfer.dart'
    as _i88;
import 'package:Pouchers/ui/features/transfer/presentation/views/schedule_transfer_view.dart'
    as _i74;
import 'package:Pouchers/ui/features/transfer/presentation/views/transfer_money_confirmation_view.dart'
    as _i51;
import 'package:Pouchers/ui/features/transfer/presentation/views/transfer_money_view.dart'
    as _i73;
import 'package:Pouchers/ui/features/transfer/presentation/views/transfer_receipt_view.dart'
    as _i75;
import 'package:Pouchers/ui/features/transfer/presentation/views/transfer_success_view.dart'
    as _i72;
import 'package:Pouchers/ui/features/utilities/presentation/views/airtime/airtime_view.dart'
    as _i10;
import 'package:Pouchers/ui/features/utilities/presentation/views/airtime/schedule_airtime_view.dart'
    as _i55;
import 'package:Pouchers/ui/features/utilities/presentation/views/betting/betting_view.dart'
    as _i62;
import 'package:Pouchers/ui/features/utilities/presentation/views/cable/cable_tv_view.dart'
    as _i57;
import 'package:Pouchers/ui/features/utilities/presentation/views/cable/schedule_cable_tv_view.dart'
    as _i58;
import 'package:Pouchers/ui/features/utilities/presentation/views/data/data_view.dart'
    as _i11;
import 'package:Pouchers/ui/features/utilities/presentation/views/data/schedule_data_view.dart'
    as _i56;
import 'package:Pouchers/ui/features/utilities/presentation/views/education/education_view.dart'
    as _i63;
import 'package:Pouchers/ui/features/utilities/presentation/views/electricty/electricity_view.dart'
    as _i59;
import 'package:Pouchers/ui/features/utilities/presentation/views/electricty/schedule_electricity_view.dart'
    as _i60;
import 'package:Pouchers/ui/features/utilities/presentation/views/internet/internet_view.dart'
    as _i61;
import 'package:Pouchers/ui/features/voucher/presentation/views/buy_voucher_view.dart'
    as _i66;
import 'package:Pouchers/ui/features/voucher/presentation/views/gift_voucher_view.dart'
    as _i68;
import 'package:Pouchers/ui/features/voucher/presentation/views/redeem_voucher_view.dart'
    as _i67;
import 'package:Pouchers/ui/features/voucher/presentation/views/voucher_history_view.dart'
    as _i70;
import 'package:Pouchers/ui/features/voucher/presentation/views/voucher_success_view.dart'
    as _i69;
import 'package:Pouchers/ui/features/voucher/presentation/views/voucher_view.dart'
    as _i65;
import 'package:Pouchers/ui/widgets/success_state.dart' as _i6;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i91;

class Routes {
  static const splashView = '/';

  static const onboardingView = '/onboarding-view';

  static const signUpView = '/sign-up-view';

  static const signInView = '/sign-in-view';

  static const successState = '/success-state';

  static const dashboardView = '/dashboard-view';

  static const guestView = '/guest-view';

  static const getGuestEmailView = '/get-guest-email-view';

  static const airtimeView = '/airtime-view';

  static const dataView = '/data-view';

  static const debitCardView = '/debit-card-view';

  static const otpView = '/otp-view';

  static const accountSettingsView = '/account-settings-view';

  static const tagView = '/tag-view';

  static const createPinView = '/create-pin-view';

  static const confirmPinView = '/confirm-pin-view';

  static const passwordConfirmationView = '/password-confirmation-view';

  static const changePinView = '/change-pin-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const verifyChangeOfPasswordView = '/verify-change-of-password-view';

  static const setNewPasswordView = '/set-new-password-view';

  static const verifyPasswordAccountView = '/verify-password-account-view';

  static const biometricView = '/biometric-view';

  static const tierView = '/tier-view';

  static const accountVerificationView = '/account-verification-view';

  static const bvnView = '/bvn-view';

  static const idView = '/id-view';

  static const utilityBillView = '/utility-bill-view';

  static const requestBVNView = '/request-bv-nView';

  static const cardCreationSymmaryView = '/card-creation-symmary-view';

  static const fundWalletView = '/fund-wallet-view';

  static const virtualCardDetailView = '/virtual-card-detail-view';

  static const profileView = '/profile-view';

  static const requestChangeOfPhoneNumberView =
      '/request-change-of-phone-number-view';

  static const verifyPhoneOtpView = '/verify-phone-otp-view';

  static const changePhoneNumberView = '/change-phone-number-view';

  static const referralView = '/referral-view';

  static const biometricSetupView = '/biometric-setup-view';

  static const twoFaAuthView = '/two-fa-auth-view';

  static const firstSecurityQuestionView = '/first-security-question-view';

  static const secondSecurityQuestionView = '/second-security-question-view';

  static const twoFaGoogleAuthenticatorView =
      '/two-fa-google-authenticator-view';

  static const twoFaGoogleAuthenticatorCodeGeneratorView =
      '/two-fa-google-authenticator-code-generator-view';

  static const twoFaGoogleAuthenticatorCodeView =
      '/two-fa-google-authenticator-code-view';

  static const selectedQuestionView = '/selected-question-view';

  static const disableView = '/disable-view';

  static const confirmPasswordView = '/confirm-password-view';

  static const cardCalculatorView = '/card-calculator-view';

  static const deleteView = '/delete-view';

  static const transferMoneyConfirmationView =
      '/transfer-money-confirmation-view';

  static const notificationView = '/notification-view';

  static const notificationDetailsView = '/notification-details-view';

  static const accountDetailsView = '/account-details-view';

  static const scheduledAirtimeView = '/scheduled-airtime-view';

  static const scheduleDataView = '/schedule-data-view';

  static const cableTvView = '/cable-tv-view';

  static const scheduleCableTvView = '/schedule-cable-tv-view';

  static const electricityView = '/electricity-view';

  static const scheduleElectricityView = '/schedule-electricity-view';

  static const internetView = '/internet-view';

  static const bettingView = '/betting-view';

  static const educationView = '/education-view';

  static const profileImageView = '/profile-image-view';

  static const voucherView = '/voucher-view';

  static const buyVoucherView = '/buy-voucher-view';

  static const redeemVoucherView = '/redeem-voucher-view';

  static const giftVoucherView = '/gift-voucher-view';

  static const voucherSuccessView = '/voucher-success-view';

  static const voucherHistoryView = '/voucher-history-view';

  static const ussdView = '/ussd-view';

  static const transferSuccessState = '/transfer-success-state';

  static const transferMoneyView = '/transfer-money-view';

  static const scheduleTransferMoneyView = '/schedule-transfer-money-view';

  static const transferReceipt = '/transfer-receipt';

  static const transactionDetailsView = '/transaction-details-view';

  static const requestView = '/request-view';

  static const requestMoneyView = '/request-money-view';

  static const scheduleView = '/schedule-view';

  static const pagaWebView = '/paga-web-view';

  static const all = <String>{
    splashView,
    onboardingView,
    signUpView,
    signInView,
    successState,
    dashboardView,
    guestView,
    getGuestEmailView,
    airtimeView,
    dataView,
    debitCardView,
    otpView,
    accountSettingsView,
    tagView,
    createPinView,
    confirmPinView,
    passwordConfirmationView,
    changePinView,
    forgotPasswordView,
    verifyChangeOfPasswordView,
    setNewPasswordView,
    verifyPasswordAccountView,
    biometricView,
    tierView,
    accountVerificationView,
    bvnView,
    idView,
    utilityBillView,
    requestBVNView,
    cardCreationSymmaryView,
    fundWalletView,
    virtualCardDetailView,
    profileView,
    requestChangeOfPhoneNumberView,
    verifyPhoneOtpView,
    changePhoneNumberView,
    referralView,
    biometricSetupView,
    twoFaAuthView,
    firstSecurityQuestionView,
    secondSecurityQuestionView,
    twoFaGoogleAuthenticatorView,
    twoFaGoogleAuthenticatorCodeGeneratorView,
    twoFaGoogleAuthenticatorCodeView,
    selectedQuestionView,
    disableView,
    confirmPasswordView,
    cardCalculatorView,
    deleteView,
    transferMoneyConfirmationView,
    notificationView,
    notificationDetailsView,
    accountDetailsView,
    scheduledAirtimeView,
    scheduleDataView,
    cableTvView,
    scheduleCableTvView,
    electricityView,
    scheduleElectricityView,
    internetView,
    bettingView,
    educationView,
    profileImageView,
    voucherView,
    buyVoucherView,
    redeemVoucherView,
    giftVoucherView,
    voucherSuccessView,
    voucherHistoryView,
    ussdView,
    transferSuccessState,
    transferMoneyView,
    scheduleTransferMoneyView,
    transferReceipt,
    transactionDetailsView,
    requestView,
    requestMoneyView,
    scheduleView,
    pagaWebView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i3.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i4.SignUpView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i5.SignInView,
    ),
    _i1.RouteDef(
      Routes.successState,
      page: _i6.SuccessState,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i7.DashboardView,
    ),
    _i1.RouteDef(
      Routes.guestView,
      page: _i8.GuestView,
    ),
    _i1.RouteDef(
      Routes.getGuestEmailView,
      page: _i9.GetGuestEmailView,
    ),
    _i1.RouteDef(
      Routes.airtimeView,
      page: _i10.AirtimeView,
    ),
    _i1.RouteDef(
      Routes.dataView,
      page: _i11.DataView,
    ),
    _i1.RouteDef(
      Routes.debitCardView,
      page: _i12.DebitCardView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i13.OtpView,
    ),
    _i1.RouteDef(
      Routes.accountSettingsView,
      page: _i14.AccountSettingsView,
    ),
    _i1.RouteDef(
      Routes.tagView,
      page: _i15.TagView,
    ),
    _i1.RouteDef(
      Routes.createPinView,
      page: _i16.CreatePinView,
    ),
    _i1.RouteDef(
      Routes.confirmPinView,
      page: _i17.ConfirmPinView,
    ),
    _i1.RouteDef(
      Routes.passwordConfirmationView,
      page: _i18.PasswordConfirmationView,
    ),
    _i1.RouteDef(
      Routes.changePinView,
      page: _i19.ChangePinView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i20.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.verifyChangeOfPasswordView,
      page: _i21.VerifyChangeOfPasswordView,
    ),
    _i1.RouteDef(
      Routes.setNewPasswordView,
      page: _i22.SetNewPasswordView,
    ),
    _i1.RouteDef(
      Routes.verifyPasswordAccountView,
      page: _i23.VerifyPasswordAccountView,
    ),
    _i1.RouteDef(
      Routes.biometricView,
      page: _i24.BiometricView,
    ),
    _i1.RouteDef(
      Routes.tierView,
      page: _i25.TierView,
    ),
    _i1.RouteDef(
      Routes.accountVerificationView,
      page: _i26.AccountVerificationView,
    ),
    _i1.RouteDef(
      Routes.bvnView,
      page: _i27.BvnView,
    ),
    _i1.RouteDef(
      Routes.idView,
      page: _i28.IdView,
    ),
    _i1.RouteDef(
      Routes.utilityBillView,
      page: _i29.UtilityBillView,
    ),
    _i1.RouteDef(
      Routes.requestBVNView,
      page: _i30.RequestBVNView,
    ),
    _i1.RouteDef(
      Routes.cardCreationSymmaryView,
      page: _i31.CardCreationSymmaryView,
    ),
    _i1.RouteDef(
      Routes.fundWalletView,
      page: _i32.FundWalletView,
    ),
    _i1.RouteDef(
      Routes.virtualCardDetailView,
      page: _i33.VirtualCardDetailView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i34.ProfileView,
    ),
    _i1.RouteDef(
      Routes.requestChangeOfPhoneNumberView,
      page: _i35.RequestChangeOfPhoneNumberView,
    ),
    _i1.RouteDef(
      Routes.verifyPhoneOtpView,
      page: _i36.VerifyPhoneOtpView,
    ),
    _i1.RouteDef(
      Routes.changePhoneNumberView,
      page: _i37.ChangePhoneNumberView,
    ),
    _i1.RouteDef(
      Routes.referralView,
      page: _i38.ReferralView,
    ),
    _i1.RouteDef(
      Routes.biometricSetupView,
      page: _i39.BiometricSetupView,
    ),
    _i1.RouteDef(
      Routes.twoFaAuthView,
      page: _i40.TwoFaAuthView,
    ),
    _i1.RouteDef(
      Routes.firstSecurityQuestionView,
      page: _i41.FirstSecurityQuestionView,
    ),
    _i1.RouteDef(
      Routes.secondSecurityQuestionView,
      page: _i42.SecondSecurityQuestionView,
    ),
    _i1.RouteDef(
      Routes.twoFaGoogleAuthenticatorView,
      page: _i43.TwoFaGoogleAuthenticatorView,
    ),
    _i1.RouteDef(
      Routes.twoFaGoogleAuthenticatorCodeGeneratorView,
      page: _i44.TwoFaGoogleAuthenticatorCodeGeneratorView,
    ),
    _i1.RouteDef(
      Routes.twoFaGoogleAuthenticatorCodeView,
      page: _i45.TwoFaGoogleAuthenticatorCodeView,
    ),
    _i1.RouteDef(
      Routes.selectedQuestionView,
      page: _i46.SelectedQuestionView,
    ),
    _i1.RouteDef(
      Routes.disableView,
      page: _i47.DisableView,
    ),
    _i1.RouteDef(
      Routes.confirmPasswordView,
      page: _i48.ConfirmPasswordView,
    ),
    _i1.RouteDef(
      Routes.cardCalculatorView,
      page: _i49.CardCalculatorView,
    ),
    _i1.RouteDef(
      Routes.deleteView,
      page: _i50.DeleteView,
    ),
    _i1.RouteDef(
      Routes.transferMoneyConfirmationView,
      page: _i51.TransferMoneyConfirmationView,
    ),
    _i1.RouteDef(
      Routes.notificationView,
      page: _i52.NotificationView,
    ),
    _i1.RouteDef(
      Routes.notificationDetailsView,
      page: _i53.NotificationDetailsView,
    ),
    _i1.RouteDef(
      Routes.accountDetailsView,
      page: _i54.AccountDetailsView,
    ),
    _i1.RouteDef(
      Routes.scheduledAirtimeView,
      page: _i55.ScheduledAirtimeView,
    ),
    _i1.RouteDef(
      Routes.scheduleDataView,
      page: _i56.ScheduleDataView,
    ),
    _i1.RouteDef(
      Routes.cableTvView,
      page: _i57.CableTvView,
    ),
    _i1.RouteDef(
      Routes.scheduleCableTvView,
      page: _i58.ScheduleCableTvView,
    ),
    _i1.RouteDef(
      Routes.electricityView,
      page: _i59.ElectricityView,
    ),
    _i1.RouteDef(
      Routes.scheduleElectricityView,
      page: _i60.ScheduleElectricityView,
    ),
    _i1.RouteDef(
      Routes.internetView,
      page: _i61.InternetView,
    ),
    _i1.RouteDef(
      Routes.bettingView,
      page: _i62.BettingView,
    ),
    _i1.RouteDef(
      Routes.educationView,
      page: _i63.EducationView,
    ),
    _i1.RouteDef(
      Routes.profileImageView,
      page: _i64.ProfileImageView,
    ),
    _i1.RouteDef(
      Routes.voucherView,
      page: _i65.VoucherView,
    ),
    _i1.RouteDef(
      Routes.buyVoucherView,
      page: _i66.BuyVoucherView,
    ),
    _i1.RouteDef(
      Routes.redeemVoucherView,
      page: _i67.RedeemVoucherView,
    ),
    _i1.RouteDef(
      Routes.giftVoucherView,
      page: _i68.GiftVoucherView,
    ),
    _i1.RouteDef(
      Routes.voucherSuccessView,
      page: _i69.VoucherSuccessView,
    ),
    _i1.RouteDef(
      Routes.voucherHistoryView,
      page: _i70.VoucherHistoryView,
    ),
    _i1.RouteDef(
      Routes.ussdView,
      page: _i71.UssdView,
    ),
    _i1.RouteDef(
      Routes.transferSuccessState,
      page: _i72.TransferSuccessState,
    ),
    _i1.RouteDef(
      Routes.transferMoneyView,
      page: _i73.TransferMoneyView,
    ),
    _i1.RouteDef(
      Routes.scheduleTransferMoneyView,
      page: _i74.ScheduleTransferMoneyView,
    ),
    _i1.RouteDef(
      Routes.transferReceipt,
      page: _i75.TransferReceipt,
    ),
    _i1.RouteDef(
      Routes.transactionDetailsView,
      page: _i76.TransactionDetailsView,
    ),
    _i1.RouteDef(
      Routes.requestView,
      page: _i77.RequestView,
    ),
    _i1.RouteDef(
      Routes.requestMoneyView,
      page: _i78.RequestMoneyView,
    ),
    _i1.RouteDef(
      Routes.scheduleView,
      page: _i79.ScheduleView,
    ),
    _i1.RouteDef(
      Routes.pagaWebView,
      page: _i80.PagaWebView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.SplashView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i3.OnboardingView: (data) {
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i3.OnboardingView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i4.SignUpView: (data) {
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i4.SignUpView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i5.SignInView: (data) {
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i5.SignInView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i6.SuccessState: (data) {
      final args = data.getArgs<SuccessStateArguments>(
        orElse: () => const SuccessStateArguments(),
      );
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i6.SuccessState(
                key: args.key,
                statusImage: args.statusImage,
                title: args.title,
                message: args.message,
                btnTitle: args.btnTitle,
                tap: args.tap),
        settings: data,
        opaque: false,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideBottom,
      );
    },
    _i7.DashboardView: (data) {
      final args = data.getArgs<DashboardViewArguments>(
        orElse: () => const DashboardViewArguments(),
      );
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i7.DashboardView(key: args.key, gottenIndex: args.gottenIndex),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i8.GuestView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i8.GuestView(),
        settings: data,
      );
    },
    _i9.GetGuestEmailView: (data) {
      final args = data.getArgs<GetGuestEmailViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i9.GetGuestEmailView(route: args.route, key: args.key),
        settings: data,
      );
    },
    _i10.AirtimeView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i10.AirtimeView(),
        settings: data,
      );
    },
    _i11.DataView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i11.DataView(),
        settings: data,
      );
    },
    _i12.DebitCardView: (data) {
      final args = data.getArgs<DebitCardViewArguments>(
        orElse: () => const DebitCardViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i12.DebitCardView(key: args.key, amount: args.amount),
        settings: data,
      );
    },
    _i13.OtpView: (data) {
      final args = data.getArgs<OtpViewArguments>(
        orElse: () => const OtpViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i13.OtpView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i14.AccountSettingsView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i14.AccountSettingsView(),
        settings: data,
      );
    },
    _i15.TagView: (data) {
      final args = data.getArgs<TagViewArguments>(
        orElse: () => const TagViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i15.TagView(key: args.key, callback: args.callback),
        settings: data,
      );
    },
    _i16.CreatePinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i16.CreatePinView(),
        settings: data,
      );
    },
    _i17.ConfirmPinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i17.ConfirmPinView(),
        settings: data,
      );
    },
    _i18.PasswordConfirmationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i18.PasswordConfirmationView(),
        settings: data,
      );
    },
    _i19.ChangePinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i19.ChangePinView(),
        settings: data,
      );
    },
    _i20.ForgotPasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i20.ForgotPasswordView(),
        settings: data,
      );
    },
    _i21.VerifyChangeOfPasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i21.VerifyChangeOfPasswordView(),
        settings: data,
      );
    },
    _i22.SetNewPasswordView: (data) {
      final args = data.getArgs<SetNewPasswordViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i22.SetNewPasswordView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i23.VerifyPasswordAccountView: (data) {
      final args = data.getArgs<VerifyPasswordAccountViewArguments>(
        orElse: () => const VerifyPasswordAccountViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i23.VerifyPasswordAccountView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i24.BiometricView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i24.BiometricView(),
        settings: data,
      );
    },
    _i25.TierView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i25.TierView(),
        settings: data,
      );
    },
    _i26.AccountVerificationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i26.AccountVerificationView(),
        settings: data,
      );
    },
    _i27.BvnView: (data) {
      final args = data.getArgs<BvnViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i27.BvnView(key: args.key, routeName: args.routeName),
        settings: data,
      );
    },
    _i28.IdView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i28.IdView(),
        settings: data,
      );
    },
    _i29.UtilityBillView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i29.UtilityBillView(),
        settings: data,
      );
    },
    _i30.RequestBVNView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i30.RequestBVNView(),
        settings: data,
      );
    },
    _i31.CardCreationSymmaryView: (data) {
      final args =
          data.getArgs<CardCreationSymmaryViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i31.CardCreationSymmaryView(key: args.key, cardDto: args.cardDto),
        settings: data,
      );
    },
    _i32.FundWalletView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i32.FundWalletView(),
        settings: data,
      );
    },
    _i33.VirtualCardDetailView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i33.VirtualCardDetailView(),
        settings: data,
      );
    },
    _i34.ProfileView: (data) {
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i34.ProfileView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i35.RequestChangeOfPhoneNumberView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i35.RequestChangeOfPhoneNumberView(),
        settings: data,
      );
    },
    _i36.VerifyPhoneOtpView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i36.VerifyPhoneOtpView(),
        settings: data,
      );
    },
    _i37.ChangePhoneNumberView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i37.ChangePhoneNumberView(),
        settings: data,
      );
    },
    _i38.ReferralView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i38.ReferralView(),
        settings: data,
      );
    },
    _i39.BiometricSetupView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i39.BiometricSetupView(),
        settings: data,
      );
    },
    _i40.TwoFaAuthView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i40.TwoFaAuthView(),
        settings: data,
      );
    },
    _i41.FirstSecurityQuestionView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i41.FirstSecurityQuestionView(),
        settings: data,
      );
    },
    _i42.SecondSecurityQuestionView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i42.SecondSecurityQuestionView(),
        settings: data,
      );
    },
    _i43.TwoFaGoogleAuthenticatorView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i43.TwoFaGoogleAuthenticatorView(),
        settings: data,
      );
    },
    _i44.TwoFaGoogleAuthenticatorCodeGeneratorView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            const _i44.TwoFaGoogleAuthenticatorCodeGeneratorView(),
        settings: data,
      );
    },
    _i45.TwoFaGoogleAuthenticatorCodeView: (data) {
      final args = data.getArgs<TwoFaGoogleAuthenticatorCodeViewArguments>(
        orElse: () => const TwoFaGoogleAuthenticatorCodeViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i45.TwoFaGoogleAuthenticatorCodeView(
            key: args.key, twoFaType: args.twoFaType),
        settings: data,
      );
    },
    _i46.SelectedQuestionView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i46.SelectedQuestionView(),
        settings: data,
      );
    },
    _i47.DisableView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i47.DisableView(),
        settings: data,
      );
    },
    _i48.ConfirmPasswordView: (data) {
      final args = data.getArgs<ConfirmPasswordViewArguments>(
        orElse: () => const ConfirmPasswordViewArguments(),
      );
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i48.ConfirmPasswordView(
                key: args.key,
                passwordConfirmationType: args.passwordConfirmationType),
        settings: data,
        opaque: false,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideBottom,
      );
    },
    _i49.CardCalculatorView: (data) {
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i49.CardCalculatorView(),
        settings: data,
        opaque: false,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideBottom,
      );
    },
    _i50.DeleteView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i50.DeleteView(),
        settings: data,
      );
    },
    _i51.TransferMoneyConfirmationView: (data) {
      final args =
          data.getArgs<TransferMoneyConfirmationViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i51.TransferMoneyConfirmationView(
            key: args.key, confirmTransferMoney: args.confirmTransferMoney),
        settings: data,
      );
    },
    _i52.NotificationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i52.NotificationView(),
        settings: data,
      );
    },
    _i53.NotificationDetailsView: (data) {
      final args =
          data.getArgs<NotificationDetailsViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i53.NotificationDetailsView(
            key: args.key, notificationModel: args.notificationModel),
        settings: data,
      );
    },
    _i54.AccountDetailsView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i54.AccountDetailsView(),
        settings: data,
      );
    },
    _i55.ScheduledAirtimeView: (data) {
      final args = data.getArgs<ScheduledAirtimeViewArguments>(
        orElse: () => const ScheduledAirtimeViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i55.ScheduledAirtimeView(key: args.key, schedule: args.schedule),
        settings: data,
      );
    },
    _i56.ScheduleDataView: (data) {
      final args = data.getArgs<ScheduleDataViewArguments>(
        orElse: () => const ScheduleDataViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i56.ScheduleDataView(key: args.key, schedule: args.schedule),
        settings: data,
      );
    },
    _i57.CableTvView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i57.CableTvView(),
        settings: data,
      );
    },
    _i58.ScheduleCableTvView: (data) {
      final args = data.getArgs<ScheduleCableTvViewArguments>(
        orElse: () => const ScheduleCableTvViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i58.ScheduleCableTvView(key: args.key, schedule: args.schedule),
        settings: data,
      );
    },
    _i59.ElectricityView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i59.ElectricityView(),
        settings: data,
      );
    },
    _i60.ScheduleElectricityView: (data) {
      final args = data.getArgs<ScheduleElectricityViewArguments>(
        orElse: () => const ScheduleElectricityViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i60.ScheduleElectricityView(
            key: args.key, schedule: args.schedule),
        settings: data,
      );
    },
    _i61.InternetView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i61.InternetView(),
        settings: data,
      );
    },
    _i62.BettingView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i62.BettingView(),
        settings: data,
      );
    },
    _i63.EducationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i63.EducationView(),
        settings: data,
      );
    },
    _i64.ProfileImageView: (data) {
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i64.ProfileImageView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i65.VoucherView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i65.VoucherView(),
        settings: data,
      );
    },
    _i66.BuyVoucherView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i66.BuyVoucherView(),
        settings: data,
      );
    },
    _i67.RedeemVoucherView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i67.RedeemVoucherView(),
        settings: data,
      );
    },
    _i68.GiftVoucherView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i68.GiftVoucherView(),
        settings: data,
      );
    },
    _i69.VoucherSuccessView: (data) {
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i69.VoucherSuccessView(),
        settings: data,
        opaque: false,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideBottom,
      );
    },
    _i70.VoucherHistoryView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i70.VoucherHistoryView(),
        settings: data,
      );
    },
    _i71.UssdView: (data) {
      final args = data.getArgs<UssdViewArguments>(
        orElse: () => const UssdViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i71.UssdView(key: args.key, amount: args.amount),
        settings: data,
      );
    },
    _i72.TransferSuccessState: (data) {
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i72.TransferSuccessState(),
        settings: data,
        opaque: false,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideBottom,
      );
    },
    _i73.TransferMoneyView: (data) {
      final args = data.getArgs<TransferMoneyViewArguments>(
        orElse: () => const TransferMoneyViewArguments(),
      );
      return _i81.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i73.TransferMoneyView(
                key: args.key, isRequestingMoney: args.isRequestingMoney),
        settings: data,
        opaque: false,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideBottom,
      );
    },
    _i74.ScheduleTransferMoneyView: (data) {
      final args = data.getArgs<ScheduleTransferMoneyViewArguments>(
        orElse: () => const ScheduleTransferMoneyViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i74.ScheduleTransferMoneyView(
            key: args.key, transfer: args.transfer, schedule: args.schedule),
        settings: data,
      );
    },
    _i75.TransferReceipt: (data) {
      final args = data.getArgs<TransferReceiptArguments>(
        orElse: () => const TransferReceiptArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i75.TransferReceipt(key: args.key, transfer: args.transfer),
        settings: data,
      );
    },
    _i76.TransactionDetailsView: (data) {
      final args = data.getArgs<TransactionDetailsViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i76.TransactionDetailsView(
            key: args.key, transactionHistory: args.transactionHistory),
        settings: data,
      );
    },
    _i77.RequestView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i77.RequestView(),
        settings: data,
      );
    },
    _i78.RequestMoneyView: (data) {
      final args = data.getArgs<RequestMoneyViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i78.RequestMoneyView(key: args.key, request: args.request),
        settings: data,
      );
    },
    _i79.ScheduleView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i79.ScheduleView(),
        settings: data,
      );
    },
    _i80.PagaWebView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i80.PagaWebView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SuccessStateArguments {
  const SuccessStateArguments({
    this.key,
    this.statusImage,
    this.title = '',
    this.message = '',
    this.btnTitle = '',
    this.tap,
  });

  final _i81.Key? key;

  final _i81.Widget? statusImage;

  final String title;

  final String message;

  final String btnTitle;

  final dynamic Function()? tap;

  @override
  String toString() {
    return '{"key": "$key", "statusImage": "$statusImage", "title": "$title", "message": "$message", "btnTitle": "$btnTitle", "tap": "$tap"}';
  }

  @override
  bool operator ==(covariant SuccessStateArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.statusImage == statusImage &&
        other.title == title &&
        other.message == message &&
        other.btnTitle == btnTitle &&
        other.tap == tap;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        statusImage.hashCode ^
        title.hashCode ^
        message.hashCode ^
        btnTitle.hashCode ^
        tap.hashCode;
  }
}

class DashboardViewArguments {
  const DashboardViewArguments({
    this.key,
    this.gottenIndex = 0,
  });

  final _i81.Key? key;

  final int gottenIndex;

  @override
  String toString() {
    return '{"key": "$key", "gottenIndex": "$gottenIndex"}';
  }

  @override
  bool operator ==(covariant DashboardViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.gottenIndex == gottenIndex;
  }

  @override
  int get hashCode {
    return key.hashCode ^ gottenIndex.hashCode;
  }
}

class GetGuestEmailViewArguments {
  const GetGuestEmailViewArguments({
    required this.route,
    this.key,
  });

  final String route;

  final _i81.Key? key;

  @override
  String toString() {
    return '{"route": "$route", "key": "$key"}';
  }

  @override
  bool operator ==(covariant GetGuestEmailViewArguments other) {
    if (identical(this, other)) return true;
    return other.route == route && other.key == key;
  }

  @override
  int get hashCode {
    return route.hashCode ^ key.hashCode;
  }
}

class DebitCardViewArguments {
  const DebitCardViewArguments({
    this.key,
    this.amount,
  });

  final _i81.Key? key;

  final String? amount;

  @override
  String toString() {
    return '{"key": "$key", "amount": "$amount"}';
  }

  @override
  bool operator ==(covariant DebitCardViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.amount == amount;
  }

  @override
  int get hashCode {
    return key.hashCode ^ amount.hashCode;
  }
}

class OtpViewArguments {
  const OtpViewArguments({
    this.key,
    this.email,
  });

  final _i81.Key? key;

  final String? email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant OtpViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class TagViewArguments {
  const TagViewArguments({
    this.key,
    this.callback,
  });

  final _i81.Key? key;

  final dynamic Function()? callback;

  @override
  String toString() {
    return '{"key": "$key", "callback": "$callback"}';
  }

  @override
  bool operator ==(covariant TagViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.callback == callback;
  }

  @override
  int get hashCode {
    return key.hashCode ^ callback.hashCode;
  }
}

class SetNewPasswordViewArguments {
  const SetNewPasswordViewArguments({
    this.key,
    required this.email,
  });

  final _i81.Key? key;

  final String email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant SetNewPasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class VerifyPasswordAccountViewArguments {
  const VerifyPasswordAccountViewArguments({
    this.key,
    this.email,
  });

  final _i81.Key? key;

  final String? email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant VerifyPasswordAccountViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class BvnViewArguments {
  const BvnViewArguments({
    this.key,
    required this.routeName,
  });

  final _i81.Key? key;

  final String routeName;

  @override
  String toString() {
    return '{"key": "$key", "routeName": "$routeName"}';
  }

  @override
  bool operator ==(covariant BvnViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.routeName == routeName;
  }

  @override
  int get hashCode {
    return key.hashCode ^ routeName.hashCode;
  }
}

class CardCreationSymmaryViewArguments {
  const CardCreationSymmaryViewArguments({
    this.key,
    required this.cardDto,
  });

  final _i81.Key? key;

  final _i82.CardDto cardDto;

  @override
  String toString() {
    return '{"key": "$key", "cardDto": "$cardDto"}';
  }

  @override
  bool operator ==(covariant CardCreationSymmaryViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.cardDto == cardDto;
  }

  @override
  int get hashCode {
    return key.hashCode ^ cardDto.hashCode;
  }
}

class TwoFaGoogleAuthenticatorCodeViewArguments {
  const TwoFaGoogleAuthenticatorCodeViewArguments({
    this.key,
    this.twoFaType = _i83.TwoFaType.twoFaSetup,
  });

  final _i81.Key? key;

  final _i83.TwoFaType? twoFaType;

  @override
  String toString() {
    return '{"key": "$key", "twoFaType": "$twoFaType"}';
  }

  @override
  bool operator ==(covariant TwoFaGoogleAuthenticatorCodeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.twoFaType == twoFaType;
  }

  @override
  int get hashCode {
    return key.hashCode ^ twoFaType.hashCode;
  }
}

class ConfirmPasswordViewArguments {
  const ConfirmPasswordViewArguments({
    this.key,
    this.passwordConfirmationType = _i84.PasswordConfirmationType.disable,
  });

  final _i81.Key? key;

  final _i84.PasswordConfirmationType? passwordConfirmationType;

  @override
  String toString() {
    return '{"key": "$key", "passwordConfirmationType": "$passwordConfirmationType"}';
  }

  @override
  bool operator ==(covariant ConfirmPasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.passwordConfirmationType == passwordConfirmationType;
  }

  @override
  int get hashCode {
    return key.hashCode ^ passwordConfirmationType.hashCode;
  }
}

class TransferMoneyConfirmationViewArguments {
  const TransferMoneyConfirmationViewArguments({
    this.key,
    required this.confirmTransferMoney,
  });

  final _i81.Key? key;

  final _i85.ConfirmTransferMoney confirmTransferMoney;

  @override
  String toString() {
    return '{"key": "$key", "confirmTransferMoney": "$confirmTransferMoney"}';
  }

  @override
  bool operator ==(covariant TransferMoneyConfirmationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.confirmTransferMoney == confirmTransferMoney;
  }

  @override
  int get hashCode {
    return key.hashCode ^ confirmTransferMoney.hashCode;
  }
}

class NotificationDetailsViewArguments {
  const NotificationDetailsViewArguments({
    this.key,
    required this.notificationModel,
  });

  final _i81.Key? key;

  final _i86.NotificationModel notificationModel;

  @override
  String toString() {
    return '{"key": "$key", "notificationModel": "$notificationModel"}';
  }

  @override
  bool operator ==(covariant NotificationDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.notificationModel == notificationModel;
  }

  @override
  int get hashCode {
    return key.hashCode ^ notificationModel.hashCode;
  }
}

class ScheduledAirtimeViewArguments {
  const ScheduledAirtimeViewArguments({
    this.key,
    this.schedule,
  });

  final _i81.Key? key;

  final _i87.ScheduleModel? schedule;

  @override
  String toString() {
    return '{"key": "$key", "schedule": "$schedule"}';
  }

  @override
  bool operator ==(covariant ScheduledAirtimeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.schedule == schedule;
  }

  @override
  int get hashCode {
    return key.hashCode ^ schedule.hashCode;
  }
}

class ScheduleDataViewArguments {
  const ScheduleDataViewArguments({
    this.key,
    this.schedule,
  });

  final _i81.Key? key;

  final _i87.ScheduleModel? schedule;

  @override
  String toString() {
    return '{"key": "$key", "schedule": "$schedule"}';
  }

  @override
  bool operator ==(covariant ScheduleDataViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.schedule == schedule;
  }

  @override
  int get hashCode {
    return key.hashCode ^ schedule.hashCode;
  }
}

class ScheduleCableTvViewArguments {
  const ScheduleCableTvViewArguments({
    this.key,
    this.schedule,
  });

  final _i81.Key? key;

  final _i87.ScheduleModel? schedule;

  @override
  String toString() {
    return '{"key": "$key", "schedule": "$schedule"}';
  }

  @override
  bool operator ==(covariant ScheduleCableTvViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.schedule == schedule;
  }

  @override
  int get hashCode {
    return key.hashCode ^ schedule.hashCode;
  }
}

class ScheduleElectricityViewArguments {
  const ScheduleElectricityViewArguments({
    this.key,
    this.schedule,
  });

  final _i81.Key? key;

  final _i87.ScheduleModel? schedule;

  @override
  String toString() {
    return '{"key": "$key", "schedule": "$schedule"}';
  }

  @override
  bool operator ==(covariant ScheduleElectricityViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.schedule == schedule;
  }

  @override
  int get hashCode {
    return key.hashCode ^ schedule.hashCode;
  }
}

class UssdViewArguments {
  const UssdViewArguments({
    this.key,
    this.amount,
  });

  final _i81.Key? key;

  final String? amount;

  @override
  String toString() {
    return '{"key": "$key", "amount": "$amount"}';
  }

  @override
  bool operator ==(covariant UssdViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.amount == amount;
  }

  @override
  int get hashCode {
    return key.hashCode ^ amount.hashCode;
  }
}

class TransferMoneyViewArguments {
  const TransferMoneyViewArguments({
    this.key,
    this.isRequestingMoney = false,
  });

  final _i81.Key? key;

  final bool isRequestingMoney;

  @override
  String toString() {
    return '{"key": "$key", "isRequestingMoney": "$isRequestingMoney"}';
  }

  @override
  bool operator ==(covariant TransferMoneyViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isRequestingMoney == isRequestingMoney;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isRequestingMoney.hashCode;
  }
}

class ScheduleTransferMoneyViewArguments {
  const ScheduleTransferMoneyViewArguments({
    this.key,
    this.transfer,
    this.schedule,
  });

  final _i81.Key? key;

  final _i88.Transfer? transfer;

  final _i87.ScheduleModel? schedule;

  @override
  String toString() {
    return '{"key": "$key", "transfer": "$transfer", "schedule": "$schedule"}';
  }

  @override
  bool operator ==(covariant ScheduleTransferMoneyViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.transfer == transfer &&
        other.schedule == schedule;
  }

  @override
  int get hashCode {
    return key.hashCode ^ transfer.hashCode ^ schedule.hashCode;
  }
}

class TransferReceiptArguments {
  const TransferReceiptArguments({
    this.key,
    this.transfer,
  });

  final _i81.Key? key;

  final _i88.Transfer? transfer;

  @override
  String toString() {
    return '{"key": "$key", "transfer": "$transfer"}';
  }

  @override
  bool operator ==(covariant TransferReceiptArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.transfer == transfer;
  }

  @override
  int get hashCode {
    return key.hashCode ^ transfer.hashCode;
  }
}

class TransactionDetailsViewArguments {
  const TransactionDetailsViewArguments({
    this.key,
    required this.transactionHistory,
  });

  final _i81.Key? key;

  final _i89.TransactionHistory transactionHistory;

  @override
  String toString() {
    return '{"key": "$key", "transactionHistory": "$transactionHistory"}';
  }

  @override
  bool operator ==(covariant TransactionDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.transactionHistory == transactionHistory;
  }

  @override
  int get hashCode {
    return key.hashCode ^ transactionHistory.hashCode;
  }
}

class RequestMoneyViewArguments {
  const RequestMoneyViewArguments({
    this.key,
    required this.request,
  });

  final _i81.Key? key;

  final _i90.RequestModel request;

  @override
  String toString() {
    return '{"key": "$key", "request": "$request"}';
  }

  @override
  bool operator ==(covariant RequestMoneyViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.request == request;
  }

  @override
  int get hashCode {
    return key.hashCode ^ request.hashCode;
  }
}

extension NavigatorStateExtension on _i91.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuccessState({
    _i81.Key? key,
    _i81.Widget? statusImage,
    String title = '',
    String message = '',
    String btnTitle = '',
    dynamic Function()? tap,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.successState,
        arguments: SuccessStateArguments(
            key: key,
            statusImage: statusImage,
            title: title,
            message: message,
            btnTitle: btnTitle,
            tap: tap),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView({
    _i81.Key? key,
    int gottenIndex = 0,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        arguments: DashboardViewArguments(key: key, gottenIndex: gottenIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGuestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.guestView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGetGuestEmailView({
    required String route,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.getGuestEmailView,
        arguments: GetGuestEmailViewArguments(route: route, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAirtimeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.airtimeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDataView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dataView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDebitCardView({
    _i81.Key? key,
    String? amount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.debitCardView,
        arguments: DebitCardViewArguments(key: key, amount: amount),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpView({
    _i81.Key? key,
    String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountSettingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTagView({
    _i81.Key? key,
    dynamic Function()? callback,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tagView,
        arguments: TagViewArguments(key: key, callback: callback),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreatePinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmPinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.confirmPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPasswordConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.passwordConfirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyChangeOfPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyChangeOfPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSetNewPasswordView({
    _i81.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.setNewPasswordView,
        arguments: SetNewPasswordViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyPasswordAccountView({
    _i81.Key? key,
    String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyPasswordAccountView,
        arguments: VerifyPasswordAccountViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBiometricView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.biometricView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTierView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tierView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountVerificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountVerificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBvnView({
    _i81.Key? key,
    required String routeName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.bvnView,
        arguments: BvnViewArguments(key: key, routeName: routeName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToIdView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.idView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUtilityBillView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.utilityBillView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRequestBVNView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.requestBVNView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCardCreationSymmaryView({
    _i81.Key? key,
    required _i82.CardDto cardDto,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.cardCreationSymmaryView,
        arguments: CardCreationSymmaryViewArguments(key: key, cardDto: cardDto),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFundWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.fundWalletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVirtualCardDetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.virtualCardDetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRequestChangeOfPhoneNumberView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.requestChangeOfPhoneNumberView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyPhoneOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyPhoneOtpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePhoneNumberView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePhoneNumberView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReferralView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.referralView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBiometricSetupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.biometricSetupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTwoFaAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.twoFaAuthView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFirstSecurityQuestionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.firstSecurityQuestionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSecondSecurityQuestionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.secondSecurityQuestionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTwoFaGoogleAuthenticatorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.twoFaGoogleAuthenticatorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTwoFaGoogleAuthenticatorCodeGeneratorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.twoFaGoogleAuthenticatorCodeGeneratorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTwoFaGoogleAuthenticatorCodeView({
    _i81.Key? key,
    _i83.TwoFaType? twoFaType = _i83.TwoFaType.twoFaSetup,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.twoFaGoogleAuthenticatorCodeView,
        arguments: TwoFaGoogleAuthenticatorCodeViewArguments(
            key: key, twoFaType: twoFaType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSelectedQuestionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.selectedQuestionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDisableView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.disableView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmPasswordView({
    _i81.Key? key,
    _i84.PasswordConfirmationType? passwordConfirmationType =
        _i84.PasswordConfirmationType.disable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.confirmPasswordView,
        arguments: ConfirmPasswordViewArguments(
            key: key, passwordConfirmationType: passwordConfirmationType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCardCalculatorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cardCalculatorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDeleteView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.deleteView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransferMoneyConfirmationView({
    _i81.Key? key,
    required _i85.ConfirmTransferMoney confirmTransferMoney,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.transferMoneyConfirmationView,
        arguments: TransferMoneyConfirmationViewArguments(
            key: key, confirmTransferMoney: confirmTransferMoney),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationDetailsView({
    _i81.Key? key,
    required _i86.NotificationModel notificationModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.notificationDetailsView,
        arguments: NotificationDetailsViewArguments(
            key: key, notificationModel: notificationModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToScheduledAirtimeView({
    _i81.Key? key,
    _i87.ScheduleModel? schedule,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.scheduledAirtimeView,
        arguments: ScheduledAirtimeViewArguments(key: key, schedule: schedule),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToScheduleDataView({
    _i81.Key? key,
    _i87.ScheduleModel? schedule,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.scheduleDataView,
        arguments: ScheduleDataViewArguments(key: key, schedule: schedule),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCableTvView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cableTvView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToScheduleCableTvView({
    _i81.Key? key,
    _i87.ScheduleModel? schedule,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.scheduleCableTvView,
        arguments: ScheduleCableTvViewArguments(key: key, schedule: schedule),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToElectricityView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.electricityView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToScheduleElectricityView({
    _i81.Key? key,
    _i87.ScheduleModel? schedule,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.scheduleElectricityView,
        arguments:
            ScheduleElectricityViewArguments(key: key, schedule: schedule),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInternetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.internetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBettingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bettingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEducationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.educationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileImageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileImageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.voucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyVoucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRedeemVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.redeemVoucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGiftVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.giftVoucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVoucherSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.voucherSuccessView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVoucherHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.voucherHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUssdView({
    _i81.Key? key,
    String? amount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.ussdView,
        arguments: UssdViewArguments(key: key, amount: amount),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransferSuccessState([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.transferSuccessState,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransferMoneyView({
    _i81.Key? key,
    bool isRequestingMoney = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.transferMoneyView,
        arguments: TransferMoneyViewArguments(
            key: key, isRequestingMoney: isRequestingMoney),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToScheduleTransferMoneyView({
    _i81.Key? key,
    _i88.Transfer? transfer,
    _i87.ScheduleModel? schedule,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.scheduleTransferMoneyView,
        arguments: ScheduleTransferMoneyViewArguments(
            key: key, transfer: transfer, schedule: schedule),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransferReceipt({
    _i81.Key? key,
    _i88.Transfer? transfer,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.transferReceipt,
        arguments: TransferReceiptArguments(key: key, transfer: transfer),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransactionDetailsView({
    _i81.Key? key,
    required _i89.TransactionHistory transactionHistory,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.transactionDetailsView,
        arguments: TransactionDetailsViewArguments(
            key: key, transactionHistory: transactionHistory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRequestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.requestView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRequestMoneyView({
    _i81.Key? key,
    required _i90.RequestModel request,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.requestMoneyView,
        arguments: RequestMoneyViewArguments(key: key, request: request),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToScheduleView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.scheduleView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPagaWebView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pagaWebView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuccessState({
    _i81.Key? key,
    _i81.Widget? statusImage,
    String title = '',
    String message = '',
    String btnTitle = '',
    dynamic Function()? tap,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.successState,
        arguments: SuccessStateArguments(
            key: key,
            statusImage: statusImage,
            title: title,
            message: message,
            btnTitle: btnTitle,
            tap: tap),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView({
    _i81.Key? key,
    int gottenIndex = 0,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        arguments: DashboardViewArguments(key: key, gottenIndex: gottenIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGuestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.guestView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGetGuestEmailView({
    required String route,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.getGuestEmailView,
        arguments: GetGuestEmailViewArguments(route: route, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAirtimeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.airtimeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDataView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dataView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDebitCardView({
    _i81.Key? key,
    String? amount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.debitCardView,
        arguments: DebitCardViewArguments(key: key, amount: amount),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView({
    _i81.Key? key,
    String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountSettingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTagView({
    _i81.Key? key,
    dynamic Function()? callback,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.tagView,
        arguments: TagViewArguments(key: key, callback: callback),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreatePinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmPinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.confirmPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPasswordConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.passwordConfirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changePinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyChangeOfPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifyChangeOfPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSetNewPasswordView({
    _i81.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.setNewPasswordView,
        arguments: SetNewPasswordViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyPasswordAccountView({
    _i81.Key? key,
    String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.verifyPasswordAccountView,
        arguments: VerifyPasswordAccountViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBiometricView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.biometricView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTierView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tierView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountVerificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountVerificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBvnView({
    _i81.Key? key,
    required String routeName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.bvnView,
        arguments: BvnViewArguments(key: key, routeName: routeName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithIdView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.idView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUtilityBillView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.utilityBillView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRequestBVNView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.requestBVNView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCardCreationSymmaryView({
    _i81.Key? key,
    required _i82.CardDto cardDto,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.cardCreationSymmaryView,
        arguments: CardCreationSymmaryViewArguments(key: key, cardDto: cardDto),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFundWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.fundWalletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVirtualCardDetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.virtualCardDetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRequestChangeOfPhoneNumberView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.requestChangeOfPhoneNumberView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyPhoneOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifyPhoneOtpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePhoneNumberView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changePhoneNumberView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReferralView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.referralView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBiometricSetupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.biometricSetupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTwoFaAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.twoFaAuthView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFirstSecurityQuestionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.firstSecurityQuestionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSecondSecurityQuestionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.secondSecurityQuestionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTwoFaGoogleAuthenticatorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.twoFaGoogleAuthenticatorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTwoFaGoogleAuthenticatorCodeGeneratorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        Routes.twoFaGoogleAuthenticatorCodeGeneratorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTwoFaGoogleAuthenticatorCodeView({
    _i81.Key? key,
    _i83.TwoFaType? twoFaType = _i83.TwoFaType.twoFaSetup,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.twoFaGoogleAuthenticatorCodeView,
        arguments: TwoFaGoogleAuthenticatorCodeViewArguments(
            key: key, twoFaType: twoFaType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSelectedQuestionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.selectedQuestionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDisableView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.disableView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmPasswordView({
    _i81.Key? key,
    _i84.PasswordConfirmationType? passwordConfirmationType =
        _i84.PasswordConfirmationType.disable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.confirmPasswordView,
        arguments: ConfirmPasswordViewArguments(
            key: key, passwordConfirmationType: passwordConfirmationType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCardCalculatorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cardCalculatorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDeleteView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.deleteView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransferMoneyConfirmationView({
    _i81.Key? key,
    required _i85.ConfirmTransferMoney confirmTransferMoney,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.transferMoneyConfirmationView,
        arguments: TransferMoneyConfirmationViewArguments(
            key: key, confirmTransferMoney: confirmTransferMoney),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationDetailsView({
    _i81.Key? key,
    required _i86.NotificationModel notificationModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.notificationDetailsView,
        arguments: NotificationDetailsViewArguments(
            key: key, notificationModel: notificationModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithScheduledAirtimeView({
    _i81.Key? key,
    _i87.ScheduleModel? schedule,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.scheduledAirtimeView,
        arguments: ScheduledAirtimeViewArguments(key: key, schedule: schedule),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithScheduleDataView({
    _i81.Key? key,
    _i87.ScheduleModel? schedule,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.scheduleDataView,
        arguments: ScheduleDataViewArguments(key: key, schedule: schedule),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCableTvView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cableTvView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithScheduleCableTvView({
    _i81.Key? key,
    _i87.ScheduleModel? schedule,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.scheduleCableTvView,
        arguments: ScheduleCableTvViewArguments(key: key, schedule: schedule),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithElectricityView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.electricityView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithScheduleElectricityView({
    _i81.Key? key,
    _i87.ScheduleModel? schedule,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.scheduleElectricityView,
        arguments:
            ScheduleElectricityViewArguments(key: key, schedule: schedule),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInternetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.internetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBettingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bettingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEducationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.educationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileImageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileImageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.voucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyVoucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRedeemVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.redeemVoucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGiftVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.giftVoucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVoucherSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.voucherSuccessView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVoucherHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.voucherHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUssdView({
    _i81.Key? key,
    String? amount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.ussdView,
        arguments: UssdViewArguments(key: key, amount: amount),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransferSuccessState([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.transferSuccessState,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransferMoneyView({
    _i81.Key? key,
    bool isRequestingMoney = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.transferMoneyView,
        arguments: TransferMoneyViewArguments(
            key: key, isRequestingMoney: isRequestingMoney),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithScheduleTransferMoneyView({
    _i81.Key? key,
    _i88.Transfer? transfer,
    _i87.ScheduleModel? schedule,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.scheduleTransferMoneyView,
        arguments: ScheduleTransferMoneyViewArguments(
            key: key, transfer: transfer, schedule: schedule),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransferReceipt({
    _i81.Key? key,
    _i88.Transfer? transfer,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.transferReceipt,
        arguments: TransferReceiptArguments(key: key, transfer: transfer),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransactionDetailsView({
    _i81.Key? key,
    required _i89.TransactionHistory transactionHistory,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.transactionDetailsView,
        arguments: TransactionDetailsViewArguments(
            key: key, transactionHistory: transactionHistory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRequestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.requestView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRequestMoneyView({
    _i81.Key? key,
    required _i90.RequestModel request,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.requestMoneyView,
        arguments: RequestMoneyViewArguments(key: key, request: request),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithScheduleView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.scheduleView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPagaWebView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pagaWebView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

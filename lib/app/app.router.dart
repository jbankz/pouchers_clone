// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i54;
import 'package:flutter/material.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart' as _i48;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/enum/two_fa_type.dart'
    as _i56;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/first_security_question_view.dart'
    as _i39;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/second_security_question_view.dart'
    as _i40;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/selected_question_view.dart'
    as _i44;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_code_generator_view.dart'
    as _i42;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_code_view.dart'
    as _i43;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_view.dart'
    as _i41;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_intro_view.dart'
    as _i38;
import 'package:Pouchers/ui/features/authentication/presentation/view/otp/otp_view.dart'
    as _i10;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/confirm_password_view.dart'
    as _i46;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/enum/password_confirmation_type.dart'
    as _i57;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/forgot_password_view.dart'
    as _i17;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/set_new_password_view.dart'
    as _i19;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/verify_change_of_password_view.dart'
    as _i18;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/change_pin_view.dart'
    as _i16;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/cofirm_pin_view.dart'
    as _i14;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/create_pin_view.dart'
    as _i13;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/password_confirmation_view.dart'
    as _i15;
import 'package:Pouchers/ui/features/authentication/presentation/view/signin/sign_in_view.dart'
    as _i5;
import 'package:Pouchers/ui/features/authentication/presentation/view/signup/sign_up_view.dart'
    as _i4;
import 'package:Pouchers/ui/features/authentication/presentation/view/tag/tag_view.dart'
    as _i12;
import 'package:Pouchers/ui/features/authentication/presentation/view/verify_password/verify_password_account.dart'
    as _i20;
import 'package:Pouchers/ui/features/dashboard/views/account/views/account_settings_view.dart'
    as _i11;
import 'package:Pouchers/ui/features/dashboard/views/account/views/account_verification.dart'
    as _i23;
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart'
    as _i55;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/bvn_requirement_view.dart'
    as _i27;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/card_calculator_view.dart'
    as _i28;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/card_creation_summary_view.dart'
    as _i29;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/virtual_card_detail_view.dart'
    as _i31;
import 'package:Pouchers/ui/features/dashboard/views/dashboard_view.dart'
    as _i7;
import 'package:Pouchers/ui/features/notification/domain/model/notification_model.dart'
    as _i59;
import 'package:Pouchers/ui/features/notification/presentation/view/notification_details_view.dart'
    as _i51;
import 'package:Pouchers/ui/features/notification/presentation/view/notification_view.dart'
    as _i50;
import 'package:Pouchers/ui/features/onboarding/presentation/views/onboarding_view.dart'
    as _i3;
import 'package:Pouchers/ui/features/onboarding/presentation/views/splash_view.dart'
    as _i2;
import 'package:Pouchers/ui/features/profile/presentation/views/account/account_details_view.dart'
    as _i52;
import 'package:Pouchers/ui/features/profile/presentation/views/biometric/biometric_setup_view.dart'
    as _i37;
import 'package:Pouchers/ui/features/profile/presentation/views/biometric/biometric_view.dart'
    as _i21;
import 'package:Pouchers/ui/features/profile/presentation/views/delete/delete_view.dart'
    as _i47;
import 'package:Pouchers/ui/features/profile/presentation/views/disable/disable_view.dart'
    as _i45;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/bvn/bvn_view.dart'
    as _i24;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/id/id_view.dart'
    as _i25;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/utility/utility_bill_view.dart'
    as _i26;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/phone/change_password_view.dart'
    as _i35;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/phone/requst_change_of_phone_number_view.dart'
    as _i33;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/phone/verify_phone_number_view.dart'
    as _i34;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/profile_view.dart'
    as _i32;
import 'package:Pouchers/ui/features/profile/presentation/views/referral/referral_view.dart'
    as _i36;
import 'package:Pouchers/ui/features/profile/presentation/views/wallet/fund_wallet_view.dart'
    as _i30;
import 'package:Pouchers/ui/features/tiers/presentation/view/tier_view.dart'
    as _i22;
import 'package:Pouchers/ui/features/transfer/domain/dto/confirm_transfer_money_dto.dart'
    as _i58;
import 'package:Pouchers/ui/features/transfer/presentation/transfer_money_confirmation_view.dart'
    as _i49;
import 'package:Pouchers/ui/features/utilities/presentation/views/airtime/airtime_view.dart'
    as _i8;
import 'package:Pouchers/ui/features/utilities/presentation/views/airtime/schedule_airtime_view.dart'
    as _i53;
import 'package:Pouchers/ui/features/utilities/presentation/views/data/data_view.dart'
    as _i9;
import 'package:Pouchers/ui/widgets/success_state.dart' as _i6;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i60;

class Routes {
  static const splashView = '/';

  static const onboardingView = '/onboarding-view';

  static const signUpView = '/sign-up-view';

  static const signInView = '/sign-in-view';

  static const successState = '/success-state';

  static const dashboardView = '/dashboard-view';

  static const airtimeView = '/airtime-view';

  static const dataView = '/data-view';

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

  static const cardCalculatorView = '/card-calculator-view';

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

  static const deleteView = '/delete-view';

  static const tabLayout = '/tab-layout';

  static const transferMoneyConfirmationView =
      '/transfer-money-confirmation-view';

  static const notificationView = '/notification-view';

  static const notificationDetailsView = '/notification-details-view';

  static const accountDetailsView = '/account-details-view';

  static const scheduledAirtimeView = '/scheduled-airtime-view';

  static const all = <String>{
    splashView,
    onboardingView,
    signUpView,
    signInView,
    successState,
    dashboardView,
    airtimeView,
    dataView,
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
    cardCalculatorView,
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
    deleteView,
    tabLayout,
    transferMoneyConfirmationView,
    notificationView,
    notificationDetailsView,
    accountDetailsView,
    scheduledAirtimeView,
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
      Routes.airtimeView,
      page: _i8.AirtimeView,
    ),
    _i1.RouteDef(
      Routes.dataView,
      page: _i9.DataView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i10.OtpView,
    ),
    _i1.RouteDef(
      Routes.accountSettingsView,
      page: _i11.AccountSettingsView,
    ),
    _i1.RouteDef(
      Routes.tagView,
      page: _i12.TagView,
    ),
    _i1.RouteDef(
      Routes.createPinView,
      page: _i13.CreatePinView,
    ),
    _i1.RouteDef(
      Routes.confirmPinView,
      page: _i14.ConfirmPinView,
    ),
    _i1.RouteDef(
      Routes.passwordConfirmationView,
      page: _i15.PasswordConfirmationView,
    ),
    _i1.RouteDef(
      Routes.changePinView,
      page: _i16.ChangePinView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i17.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.verifyChangeOfPasswordView,
      page: _i18.VerifyChangeOfPasswordView,
    ),
    _i1.RouteDef(
      Routes.setNewPasswordView,
      page: _i19.SetNewPasswordView,
    ),
    _i1.RouteDef(
      Routes.verifyPasswordAccountView,
      page: _i20.VerifyPasswordAccountView,
    ),
    _i1.RouteDef(
      Routes.biometricView,
      page: _i21.BiometricView,
    ),
    _i1.RouteDef(
      Routes.tierView,
      page: _i22.TierView,
    ),
    _i1.RouteDef(
      Routes.accountVerificationView,
      page: _i23.AccountVerificationView,
    ),
    _i1.RouteDef(
      Routes.bvnView,
      page: _i24.BvnView,
    ),
    _i1.RouteDef(
      Routes.idView,
      page: _i25.IdView,
    ),
    _i1.RouteDef(
      Routes.utilityBillView,
      page: _i26.UtilityBillView,
    ),
    _i1.RouteDef(
      Routes.requestBVNView,
      page: _i27.RequestBVNView,
    ),
    _i1.RouteDef(
      Routes.cardCalculatorView,
      page: _i28.CardCalculatorView,
    ),
    _i1.RouteDef(
      Routes.cardCreationSymmaryView,
      page: _i29.CardCreationSymmaryView,
    ),
    _i1.RouteDef(
      Routes.fundWalletView,
      page: _i30.FundWalletView,
    ),
    _i1.RouteDef(
      Routes.virtualCardDetailView,
      page: _i31.VirtualCardDetailView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i32.ProfileView,
    ),
    _i1.RouteDef(
      Routes.requestChangeOfPhoneNumberView,
      page: _i33.RequestChangeOfPhoneNumberView,
    ),
    _i1.RouteDef(
      Routes.verifyPhoneOtpView,
      page: _i34.VerifyPhoneOtpView,
    ),
    _i1.RouteDef(
      Routes.changePhoneNumberView,
      page: _i35.ChangePhoneNumberView,
    ),
    _i1.RouteDef(
      Routes.referralView,
      page: _i36.ReferralView,
    ),
    _i1.RouteDef(
      Routes.biometricSetupView,
      page: _i37.BiometricSetupView,
    ),
    _i1.RouteDef(
      Routes.twoFaAuthView,
      page: _i38.TwoFaAuthView,
    ),
    _i1.RouteDef(
      Routes.firstSecurityQuestionView,
      page: _i39.FirstSecurityQuestionView,
    ),
    _i1.RouteDef(
      Routes.secondSecurityQuestionView,
      page: _i40.SecondSecurityQuestionView,
    ),
    _i1.RouteDef(
      Routes.twoFaGoogleAuthenticatorView,
      page: _i41.TwoFaGoogleAuthenticatorView,
    ),
    _i1.RouteDef(
      Routes.twoFaGoogleAuthenticatorCodeGeneratorView,
      page: _i42.TwoFaGoogleAuthenticatorCodeGeneratorView,
    ),
    _i1.RouteDef(
      Routes.twoFaGoogleAuthenticatorCodeView,
      page: _i43.TwoFaGoogleAuthenticatorCodeView,
    ),
    _i1.RouteDef(
      Routes.selectedQuestionView,
      page: _i44.SelectedQuestionView,
    ),
    _i1.RouteDef(
      Routes.disableView,
      page: _i45.DisableView,
    ),
    _i1.RouteDef(
      Routes.confirmPasswordView,
      page: _i46.ConfirmPasswordView,
    ),
    _i1.RouteDef(
      Routes.deleteView,
      page: _i47.DeleteView,
    ),
    _i1.RouteDef(
      Routes.tabLayout,
      page: _i48.TabLayout,
    ),
    _i1.RouteDef(
      Routes.transferMoneyConfirmationView,
      page: _i49.TransferMoneyConfirmationView,
    ),
    _i1.RouteDef(
      Routes.notificationView,
      page: _i50.NotificationView,
    ),
    _i1.RouteDef(
      Routes.notificationDetailsView,
      page: _i51.NotificationDetailsView,
    ),
    _i1.RouteDef(
      Routes.accountDetailsView,
      page: _i52.AccountDetailsView,
    ),
    _i1.RouteDef(
      Routes.scheduledAirtimeView,
      page: _i53.ScheduledAirtimeView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i54.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.SplashView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i3.OnboardingView: (data) {
      return _i54.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i3.OnboardingView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i4.SignUpView: (data) {
      return _i54.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i4.SignUpView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i5.SignInView: (data) {
      return _i54.PageRouteBuilder<dynamic>(
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
      return _i54.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i6.SuccessState(
                key: args.key,
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
      return _i54.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i7.DashboardView(key: args.key, gottenIndex: args.gottenIndex),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i8.AirtimeView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i8.AirtimeView(),
        settings: data,
      );
    },
    _i9.DataView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i9.DataView(),
        settings: data,
      );
    },
    _i10.OtpView: (data) {
      final args = data.getArgs<OtpViewArguments>(
        orElse: () => const OtpViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i10.OtpView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i11.AccountSettingsView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i11.AccountSettingsView(),
        settings: data,
      );
    },
    _i12.TagView: (data) {
      final args = data.getArgs<TagViewArguments>(
        orElse: () => const TagViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i12.TagView(key: args.key, callback: args.callback),
        settings: data,
      );
    },
    _i13.CreatePinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i13.CreatePinView(),
        settings: data,
      );
    },
    _i14.ConfirmPinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i14.ConfirmPinView(),
        settings: data,
      );
    },
    _i15.PasswordConfirmationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i15.PasswordConfirmationView(),
        settings: data,
      );
    },
    _i16.ChangePinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i16.ChangePinView(),
        settings: data,
      );
    },
    _i17.ForgotPasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i17.ForgotPasswordView(),
        settings: data,
      );
    },
    _i18.VerifyChangeOfPasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i18.VerifyChangeOfPasswordView(),
        settings: data,
      );
    },
    _i19.SetNewPasswordView: (data) {
      final args = data.getArgs<SetNewPasswordViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i19.SetNewPasswordView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i20.VerifyPasswordAccountView: (data) {
      final args = data.getArgs<VerifyPasswordAccountViewArguments>(
        orElse: () => const VerifyPasswordAccountViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i20.VerifyPasswordAccountView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i21.BiometricView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i21.BiometricView(),
        settings: data,
      );
    },
    _i22.TierView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i22.TierView(),
        settings: data,
      );
    },
    _i23.AccountVerificationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i23.AccountVerificationView(),
        settings: data,
      );
    },
    _i24.BvnView: (data) {
      final args = data.getArgs<BvnViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i24.BvnView(key: args.key, routeName: args.routeName),
        settings: data,
      );
    },
    _i25.IdView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i25.IdView(),
        settings: data,
      );
    },
    _i26.UtilityBillView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i26.UtilityBillView(),
        settings: data,
      );
    },
    _i27.RequestBVNView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i27.RequestBVNView(),
        settings: data,
      );
    },
    _i28.CardCalculatorView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i28.CardCalculatorView(),
        settings: data,
      );
    },
    _i29.CardCreationSymmaryView: (data) {
      final args =
          data.getArgs<CardCreationSymmaryViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i29.CardCreationSymmaryView(key: args.key, cardDto: args.cardDto),
        settings: data,
      );
    },
    _i30.FundWalletView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i30.FundWalletView(),
        settings: data,
      );
    },
    _i31.VirtualCardDetailView: (data) {
      return _i54.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i31.VirtualCardDetailView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i32.ProfileView: (data) {
      return _i54.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i32.ProfileView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i33.RequestChangeOfPhoneNumberView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i33.RequestChangeOfPhoneNumberView(),
        settings: data,
      );
    },
    _i34.VerifyPhoneOtpView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i34.VerifyPhoneOtpView(),
        settings: data,
      );
    },
    _i35.ChangePhoneNumberView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i35.ChangePhoneNumberView(),
        settings: data,
      );
    },
    _i36.ReferralView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i36.ReferralView(),
        settings: data,
      );
    },
    _i37.BiometricSetupView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i37.BiometricSetupView(),
        settings: data,
      );
    },
    _i38.TwoFaAuthView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i38.TwoFaAuthView(),
        settings: data,
      );
    },
    _i39.FirstSecurityQuestionView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i39.FirstSecurityQuestionView(),
        settings: data,
      );
    },
    _i40.SecondSecurityQuestionView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i40.SecondSecurityQuestionView(),
        settings: data,
      );
    },
    _i41.TwoFaGoogleAuthenticatorView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i41.TwoFaGoogleAuthenticatorView(),
        settings: data,
      );
    },
    _i42.TwoFaGoogleAuthenticatorCodeGeneratorView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            const _i42.TwoFaGoogleAuthenticatorCodeGeneratorView(),
        settings: data,
      );
    },
    _i43.TwoFaGoogleAuthenticatorCodeView: (data) {
      final args = data.getArgs<TwoFaGoogleAuthenticatorCodeViewArguments>(
        orElse: () => const TwoFaGoogleAuthenticatorCodeViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i43.TwoFaGoogleAuthenticatorCodeView(
            key: args.key, twoFaType: args.twoFaType),
        settings: data,
      );
    },
    _i44.SelectedQuestionView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i44.SelectedQuestionView(),
        settings: data,
      );
    },
    _i45.DisableView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i45.DisableView(),
        settings: data,
      );
    },
    _i46.ConfirmPasswordView: (data) {
      final args = data.getArgs<ConfirmPasswordViewArguments>(
        orElse: () => const ConfirmPasswordViewArguments(),
      );
      return _i54.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i46.ConfirmPasswordView(
                key: args.key,
                passwordConfirmationType: args.passwordConfirmationType),
        settings: data,
        opaque: false,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideBottom,
      );
    },
    _i47.DeleteView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i47.DeleteView(),
        settings: data,
      );
    },
    _i48.TabLayout: (data) {
      final args = data.getArgs<TabLayoutArguments>(
        orElse: () => const TabLayoutArguments(),
      );
      return _i54.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i48.TabLayout(gottenIndex: args.gottenIndex),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i49.TransferMoneyConfirmationView: (data) {
      final args =
          data.getArgs<TransferMoneyConfirmationViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i49.TransferMoneyConfirmationView(
            key: args.key, confirmTransferMoney: args.confirmTransferMoney),
        settings: data,
      );
    },
    _i50.NotificationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i50.NotificationView(),
        settings: data,
      );
    },
    _i51.NotificationDetailsView: (data) {
      final args =
          data.getArgs<NotificationDetailsViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i51.NotificationDetailsView(
            key: args.key, notificationModel: args.notificationModel),
        settings: data,
      );
    },
    _i52.AccountDetailsView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i52.AccountDetailsView(),
        settings: data,
      );
    },
    _i53.ScheduledAirtimeView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i53.ScheduledAirtimeView(),
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
    this.title = '',
    this.message = '',
    this.btnTitle = '',
    this.tap,
  });

  final _i54.Key? key;

  final String title;

  final String message;

  final String btnTitle;

  final dynamic Function()? tap;

  @override
  String toString() {
    return '{"key": "$key", "title": "$title", "message": "$message", "btnTitle": "$btnTitle", "tap": "$tap"}';
  }

  @override
  bool operator ==(covariant SuccessStateArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.title == title &&
        other.message == message &&
        other.btnTitle == btnTitle &&
        other.tap == tap;
  }

  @override
  int get hashCode {
    return key.hashCode ^
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

  final _i54.Key? key;

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

class OtpViewArguments {
  const OtpViewArguments({
    this.key,
    this.email,
  });

  final _i54.Key? key;

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

  final _i54.Key? key;

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

  final _i54.Key? key;

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

  final _i54.Key? key;

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

  final _i54.Key? key;

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

  final _i54.Key? key;

  final _i55.CardDto cardDto;

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
    this.twoFaType = _i56.TwoFaType.twoFaSetup,
  });

  final _i54.Key? key;

  final _i56.TwoFaType? twoFaType;

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
    this.passwordConfirmationType = _i57.PasswordConfirmationType.disable,
  });

  final _i54.Key? key;

  final _i57.PasswordConfirmationType? passwordConfirmationType;

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

class TabLayoutArguments {
  const TabLayoutArguments({this.gottenIndex});

  final int? gottenIndex;

  @override
  String toString() {
    return '{"gottenIndex": "$gottenIndex"}';
  }

  @override
  bool operator ==(covariant TabLayoutArguments other) {
    if (identical(this, other)) return true;
    return other.gottenIndex == gottenIndex;
  }

  @override
  int get hashCode {
    return gottenIndex.hashCode;
  }
}

class TransferMoneyConfirmationViewArguments {
  const TransferMoneyConfirmationViewArguments({
    this.key,
    required this.confirmTransferMoney,
  });

  final _i54.Key? key;

  final _i58.ConfirmTransferMoney confirmTransferMoney;

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

  final _i54.Key? key;

  final _i59.NotificationModel notificationModel;

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

extension NavigatorStateExtension on _i60.NavigationService {
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
    _i54.Key? key,
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
    _i54.Key? key,
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

  Future<dynamic> navigateToOtpView({
    _i54.Key? key,
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
    _i54.Key? key,
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
    _i54.Key? key,
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
    _i54.Key? key,
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
    _i54.Key? key,
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

  Future<dynamic> navigateToCardCreationSymmaryView({
    _i54.Key? key,
    required _i55.CardDto cardDto,
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
    _i54.Key? key,
    _i56.TwoFaType? twoFaType = _i56.TwoFaType.twoFaSetup,
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
    _i54.Key? key,
    _i57.PasswordConfirmationType? passwordConfirmationType =
        _i57.PasswordConfirmationType.disable,
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

  Future<dynamic> navigateToTabLayout({
    int? gottenIndex,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tabLayout,
        arguments: TabLayoutArguments(gottenIndex: gottenIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransferMoneyConfirmationView({
    _i54.Key? key,
    required _i58.ConfirmTransferMoney confirmTransferMoney,
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
    _i54.Key? key,
    required _i59.NotificationModel notificationModel,
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

  Future<dynamic> navigateToScheduledAirtimeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.scheduledAirtimeView,
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
    _i54.Key? key,
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
    _i54.Key? key,
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

  Future<dynamic> replaceWithOtpView({
    _i54.Key? key,
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
    _i54.Key? key,
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
    _i54.Key? key,
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
    _i54.Key? key,
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
    _i54.Key? key,
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

  Future<dynamic> replaceWithCardCreationSymmaryView({
    _i54.Key? key,
    required _i55.CardDto cardDto,
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
    _i54.Key? key,
    _i56.TwoFaType? twoFaType = _i56.TwoFaType.twoFaSetup,
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
    _i54.Key? key,
    _i57.PasswordConfirmationType? passwordConfirmationType =
        _i57.PasswordConfirmationType.disable,
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

  Future<dynamic> replaceWithTabLayout({
    int? gottenIndex,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.tabLayout,
        arguments: TabLayoutArguments(gottenIndex: gottenIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransferMoneyConfirmationView({
    _i54.Key? key,
    required _i58.ConfirmTransferMoney confirmTransferMoney,
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
    _i54.Key? key,
    required _i59.NotificationModel notificationModel,
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

  Future<dynamic> replaceWithScheduledAirtimeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.scheduledAirtimeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i46;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/first_security_question_view.dart'
    as _i37;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/second_security_question_view.dart'
    as _i38;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/selected_question_view.dart'
    as _i42;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_code_generator_view.dart'
    as _i40;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_code_view.dart'
    as _i41;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_view.dart'
    as _i39;
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/two_fa_intro_view.dart'
    as _i36;
import 'package:Pouchers/ui/features/authentication/presentation/view/otp/otp_view.dart'
    as _i8;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/confirm_password_view.dart'
    as _i44;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/enum/password_confirmation_type.dart'
    as _i48;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/forgot_password_view.dart'
    as _i15;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/set_new_password_view.dart'
    as _i17;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/verify_change_of_password_view.dart'
    as _i16;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/change_pin_view.dart'
    as _i14;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/cofirm_pin_view.dart'
    as _i12;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/create_pin_view.dart'
    as _i11;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/password_confirmation_view.dart'
    as _i13;
import 'package:Pouchers/ui/features/authentication/presentation/view/signin/sign_in_view.dart'
    as _i5;
import 'package:Pouchers/ui/features/authentication/presentation/view/signup/sign_up_view.dart'
    as _i4;
import 'package:Pouchers/ui/features/authentication/presentation/view/tag/tag_view.dart'
    as _i10;
import 'package:Pouchers/ui/features/authentication/presentation/view/verify_password/verify_password_account.dart'
    as _i18;
import 'package:Pouchers/ui/features/dashboard/views/account/views/account_settings_view.dart'
    as _i9;
import 'package:Pouchers/ui/features/dashboard/views/account/views/account_verification.dart'
    as _i21;
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart'
    as _i47;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/bvn_requirement_view.dart'
    as _i25;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/card_calculator_view.dart'
    as _i26;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/card_creation_summary_view.dart'
    as _i27;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/virtual_card_detail_view.dart'
    as _i29;
import 'package:Pouchers/ui/features/dashboard/views/dashboard_view.dart'
    as _i7;
import 'package:Pouchers/ui/features/onboarding/presentation/views/onboarding_view.dart'
    as _i3;
import 'package:Pouchers/ui/features/onboarding/presentation/views/splash_view.dart'
    as _i2;
import 'package:Pouchers/ui/features/profile/presentation/views/biometric/biometric_setup_view.dart'
    as _i35;
import 'package:Pouchers/ui/features/profile/presentation/views/biometric/biometric_view.dart'
    as _i19;
import 'package:Pouchers/ui/features/profile/presentation/views/delete/delete_view.dart'
    as _i45;
import 'package:Pouchers/ui/features/profile/presentation/views/disable/disable_view.dart'
    as _i43;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/bvn/bvn_view.dart'
    as _i22;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/id/id_view.dart'
    as _i23;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/utility/utility_bill_view.dart'
    as _i24;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/phone/change_password_view.dart'
    as _i33;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/phone/requst_change_of_phone_number_view.dart'
    as _i31;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/phone/verify_phone_number_view.dart'
    as _i32;
import 'package:Pouchers/ui/features/profile/presentation/views/profile/profile_view.dart'
    as _i30;
import 'package:Pouchers/ui/features/profile/presentation/views/referral/referral_view.dart'
    as _i34;
import 'package:Pouchers/ui/features/profile/presentation/views/wallet/fund_wallet_view.dart'
    as _i28;
import 'package:Pouchers/ui/features/tiers/presentation/view/tier_view.dart'
    as _i20;
import 'package:Pouchers/ui/widgets/success_state.dart' as _i6;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i49;

class Routes {
  static const splashView = '/';

  static const onboardingView = '/onboarding-view';

  static const signUpView = '/sign-up-view';

  static const signInView = '/sign-in-view';

  static const successState = '/success-state';

  static const dashboardView = '/dashboard-view';

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

  static const all = <String>{
    splashView,
    onboardingView,
    signUpView,
    signInView,
    successState,
    dashboardView,
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
      Routes.otpView,
      page: _i8.OtpView,
    ),
    _i1.RouteDef(
      Routes.accountSettingsView,
      page: _i9.AccountSettingsView,
    ),
    _i1.RouteDef(
      Routes.tagView,
      page: _i10.TagView,
    ),
    _i1.RouteDef(
      Routes.createPinView,
      page: _i11.CreatePinView,
    ),
    _i1.RouteDef(
      Routes.confirmPinView,
      page: _i12.ConfirmPinView,
    ),
    _i1.RouteDef(
      Routes.passwordConfirmationView,
      page: _i13.PasswordConfirmationView,
    ),
    _i1.RouteDef(
      Routes.changePinView,
      page: _i14.ChangePinView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i15.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.verifyChangeOfPasswordView,
      page: _i16.VerifyChangeOfPasswordView,
    ),
    _i1.RouteDef(
      Routes.setNewPasswordView,
      page: _i17.SetNewPasswordView,
    ),
    _i1.RouteDef(
      Routes.verifyPasswordAccountView,
      page: _i18.VerifyPasswordAccountView,
    ),
    _i1.RouteDef(
      Routes.biometricView,
      page: _i19.BiometricView,
    ),
    _i1.RouteDef(
      Routes.tierView,
      page: _i20.TierView,
    ),
    _i1.RouteDef(
      Routes.accountVerificationView,
      page: _i21.AccountVerificationView,
    ),
    _i1.RouteDef(
      Routes.bvnView,
      page: _i22.BvnView,
    ),
    _i1.RouteDef(
      Routes.idView,
      page: _i23.IdView,
    ),
    _i1.RouteDef(
      Routes.utilityBillView,
      page: _i24.UtilityBillView,
    ),
    _i1.RouteDef(
      Routes.requestBVNView,
      page: _i25.RequestBVNView,
    ),
    _i1.RouteDef(
      Routes.cardCalculatorView,
      page: _i26.CardCalculatorView,
    ),
    _i1.RouteDef(
      Routes.cardCreationSymmaryView,
      page: _i27.CardCreationSymmaryView,
    ),
    _i1.RouteDef(
      Routes.fundWalletView,
      page: _i28.FundWalletView,
    ),
    _i1.RouteDef(
      Routes.virtualCardDetailView,
      page: _i29.VirtualCardDetailView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i30.ProfileView,
    ),
    _i1.RouteDef(
      Routes.requestChangeOfPhoneNumberView,
      page: _i31.RequestChangeOfPhoneNumberView,
    ),
    _i1.RouteDef(
      Routes.verifyPhoneOtpView,
      page: _i32.VerifyPhoneOtpView,
    ),
    _i1.RouteDef(
      Routes.changePhoneNumberView,
      page: _i33.ChangePhoneNumberView,
    ),
    _i1.RouteDef(
      Routes.referralView,
      page: _i34.ReferralView,
    ),
    _i1.RouteDef(
      Routes.biometricSetupView,
      page: _i35.BiometricSetupView,
    ),
    _i1.RouteDef(
      Routes.twoFaAuthView,
      page: _i36.TwoFaAuthView,
    ),
    _i1.RouteDef(
      Routes.firstSecurityQuestionView,
      page: _i37.FirstSecurityQuestionView,
    ),
    _i1.RouteDef(
      Routes.secondSecurityQuestionView,
      page: _i38.SecondSecurityQuestionView,
    ),
    _i1.RouteDef(
      Routes.twoFaGoogleAuthenticatorView,
      page: _i39.TwoFaGoogleAuthenticatorView,
    ),
    _i1.RouteDef(
      Routes.twoFaGoogleAuthenticatorCodeGeneratorView,
      page: _i40.TwoFaGoogleAuthenticatorCodeGeneratorView,
    ),
    _i1.RouteDef(
      Routes.twoFaGoogleAuthenticatorCodeView,
      page: _i41.TwoFaGoogleAuthenticatorCodeView,
    ),
    _i1.RouteDef(
      Routes.selectedQuestionView,
      page: _i42.SelectedQuestionView,
    ),
    _i1.RouteDef(
      Routes.disableView,
      page: _i43.DisableView,
    ),
    _i1.RouteDef(
      Routes.confirmPasswordView,
      page: _i44.ConfirmPasswordView,
    ),
    _i1.RouteDef(
      Routes.deleteView,
      page: _i45.DeleteView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i46.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.SplashView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i3.OnboardingView: (data) {
      return _i46.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i3.OnboardingView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i4.SignUpView: (data) {
      return _i46.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i4.SignUpView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i5.SignInView: (data) {
      return _i46.PageRouteBuilder<dynamic>(
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
      return _i46.PageRouteBuilder<dynamic>(
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
      return _i46.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i7.DashboardView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i8.OtpView: (data) {
      final args = data.getArgs<OtpViewArguments>(
        orElse: () => const OtpViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i8.OtpView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i9.AccountSettingsView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i9.AccountSettingsView(),
        settings: data,
      );
    },
    _i10.TagView: (data) {
      final args = data.getArgs<TagViewArguments>(
        orElse: () => const TagViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i10.TagView(key: args.key, callback: args.callback),
        settings: data,
      );
    },
    _i11.CreatePinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i11.CreatePinView(),
        settings: data,
      );
    },
    _i12.ConfirmPinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i12.ConfirmPinView(),
        settings: data,
      );
    },
    _i13.PasswordConfirmationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i13.PasswordConfirmationView(),
        settings: data,
      );
    },
    _i14.ChangePinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i14.ChangePinView(),
        settings: data,
      );
    },
    _i15.ForgotPasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i15.ForgotPasswordView(),
        settings: data,
      );
    },
    _i16.VerifyChangeOfPasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i16.VerifyChangeOfPasswordView(),
        settings: data,
      );
    },
    _i17.SetNewPasswordView: (data) {
      final args = data.getArgs<SetNewPasswordViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i17.SetNewPasswordView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i18.VerifyPasswordAccountView: (data) {
      final args = data.getArgs<VerifyPasswordAccountViewArguments>(
        orElse: () => const VerifyPasswordAccountViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i18.VerifyPasswordAccountView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i19.BiometricView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i19.BiometricView(),
        settings: data,
      );
    },
    _i20.TierView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i20.TierView(),
        settings: data,
      );
    },
    _i21.AccountVerificationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i21.AccountVerificationView(),
        settings: data,
      );
    },
    _i22.BvnView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i22.BvnView(),
        settings: data,
      );
    },
    _i23.IdView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i23.IdView(),
        settings: data,
      );
    },
    _i24.UtilityBillView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i24.UtilityBillView(),
        settings: data,
      );
    },
    _i25.RequestBVNView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i25.RequestBVNView(),
        settings: data,
      );
    },
    _i26.CardCalculatorView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i26.CardCalculatorView(),
        settings: data,
      );
    },
    _i27.CardCreationSymmaryView: (data) {
      final args =
          data.getArgs<CardCreationSymmaryViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i27.CardCreationSymmaryView(key: args.key, cardDto: args.cardDto),
        settings: data,
      );
    },
    _i28.FundWalletView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i28.FundWalletView(),
        settings: data,
      );
    },
    _i29.VirtualCardDetailView: (data) {
      return _i46.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i29.VirtualCardDetailView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i30.ProfileView: (data) {
      return _i46.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i30.ProfileView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i31.RequestChangeOfPhoneNumberView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i31.RequestChangeOfPhoneNumberView(),
        settings: data,
      );
    },
    _i32.VerifyPhoneOtpView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i32.VerifyPhoneOtpView(),
        settings: data,
      );
    },
    _i33.ChangePhoneNumberView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i33.ChangePhoneNumberView(),
        settings: data,
      );
    },
    _i34.ReferralView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i34.ReferralView(),
        settings: data,
      );
    },
    _i35.BiometricSetupView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i35.BiometricSetupView(),
        settings: data,
      );
    },
    _i36.TwoFaAuthView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i36.TwoFaAuthView(),
        settings: data,
      );
    },
    _i37.FirstSecurityQuestionView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i37.FirstSecurityQuestionView(),
        settings: data,
      );
    },
    _i38.SecondSecurityQuestionView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i38.SecondSecurityQuestionView(),
        settings: data,
      );
    },
    _i39.TwoFaGoogleAuthenticatorView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i39.TwoFaGoogleAuthenticatorView(),
        settings: data,
      );
    },
    _i40.TwoFaGoogleAuthenticatorCodeGeneratorView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            const _i40.TwoFaGoogleAuthenticatorCodeGeneratorView(),
        settings: data,
      );
    },
    _i41.TwoFaGoogleAuthenticatorCodeView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i41.TwoFaGoogleAuthenticatorCodeView(),
        settings: data,
      );
    },
    _i42.SelectedQuestionView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i42.SelectedQuestionView(),
        settings: data,
      );
    },
    _i43.DisableView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i43.DisableView(),
        settings: data,
      );
    },
    _i44.ConfirmPasswordView: (data) {
      final args = data.getArgs<ConfirmPasswordViewArguments>(
        orElse: () => const ConfirmPasswordViewArguments(),
      );
      return _i46.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i44.ConfirmPasswordView(
                key: args.key,
                passwordConfirmationType: args.passwordConfirmationType),
        settings: data,
        opaque: false,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideBottom,
      );
    },
    _i45.DeleteView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i45.DeleteView(),
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

  final _i46.Key? key;

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

class OtpViewArguments {
  const OtpViewArguments({
    this.key,
    this.email,
  });

  final _i46.Key? key;

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

  final _i46.Key? key;

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

  final _i46.Key? key;

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

  final _i46.Key? key;

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

class CardCreationSymmaryViewArguments {
  const CardCreationSymmaryViewArguments({
    this.key,
    required this.cardDto,
  });

  final _i46.Key? key;

  final _i47.CardDto cardDto;

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

class ConfirmPasswordViewArguments {
  const ConfirmPasswordViewArguments({
    this.key,
    this.passwordConfirmationType = _i48.PasswordConfirmationType.disable,
  });

  final _i46.Key? key;

  final _i48.PasswordConfirmationType? passwordConfirmationType;

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

extension NavigatorStateExtension on _i49.NavigationService {
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
    _i46.Key? key,
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

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpView({
    _i46.Key? key,
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
    _i46.Key? key,
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
    _i46.Key? key,
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
    _i46.Key? key,
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

  Future<dynamic> navigateToBvnView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bvnView,
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
    _i46.Key? key,
    required _i47.CardDto cardDto,
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

  Future<dynamic> navigateToTwoFaGoogleAuthenticatorCodeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.twoFaGoogleAuthenticatorCodeView,
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
    _i46.Key? key,
    _i48.PasswordConfirmationType? passwordConfirmationType =
        _i48.PasswordConfirmationType.disable,
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
    _i46.Key? key,
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

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView({
    _i46.Key? key,
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
    _i46.Key? key,
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
    _i46.Key? key,
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
    _i46.Key? key,
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

  Future<dynamic> replaceWithBvnView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bvnView,
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
    _i46.Key? key,
    required _i47.CardDto cardDto,
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

  Future<dynamic> replaceWithTwoFaGoogleAuthenticatorCodeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.twoFaGoogleAuthenticatorCodeView,
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
    _i46.Key? key,
    _i48.PasswordConfirmationType? passwordConfirmationType =
        _i48.PasswordConfirmationType.disable,
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
}

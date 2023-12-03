import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/first_security_question_view.dart';
import 'package:Pouchers/ui/features/profile/presentation/views/wallet/fund_wallet_view.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/features/authentication/presentation/view/2fa/second_security_question_view.dart';
import '../ui/features/authentication/presentation/view/2fa/selected_question_view.dart';
import '../ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_code_generator_view.dart';
import '../ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_code_view.dart';
import '../ui/features/authentication/presentation/view/2fa/two_fa_google_authenticator_view.dart';
import '../ui/features/authentication/presentation/view/2fa/two_fa_intro_view.dart';
import '../ui/features/authentication/presentation/view/password/confirm_password_view.dart';
import '../ui/features/profile/presentation/views/biometric/biometric_setup_view.dart';
import '../ui/features/profile/presentation/views/biometric/biometric_view.dart';
import '../ui/features/authentication/presentation/view/otp/otp_view.dart';
import '../ui/features/authentication/presentation/view/password/forgot_password_view.dart';
import '../ui/features/authentication/presentation/view/password/set_new_password_view.dart';
import '../ui/features/authentication/presentation/view/password/verify_change_of_password_view.dart';
import '../ui/features/authentication/presentation/view/pin/change_pin_view.dart';
import '../ui/features/authentication/presentation/view/pin/cofirm_pin_view.dart';
import '../ui/features/authentication/presentation/view/pin/create_pin_view.dart';
import '../ui/features/authentication/presentation/view/pin/password_confirmation_view.dart';
import '../ui/features/authentication/presentation/view/signin/sign_in_view.dart';
import '../ui/features/authentication/presentation/view/signup/sign_up_view.dart';
import '../ui/features/authentication/presentation/view/tag/tag_view.dart';
import '../ui/features/authentication/presentation/view/verify_password/verify_password_account.dart';
import '../ui/features/dashboard/views/account/views/account_settings_view.dart';
import '../ui/features/dashboard/views/account/views/account_verification.dart';
import '../ui/features/dashboard/views/card/presentation/view/bvn_requirement_view.dart';
import '../ui/features/dashboard/views/card/presentation/view/card_calculator_view.dart';
import '../ui/features/dashboard/views/card/presentation/view/card_creation_summary_view.dart';
import '../ui/features/dashboard/views/card/presentation/view/virtual_card_detail_view.dart';
import '../ui/features/dashboard/views/dashboard_view.dart';
import '../ui/features/onboarding/presentation/views/onboarding_view.dart';
import '../ui/features/onboarding/presentation/views/splash_view.dart';
import '../ui/features/profile/presentation/views/delete/delete_view.dart';
import '../ui/features/profile/presentation/views/disable/disable_view.dart';
import '../ui/features/profile/presentation/views/kyc/bvn/bvn_view.dart';
import '../ui/features/profile/presentation/views/kyc/id/id_view.dart';
import '../ui/features/profile/presentation/views/kyc/utility/utility_bill_view.dart';
import '../ui/features/profile/presentation/views/profile/phone/change_password_view.dart';
import '../ui/features/profile/presentation/views/profile/phone/requst_change_of_phone_number_view.dart';
import '../ui/features/profile/presentation/views/profile/phone/verify_phone_number_view.dart';
import '../ui/features/profile/presentation/views/profile/profile_view.dart';
import '../ui/features/profile/presentation/views/referral/referral_view.dart';
import '../ui/features/tiers/presentation/view/tier_view.dart';
import '../ui/widgets/success_state.dart';
import 'core/manager/biometric_manager.dart';
import 'core/manager/dojah_manager.dart';
import 'core/manager/hive_manager.dart';
import 'core/manager/image_manager.dart';
import 'core/manager/secure_manager.dart';
import 'core/manager/session_manager.dart';

@StackedApp(
  routes: [
    CustomRoute(
        page: SplashView,
        opaque: false,
        initial: true,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: OnboardingView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: SignUpView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: SignInView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: SuccessState,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.slideBottom),
    CustomRoute(
        page: DashboardView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    // AdaptiveRoute(page: GuestView),
    // AdaptiveRoute(page: GetGuestEmailView),
    // AdaptiveRoute(page: AirtimeView),
    // AdaptiveRoute(page: DebitCardView),
    AdaptiveRoute(page: OtpView),
    AdaptiveRoute(page: AccountSettingsView),
    AdaptiveRoute(page: TagView),
    AdaptiveRoute(page: CreatePinView),
    AdaptiveRoute(page: ConfirmPinView),
    AdaptiveRoute(page: PasswordConfirmationView),
    AdaptiveRoute(page: ChangePinView),
    AdaptiveRoute(page: ForgotPasswordView),
    AdaptiveRoute(page: VerifyChangeOfPasswordView),
    AdaptiveRoute(page: SetNewPasswordView),
    AdaptiveRoute(page: VerifyPasswordAccountView),
    AdaptiveRoute(page: BiometricView),
    AdaptiveRoute(page: TierView),
    AdaptiveRoute(page: AccountVerificationView),
    AdaptiveRoute(page: BvnView),
    AdaptiveRoute(page: IdView),
    AdaptiveRoute(page: UtilityBillView),
    AdaptiveRoute(page: RequestBVNView),
    AdaptiveRoute(page: CardCalculatorView),
    AdaptiveRoute(page: CardCreationSymmaryView),
    AdaptiveRoute(page: FundWalletView),
    CustomRoute(
        page: VirtualCardDetailView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: ProfileView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    AdaptiveRoute(page: RequestChangeOfPhoneNumberView),
    AdaptiveRoute(page: VerifyPhoneOtpView),
    AdaptiveRoute(page: ChangePhoneNumberView),
    AdaptiveRoute(page: ReferralView),
    AdaptiveRoute(page: BiometricSetupView),
    AdaptiveRoute(page: TwoFaAuthView),
    AdaptiveRoute(page: FirstSecurityQuestionView),
    AdaptiveRoute(page: SecondSecurityQuestionView),
    AdaptiveRoute(page: TwoFaGoogleAuthenticatorView),
    AdaptiveRoute(page: TwoFaGoogleAuthenticatorCodeGeneratorView),
    AdaptiveRoute(page: TwoFaGoogleAuthenticatorCodeView),
    AdaptiveRoute(page: SelectedQuestionView),
    AdaptiveRoute(page: DisableView),
    CustomRoute(
        page: ConfirmPasswordView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.slideBottom),
    AdaptiveRoute(page: DeleteView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: SessionManager),
    LazySingleton(classType: BiometricManager),
    LazySingleton(classType: FlutterSecureStorage),
    LazySingleton(classType: SecuredManager),
    LazySingleton(classType: HiveManager),
    LazySingleton(classType: DojahManager),
    LazySingleton(classType: ImageManager),
  ],
  logger: StackedLogger(),
)
class App {}

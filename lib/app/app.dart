import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/features/authentication/presentation/view/biometric/biometric_view.dart';
import '../ui/features/authentication/presentation/view/password/set_new_password_view.dart';
import '../ui/features/authentication/presentation/view/password/verify_change_of_password_view.dart';
import '../ui/features/authentication/presentation/view/pin/change_pin_view.dart';
import '../ui/features/authentication/presentation/view/pin/cofirm_pin_view.dart';
import '../ui/features/authentication/presentation/view/pin/create_pin_view.dart';
import '../ui/features/authentication/presentation/view/pin/password_confirmation_view.dart';
import '../ui/features/authentication/presentation/view/signin/sign_in_view.dart';
import '../ui/features/authentication/presentation/view/signup/sign_up_view.dart';
import '../ui/features/authentication/presentation/view/tag/tag_view.dart';
import '../ui/features/dashboard/views/account/views/account_settings_view.dart';
import '../ui/features/dashboard/views/account/views/account_verification.dart';
import '../ui/features/dashboard/views/dashboard_view.dart';
import '../ui/features/onboarding/presentation/views/onboarding_view.dart';
import '../ui/features/profile/presentation/views/kyc/bvn/bvn_view.dart';
import '../ui/features/profile/presentation/views/kyc/id/id_view.dart';
import '../ui/features/tiers/presentation/view/tier_view.dart';
import '../ui/widgets/success_state.dart';
import 'core/manager/biometric_manager.dart';
import 'core/manager/hive_manager.dart';
import 'core/manager/secure_manager.dart';
import 'core/manager/session_manager.dart';

@StackedApp(
  routes: [
    CustomRoute(
        page: OnboardingView,
        opaque: false,
        initial: true,
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
    // AdaptiveRoute(page: OtpView),
    AdaptiveRoute(page: AccountSettingsView),
    AdaptiveRoute(page: TagView),
    AdaptiveRoute(page: CreatePinView),
    AdaptiveRoute(page: ConfirmPinView),
    AdaptiveRoute(page: PasswordConfirmationView),
    AdaptiveRoute(page: ChangePinView),
    // AdaptiveRoute(page: ForgotPasswordView),
    AdaptiveRoute(page: VerifyChangeOfPasswordView),
    AdaptiveRoute(page: SetNewPasswordView),
    // AdaptiveRoute(page: VerifyPasswordAccountView),
    AdaptiveRoute(page: BiometricView),
    AdaptiveRoute(page: TierView),
    AdaptiveRoute(page: AccountVerificationView),
    AdaptiveRoute(page: BvnView),
    AdaptiveRoute(page: IdView),
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
  ],
  logger: StackedLogger(),
)
class App {}

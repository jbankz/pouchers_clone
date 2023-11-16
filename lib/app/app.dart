import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/features/onboarding/presentation/views/onboarding_view.dart';
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
    // CustomRoute(
    //     page: SignUpView,
    //     opaque: false,
    //     transitionsBuilder: TransitionsBuilders.fadeIn),
    // CustomRoute(
    //     page: SignInView,
    //     opaque: false,
    //     transitionsBuilder: TransitionsBuilders.fadeIn),
    // CustomRoute(
    //     page: SuccessState,
    //     opaque: false,
    //     transitionsBuilder: TransitionsBuilders.slideBottom),
    // CustomRoute(
    //     page: DashboardView,
    //     opaque: false,
    //     transitionsBuilder: TransitionsBuilders.fadeIn),
    // AdaptiveRoute(page: GuestView),
    // AdaptiveRoute(page: GetGuestEmailView),
    // AdaptiveRoute(page: AirtimeView),
    // AdaptiveRoute(page: DebitCardView),
    // AdaptiveRoute(page: OtpView),
    // AdaptiveRoute(page: TagView),
    // AdaptiveRoute(page: CreatePinView),
    // AdaptiveRoute(page: ConfirmPinView),
    // AdaptiveRoute(page: ForgotPasswordView),
    // AdaptiveRoute(page: SetNewPasswordView),
    // AdaptiveRoute(page: VerifyPasswordAccountView),
    // AdaptiveRoute(page: BiometricView),
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

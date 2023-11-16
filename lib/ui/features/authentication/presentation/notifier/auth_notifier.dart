import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/core/manager/session_manager.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/app.router.dart';
import '../../../../../app/core/manager/biometric_manager.dart';
import '../../../../../app/core/manager/secure_manager.dart';
import '../../../../../app/core/state/app_state.dart';
import '../../../../../app/navigators/navigators.dart';
import '../../../../../modules/create_account/screens/verify_account.dart';
import '../../../../../modules/tab_layout/screens/tab_layout.dart';
import '../../../../notification/notification_tray.dart';
import '../view/otp/notifier/module.dart';
import 'module/module.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  final _logger = getLogger('AuthNotifier');

  final _biometricManager = locator<BiometricManager>();
  final _securedManager = locator<SecuredManager>();
  final _sessionManager = locator<SessionManager>();

  @override
  AppState build() => AppState(data: _sessionManager.isBiometricEnabled);

  Future<void> signUpUser(AuthDto parameter, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(signUpUserProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      ///TODO: Don't use 'BuildContext's across async gaps.
      ///Try rewriting the code to not reference the 'BuildContext'.
      pushTo(PageRouter.globalContext, VerifyAccount(email: parameter.email),
          settings: const RouteSettings(name: VerifyAccount.routeName));

      // PageRouter.pushNamed(Routes.otpView,
      //     args: OtpViewArguments(email: parameter.email));
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(),
          error: true, ignoreIfNull: e.toString().isNull);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> signInUser(AuthDto parameter,
      [CancelToken? cancelToken, bool isBiometricAuth = false]) async {
    try {
      state = state.copyWith(isBusy: true);

      final response = await ref.read(signInUserProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      if (response?.data?.tag == null) {
        PageRouter.pushNamed(Routes.tagView,
            args: TagViewArguments(callback: () => signInUser(parameter)));
        state = state.copyWith(isBusy: false);
        return;
      }
      if (response?.data?.iscreatedpin == false) {
        PageRouter.pushNamed(Routes.createPinView);
        state = state.copyWith(isBusy: false);
        return;
      }

      if (!isBiometricAuth && await _biometricManager.isBiometricEnabled()) {
        PageRouter.pushReplacement(Routes.biometricView);
        state = state.copyWith(isBusy: false);
        return;
      }

      PageRouter.pushReplacement(Routes.dashboardView);
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(),
          error: true, ignoreIfNull: e.toString().isNull);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> requestOtp(AuthDto parameter, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      final response = await ref.read(requestOTPProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      triggerNotificationTray(response?.message ?? '');
      ref.read(otpTimerModule.notifier).resetTimer();
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(),
          error: true, ignoreIfNull: e.toString().isNull);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> verifyAccountEmail(AuthDto parameter, Function() onError,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      final response = await ref.read(verifyOTPProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      triggerNotificationTray(response?.message ?? '');
      // PageRouter.pushNamed(Routes.tagView);
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(),
          error: true, ignoreIfNull: e.toString().isNull);
      onError();
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> createTag(AuthDto parameter,
      {Function()? callback, CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(createTagProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      if (callback != null) {
        callback();
        state = state.copyWith(isBusy: false);
        return;
      }

      // PageRouter.pushNamed(Routes.createPinView);
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(),
          error: true, ignoreIfNull: e.toString().isNull);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> createTransactionPin(AuthDto parameter,
      {CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      final response = await ref.read(createTransactionPinProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      triggerNotificationTray(response?.message ?? '');

      if (await _biometricManager.isBiometricEnabled()) {
        PageRouter.pushReplacement(Routes.biometricView);
        return;
      }

      ///TODO: Don't use 'BuildContext's across async gaps.
      ///Try rewriting the code to not reference the 'BuildContext'.
      pushToAndClearStack(PageRouter.globalContext, TabLayout());
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(),
          error: true, ignoreIfNull: e.toString().isNull);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> forgotPassword(AuthDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(forgotPasswordProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      // PageRouter.pushNamed(Routes.verifyPasswordAccountView,
      //     args: VerifyPasswordAccountViewArguments(email: parameter.email));
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(),
          error: true, ignoreIfNull: e.toString().isNull);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> validateResetPassword(AuthDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(validateResetPasswordProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      // PageRouter.pushNamed(Routes.setNewPasswordView,
      //     args: SetNewPasswordViewArguments(email: parameter.email ?? ''));
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(),
          error: true, ignoreIfNull: e.toString().isNull);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> resetPassword(AuthDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(resetPasswordProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      // PageRouter.pushReplacement(Routes.successState,
      //     args: SuccessStateArguments(
      //         title: AppString.resetSuccessful,
      //         message: AppString.resetSuccessfulMessage,
      //         btnTitle: AppString.login,
      //         tap: () => PageRouter.pushReplacement(Routes.signInView)));
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(),
          error: true, ignoreIfNull: e.toString().isNull);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> signInUserWithBiometric(CancelToken cancelToken) async {
    final List<String> values = await Future.wait(
        [_securedManager.readEmailCred(), _securedManager.readPasswordCred()]);

    await signInUser(
        AuthDto(email: values.first, password: values[1]), cancelToken, true);
  }
}

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/core/manager/intercom_manager.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/two_fa_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/model/selected_questions.dart';
import 'package:Pouchers/ui/features/authentication/presentation/view/2fa/enum/two_fa_type.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/features/profile/presentation/views/biometric/dao/biometric_dao.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/app.router.dart';
import '../../../../../app/config/app_helper.dart';
import '../../../../../app/core/manager/biometric_manager.dart';
import '../../../../../app/core/manager/secure_manager.dart';
import '../../../../../app/navigators/navigators.dart';
import '../../../../../modules/tab_layout/screens/tab_layout.dart';
import '../../../../common/app_strings.dart';
import '../../../../notification/notification_tray.dart';
import '../../../profile/presentation/views/widgets/account_info_sheet.dart';
import '../../domain/model/generate_2fa_token.dart';
import '../../domain/model/security_questions.dart';
import '../state/auth_state.dart';
import '../view/otp/notifier/module.dart';
import 'module/module.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  final _logger = getLogger('AuthNotifier');

  final _biometricManager = locator<BiometricManager>();
  final _securedManager = locator<SecuredManager>();
  List<SecurityQuestions> _securityQuestions = [];
  List<SelectedQuestions> _selectedQuestions = [];
  Generate2faToken? _generate2faToken;

  @override
  AuthState build() => AuthState(data: biometricDao.login);

  Future<void> signUpUser(AuthDto parameter, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(signUpUserProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.otpView,
          args: OtpViewArguments(email: parameter.email));
    } catch (e) {
      _logger.e(e.toString());

      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> signInUser(AuthDto parameter,
      {CancelToken? cancelToken,
      bool isBiometricAuth = false,
      Function()? onSuccess,
      Function(String error)? onError}) async {
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

      if (!isBiometricAuth &&
          await _biometricManager.isBiometricEnabled() &&
          !biometricDao.login) {
        PageRouter.pushReplacement(Routes.biometricView);
        state = state.copyWith(isBusy: false);
        return;
      }

      if (response?.data?.is2faActive == true) {
        PageRouter.pushNamed(Routes.twoFaGoogleAuthenticatorCodeView,
            args: const TwoFaGoogleAuthenticatorCodeViewArguments(
                twoFaType: TwoFaType.twoFaLoginVerification));
        state = state.copyWith(isBusy: false);
        return;
      }

      if (onSuccess != null) {
        onSuccess();
        state = state.copyWith(isBusy: false);
        return;
      }

      PageRouter.pushReplacement(Routes.tabLayout);
    } catch (e) {
      _logger.e(e.toString());

      if (e.toString().contains('User is not verified')) {
        await requestOtp(AuthDto(email: parameter.email), cancelToken, false);

        PageRouter.pushNamed(Routes.otpView,
            args: OtpViewArguments(email: parameter.email));
        state = state.copyWith(isBusy: false);
        return;
      }

      if (e.toString().contains('User account is disabled')) {
        final response = await BottomSheets.showAlertDialog(
            child: AccountInfoWindow(
                config: Config(
                    title: AppString.accountDisabled,
                    content: AppString.accountDisabledHint,
                    buttonText: AppString.contactSupport)));
        if (response) {
          IntercomManager.displayMessenger();
        }
        state = state.copyWith(isBusy: false);
        return;
      }

      if (onError != null) {
        onError(e.toString());
        state = state.copyWith(isBusy: false);
        return;
      }

      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
      ref.invalidateSelf();
    }
  }

  Future<void> requestOtp(AuthDto parameter,
      [CancelToken? cancelToken, bool triggerTimer = true]) async {
    try {
      state = state.copyWith(isBusy: true);

      final response = await ref.read(requestOTPProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      triggerNotificationTray(response?.message ?? '');
      if (triggerTimer) ref.read(otpTimerModule.notifier).resetTimer();
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> verifyAccountEmail({
    required AuthDto parameter,
    required Function() onError,
    required CancelToken? cancelToken,
  }) async {
    try {
      state = state.copyWith(isBusy: true);
      final response = await ref.read(verifyOTPProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      triggerNotificationTray(response?.message ?? '');
      PageRouter.pushNamed(Routes.tagView);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
      onError();
    } finally {
      state = state.copyWith(isBusy: false);
    }
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

      PageRouter.pushNamed(Routes.createPinView);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
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
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
      ref.invalidateSelf();
    }
  }

  Future<void> forgotPassword(AuthDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(forgotPasswordProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.verifyPasswordAccountView,
          args: VerifyPasswordAccountViewArguments(email: parameter.email));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> validateResetPassword(AuthDto parameter,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(validateResetPasswordProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.setNewPasswordView,
          args: SetNewPasswordViewArguments(email: parameter.email ?? ''));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> resetPassword(AuthDto parameter,
      {CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(resetPasswordProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      if (ref.watch(paramModule).userJustWantsToChangeTherePassword) {
        PageRouter.pushNamed(Routes.successState,
            args: SuccessStateArguments(
                title: AppString.resetSuccessful,
                message: AppString.resetSuccessfulMessage,
                btnTitle: AppString.goHome,
                tap: () => PageRouter.popToRoot(Routes.accountSettingsView)));
        state = state.copyWith(isBusy: false);
        return;
      }

      PageRouter.pushReplacement(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.resetSuccessful,
              message: AppString.resetSuccessfulMessage,
              btnTitle: AppString.login,
              tap: () => PageRouter.pushReplacement(Routes.signInView)));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> signInUserWithBiometric({
    required CancelToken cancelToken,
    Function()? callback,
    Function(String error)? onError,
  }) async {
    final List<String> values = await Future.wait(
        [_securedManager.readEmailCred(), _securedManager.readPasswordCred()]);

    await signInUser(AuthDto(email: values.first, password: values[1]),
        cancelToken: cancelToken,
        isBiometricAuth: true,
        onSuccess: callback,
        onError: onError);
  }

  Future<void> changePin(AuthDto parameter, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(changePinProvider
          .call(parameter: parameter, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.resetSuccessful,
              message: AppString.resetPinSuccessfulMessage,
              btnTitle: AppString.goHome,
              tap: () => PageRouter.popToRoot(Routes.accountSettingsView)));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> validatePin(String pin, CancelToken cancelToken,
      {Function()? onSuccess, Function()? onError}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(validatePinProvider
          .call(
              parameter: AuthDto(transactionPin: pin), cancelToken: cancelToken)
          .future);

      if (onSuccess != null) onSuccess();
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
      if (onError != null) onError();
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> securityQuestions(CancelToken cancelToken) async {
    try {
      state = state.copyWith(isBusy: true);

      _securityQuestions = await ref.read(
          securityQuestionsProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state =
          state.copyWith(isBusy: false, securityQuestion: _securityQuestions);
    }
  }

  Future<void> answerQuestion(
      {required TwoFaDto twoFaDto,
      required CancelToken cancelToken,
      required String route}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(answerQuestionProvider
          .call(twoFaDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(route);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> generateTwoFaToken({required CancelToken cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      _generate2faToken = await ref.read(
          generateTwoFaTokenProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state =
          state.copyWith(isBusy: false, generate2faToken: _generate2faToken);
    }
  }

  Future<void> validateTwoFaToken(
      {required String user2faToken,
      required CancelToken cancelToken,
      required Function() onError,
      required void Function() onSuccess}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(validate2faCodeProvider
          .call(TwoFaDto(user2faToken: user2faToken), cancelToken: cancelToken)
          .future);

      onSuccess();
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
      onError();
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> selectedQuestions(CancelToken cancelToken) async {
    try {
      state = state.copyWith(isBusy: true);

      _selectedQuestions = await ref.read(
          selectedQuestionsProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state =
          state.copyWith(isBusy: false, selectedQuestions: _selectedQuestions);
    }
  }

  Future<void> validate2fa(TwoFaDto twoFaDto,
      {CancelToken? cancelToken, required Function() success}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(validate2faAnswerProvider
          .call(twoFaDto, cancelToken: cancelToken)
          .future);

      success();
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }
}

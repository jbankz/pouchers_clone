import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/authentication/presentation/view/otp/notifier/module.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/profile/domain/model/idenitification_type.dart';
import 'package:Pouchers/ui/features/tiers/presentation/notifier/tier_notifier.dart';
import 'package:Pouchers/ui/notification/notification_tray.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/manager/dojah_manager.dart';
import '../../../../../app/core/state/app_state.dart';
import '../../domain/dto/user_dto.dart';
import 'module/module.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  final _logger = getLogger('UserNotifier');

  final DojahManager _dojahManager = locator<DojahManager>();

  @override
  AppState build() => const AppState();

  Future<void> getUserProfile([CancelToken? cancelToken]) async {
    try {
      // if (userDao.user.tierLevels != 2) return;

      state = state.copyWith(isBusy: true);
      await ref
          .read(getUsersProfileProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> validateBVN(UserDto userDto, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(validateBVNProvider
          .call(userDto: userDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.completed,
              message: AppString.bvnCompleted,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.popToRoot(Routes.accountVerificationView)));
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(), error: true);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> validateID(UserDto userDto, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(validateIDProvider
          .call(userDto: userDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.completed,
              message: AppString.idCompleted,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.popToRoot(Routes.accountVerificationView)));
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(), error: true);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> requestPhoneNumberOtp(UserDto userDto,
      {CancelToken? cancelToken, bool resent = false}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(requestPhoneNumberOtpProvider
          .call(userDto: userDto, cancelToken: cancelToken)
          .future);

      triggerNotificationTray(AppString.resetCodeSent);

      if (resent) {
        ref.read(otpTimerModule.notifier).resetTimer();
        state = state.copyWith(isBusy: false);
        return;
      }

      PageRouter.pushNamed(Routes.verifyPhoneOtpView);
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(), error: true);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> validatePhoneNumberOtp(UserDto userDto,
      {CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(validatePhoneNumberOtpProvider
          .call(userDto: userDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushNamed(Routes.changePhoneNumberView);
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(), error: true);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> updateProfile(UserDto userDto,
      {CancelToken? cancelToken, Function()? success}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(updateProfileProvider
          .call(userDto: userDto, cancelToken: cancelToken)
          .future);

      triggerNotificationTray(AppString.profileUpdateSuccessful);

      if (success != null) success();
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(), error: true);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> changePhone(UserDto userDto, {CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(changePhoneNumberProvider
          .call(userDto: userDto, cancelToken: cancelToken)
          .future);

      triggerNotificationTray(AppString.profileUpdateSuccessful);

      PageRouter.popToRoot(Routes.profileView);
    } catch (e) {
      _logger.e(e.toString());
      triggerNotificationTray(e.toString(), error: true);
    }
    state = state.copyWith(isBusy: false);
  }

  Future<void> triggerDojah(
      {required IdentificationType? identificationType,
      required dynamic Function(dynamic) onSuccess}) async {
    try {
      await _dojahManager.triggerDojah(
          user: userDao.user,
          widgetId: identificationType?.dojahKey ?? '',
          onSuccess: (success) => onSuccess(success));
    } catch (e) {
      _logger.e(e);
    }
  }
}

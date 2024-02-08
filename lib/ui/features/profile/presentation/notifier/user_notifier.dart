import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/app/core/manager/session_manager.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/authentication/presentation/view/otp/notifier/module.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/profile/domain/model/idenitification_type.dart';
import 'package:Pouchers/ui/notification/notification_tray.dart';
import 'package:dio/dio.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/manager/dojah_manager.dart';
import '../../data/dao/referral_dao.dart';
import '../../domain/dto/user_dto.dart';
import '../../domain/model/mocked/reasons.dart';
import '../../domain/model/referral/referral.dart';
import '../../domain/model/user.dart';
import '../state/user_state.dart';
import 'module/module.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  final _logger = getLogger('UserNotifier');

  final DojahManager _dojahManager = locator<DojahManager>();
  Referral? _referral;
  final SessionManager _sessionManager = locator<SessionManager>();
  User? _user;
  List<User> _pouchersContacts = [];

  @override
  UserState build() =>
      UserState(disableReason: disableReason, deleteReason: deleteReason);

  Future<void> getUserProfile([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      await ref
          .read(getUsersProfileProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> validateBVN(UserDto userDto,
      {CancelToken? cancelToken, required String route}) async {
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
              tap: () => PageRouter.popToRoot(route)));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
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
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
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
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
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
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> updateProfile(UserDto userDto,
      {CancelToken? cancelToken,
      Function()? success,
      bool showNotificationTray = true}) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(updateProfileProvider
          .call(userDto: userDto, cancelToken: cancelToken)
          .future);

      if (showNotificationTray) {
        triggerNotificationTray(AppString.profileUpdateSuccessful);
      }

      if (success != null) success();
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
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
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
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

  Future<void> referrals([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: referralDao.box.isEmpty);

      _referral = await ref
          .read(referralProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false, referral: _referral);
    }
  }

  Future<void> disableAccount(String reason, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(
          disableAccountProvider.call(reason, cancelToken: cancelToken).future);

      PageRouter.pushReplacement(Routes.signInView);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> getUserByTag(UserDto userDto, {CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isGettingUserByTag: true);

      _user = await ref.read(getUserByTagProvider
          .call(userDto: userDto, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
      _user = null;
    } finally {
      state = state.copyWith(isGettingUserByTag: false, user: _user);
    }
  }

  Future<void> deleteAccount([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref
          .read(deleteAccountProvider.call(cancelToken: cancelToken).future);

      PageRouter.pushReplacement(Routes.signInView);
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> logout() async {
    await _sessionManager.logOut();
    PageRouter.pushReplacement(Routes.signInView);
  }

  Future<void> getContacts({CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(isGettinContacts: true);
      final List<String> nativeContacts = [];

      final contacts = await FastContacts.getAllContacts();
      for (var contact in contacts) {
        for (var phone in contact.phones) {
          nativeContacts.add(phone.number);
        }
      }

      _pouchersContacts = await ref.read(getContactsProvider
          .call(
              userDto: UserDto(contacts: nativeContacts),
              cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state =
          state.copyWith(isGettinContacts: false, contacts: _pouchersContacts);
    }
  }
}

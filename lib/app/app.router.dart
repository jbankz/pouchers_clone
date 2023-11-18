// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i20;
import 'package:flutter/material.dart' as _i19;
import 'package:flutter/material.dart';
import 'package:Pouchers/ui/features/authentication/presentation/view/biometric/biometric_view.dart'
    as _i15;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/set_new_password_view.dart'
    as _i14;
import 'package:Pouchers/ui/features/authentication/presentation/view/password/verify_change_of_password_view.dart'
    as _i13;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/change_pin_view.dart'
    as _i12;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/cofirm_pin_view.dart'
    as _i10;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/create_pin_view.dart'
    as _i9;
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/password_confirmation_view.dart'
    as _i11;
import 'package:Pouchers/ui/features/authentication/presentation/view/signin/sign_in_view.dart'
    as _i4;
import 'package:Pouchers/ui/features/authentication/presentation/view/signup/sign_up_view.dart'
    as _i3;
import 'package:Pouchers/ui/features/authentication/presentation/view/tag/tag_view.dart'
    as _i8;
import 'package:Pouchers/ui/features/dashboard/views/account/views/account_settings_view.dart'
    as _i7;
import 'package:Pouchers/ui/features/dashboard/views/account/views/account_verification.dart'
    as _i17;
import 'package:Pouchers/ui/features/dashboard/views/dashboard_view.dart'
    as _i6;
import 'package:Pouchers/ui/features/onboarding/presentation/views/onboarding_view.dart'
    as _i2;
import 'package:Pouchers/ui/features/profile/presentation/views/bvn/bvn_view.dart'
    as _i18;
import 'package:Pouchers/ui/features/tiers/presentation/view/tier_view.dart'
    as _i16;
import 'package:Pouchers/ui/widgets/success_state.dart' as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i21;

class Routes {
  static const onboardingView = '/';

  static const signUpView = '/sign-up-view';

  static const signInView = '/sign-in-view';

  static const successState = '/success-state';

  static const dashboardView = '/dashboard-view';

  static const accountSettingsView = '/account-settings-view';

  static const tagView = '/tag-view';

  static const createPinView = '/create-pin-view';

  static const confirmPinView = '/confirm-pin-view';

  static const passwordConfirmationView = '/password-confirmation-view';

  static const changePinView = '/change-pin-view';

  static const verifyChangeOfPasswordView = '/verify-change-of-password-view';

  static const setNewPasswordView = '/set-new-password-view';

  static const biometricView = '/biometric-view';

  static const tierView = '/tier-view';

  static const accountVerificationView = '/account-verification-view';

  static const bvnView = '/bvn-view';

  static const all = <String>{
    onboardingView,
    signUpView,
    signInView,
    successState,
    dashboardView,
    accountSettingsView,
    tagView,
    createPinView,
    confirmPinView,
    passwordConfirmationView,
    changePinView,
    verifyChangeOfPasswordView,
    setNewPasswordView,
    biometricView,
    tierView,
    accountVerificationView,
    bvnView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i2.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i3.SignUpView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i4.SignInView,
    ),
    _i1.RouteDef(
      Routes.successState,
      page: _i5.SuccessState,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i6.DashboardView,
    ),
    _i1.RouteDef(
      Routes.accountSettingsView,
      page: _i7.AccountSettingsView,
    ),
    _i1.RouteDef(
      Routes.tagView,
      page: _i8.TagView,
    ),
    _i1.RouteDef(
      Routes.createPinView,
      page: _i9.CreatePinView,
    ),
    _i1.RouteDef(
      Routes.confirmPinView,
      page: _i10.ConfirmPinView,
    ),
    _i1.RouteDef(
      Routes.passwordConfirmationView,
      page: _i11.PasswordConfirmationView,
    ),
    _i1.RouteDef(
      Routes.changePinView,
      page: _i12.ChangePinView,
    ),
    _i1.RouteDef(
      Routes.verifyChangeOfPasswordView,
      page: _i13.VerifyChangeOfPasswordView,
    ),
    _i1.RouteDef(
      Routes.setNewPasswordView,
      page: _i14.SetNewPasswordView,
    ),
    _i1.RouteDef(
      Routes.biometricView,
      page: _i15.BiometricView,
    ),
    _i1.RouteDef(
      Routes.tierView,
      page: _i16.TierView,
    ),
    _i1.RouteDef(
      Routes.accountVerificationView,
      page: _i17.AccountVerificationView,
    ),
    _i1.RouteDef(
      Routes.bvnView,
      page: _i18.BvnView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.OnboardingView: (data) {
      return _i19.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.OnboardingView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i3.SignUpView: (data) {
      return _i19.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i3.SignUpView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i4.SignInView: (data) {
      return _i19.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i4.SignInView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i5.SuccessState: (data) {
      final args = data.getArgs<SuccessStateArguments>(
        orElse: () => const SuccessStateArguments(),
      );
      return _i19.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i5.SuccessState(
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
    _i6.DashboardView: (data) {
      return _i19.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i6.DashboardView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i7.AccountSettingsView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i7.AccountSettingsView(),
        settings: data,
      );
    },
    _i8.TagView: (data) {
      final args = data.getArgs<TagViewArguments>(
        orElse: () => const TagViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i8.TagView(key: args.key, callback: args.callback),
        settings: data,
      );
    },
    _i9.CreatePinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i9.CreatePinView(),
        settings: data,
      );
    },
    _i10.ConfirmPinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i10.ConfirmPinView(),
        settings: data,
      );
    },
    _i11.PasswordConfirmationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i11.PasswordConfirmationView(),
        settings: data,
      );
    },
    _i12.ChangePinView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i12.ChangePinView(),
        settings: data,
      );
    },
    _i13.VerifyChangeOfPasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i13.VerifyChangeOfPasswordView(),
        settings: data,
      );
    },
    _i14.SetNewPasswordView: (data) {
      final args = data.getArgs<SetNewPasswordViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i14.SetNewPasswordView(
            key: args.key, email: args.email, route: args.route),
        settings: data,
      );
    },
    _i15.BiometricView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i15.BiometricView(),
        settings: data,
      );
    },
    _i16.TierView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i16.TierView(),
        settings: data,
      );
    },
    _i17.AccountVerificationView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i17.AccountVerificationView(),
        settings: data,
      );
    },
    _i18.BvnView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i18.BvnView(),
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

  final _i20.Key? key;

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

class TagViewArguments {
  const TagViewArguments({
    this.key,
    this.callback,
  });

  final _i20.Key? key;

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
    this.route,
  });

  final _i20.Key? key;

  final String email;

  final String? route;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email", "route": "$route"}';
  }

  @override
  bool operator ==(covariant SetNewPasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email && other.route == route;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode ^ route.hashCode;
  }
}

extension NavigatorStateExtension on _i21.NavigationService {
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
    _i20.Key? key,
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
    _i20.Key? key,
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
    _i20.Key? key,
    required String email,
    String? route,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.setNewPasswordView,
        arguments:
            SetNewPasswordViewArguments(key: key, email: email, route: route),
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
    _i20.Key? key,
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
    _i20.Key? key,
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
    _i20.Key? key,
    required String email,
    String? route,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.setNewPasswordView,
        arguments:
            SetNewPasswordViewArguments(key: key, email: email, route: route),
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
}

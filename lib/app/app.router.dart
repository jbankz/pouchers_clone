// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i26;
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
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart'
    as _i27;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/bvn_requirement_view.dart'
    as _i21;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/card_calculator_view.dart'
    as _i22;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/card_creation_summary_view.dart'
    as _i23;
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/view/virtual_card_detail_view.dart'
    as _i25;
import 'package:Pouchers/ui/features/dashboard/views/dashboard_view.dart'
    as _i6;
import 'package:Pouchers/ui/features/onboarding/presentation/views/onboarding_view.dart'
    as _i2;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/bvn/bvn_view.dart'
    as _i18;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/id/id_view.dart'
    as _i19;
import 'package:Pouchers/ui/features/profile/presentation/views/kyc/utility/utility_bill_view.dart'
    as _i20;
import 'package:Pouchers/ui/features/profile/presentation/views/wallet/fund_wallet_view.dart'
    as _i24;
import 'package:Pouchers/ui/features/tiers/presentation/view/tier_view.dart'
    as _i16;
import 'package:Pouchers/ui/widgets/success_state.dart' as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i28;

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

  static const idView = '/id-view';

  static const utilityBillView = '/utility-bill-view';

  static const requestBVNView = '/request-bv-nView';

  static const cardCalculatorView = '/card-calculator-view';

  static const cardCreationSymmaryView = '/card-creation-symmary-view';

  static const fundWalletView = '/fund-wallet-view';

  static const virtualCardDetailView = '/virtual-card-detail-view';

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
    idView,
    utilityBillView,
    requestBVNView,
    cardCalculatorView,
    cardCreationSymmaryView,
    fundWalletView,
    virtualCardDetailView,
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
    _i1.RouteDef(
      Routes.idView,
      page: _i19.IdView,
    ),
    _i1.RouteDef(
      Routes.utilityBillView,
      page: _i20.UtilityBillView,
    ),
    _i1.RouteDef(
      Routes.requestBVNView,
      page: _i21.RequestBVNView,
    ),
    _i1.RouteDef(
      Routes.cardCalculatorView,
      page: _i22.CardCalculatorView,
    ),
    _i1.RouteDef(
      Routes.cardCreationSymmaryView,
      page: _i23.CardCreationSymmaryView,
    ),
    _i1.RouteDef(
      Routes.fundWalletView,
      page: _i24.FundWalletView,
    ),
    _i1.RouteDef(
      Routes.virtualCardDetailView,
      page: _i25.VirtualCardDetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.OnboardingView: (data) {
      return _i26.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.OnboardingView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i3.SignUpView: (data) {
      return _i26.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i3.SignUpView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i4.SignInView: (data) {
      return _i26.PageRouteBuilder<dynamic>(
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
      return _i26.PageRouteBuilder<dynamic>(
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
      return _i26.PageRouteBuilder<dynamic>(
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
    _i19.IdView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i19.IdView(),
        settings: data,
      );
    },
    _i20.UtilityBillView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i20.UtilityBillView(),
        settings: data,
      );
    },
    _i21.RequestBVNView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i21.RequestBVNView(),
        settings: data,
      );
    },
    _i22.CardCalculatorView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i22.CardCalculatorView(),
        settings: data,
      );
    },
    _i23.CardCreationSymmaryView: (data) {
      final args =
          data.getArgs<CardCreationSymmaryViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i23.CardCreationSymmaryView(key: args.key, cardDto: args.cardDto),
        settings: data,
      );
    },
    _i24.FundWalletView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i24.FundWalletView(),
        settings: data,
      );
    },
    _i25.VirtualCardDetailView: (data) {
      return _i26.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i25.VirtualCardDetailView(),
        settings: data,
        opaque: false,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
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

  final _i26.Key? key;

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

  final _i26.Key? key;

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

  final _i26.Key? key;

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

class CardCreationSymmaryViewArguments {
  const CardCreationSymmaryViewArguments({
    this.key,
    required this.cardDto,
  });

  final _i26.Key? key;

  final _i27.CardDto cardDto;

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

extension NavigatorStateExtension on _i28.NavigationService {
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
    _i26.Key? key,
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
    _i26.Key? key,
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
    _i26.Key? key,
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
    _i26.Key? key,
    required _i27.CardDto cardDto,
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
    _i26.Key? key,
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
    _i26.Key? key,
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
    _i26.Key? key,
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
    _i26.Key? key,
    required _i27.CardDto cardDto,
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
}

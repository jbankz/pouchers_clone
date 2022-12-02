import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/ui/login/models/login_response.dart';
import 'package:pouchers/ui/tab_layout/models/profile_model.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/ui/tab_layout/providers/account_provider.dart';
import 'package:pouchers/ui/tab_layout/screens/account/account_widget.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

import '../../../../utils/logger.dart';

class BiometricSettings extends ConsumerStatefulWidget {
  static const String routeName = "biometricSettings";

  const BiometricSettings({Key? key}) : super(key: key);

  @override
  ConsumerState<BiometricSettings> createState() => _BiometricSettingsState();
}

class _BiometricSettingsState extends ConsumerState<BiometricSettings> {
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  bool? _loginBiometric;
  bool? _payBiometric;
  int id = -1;
  bool? _canCheckBiometrics;
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _loginBiometric = userProfile.isLoginBiometricActive;
    _payBiometric = userProfile.isPaymentBiometricActive;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: biometric,
      child: Column(
        children: [
          BiometricsWidget(
              textTheme: textTheme,
              text: logInBiometric,
              isSwitch: _loginBiometric!,
              widget: FlutterSwitch(
                  width: 60.0,
                  height: 35.0,
                  valueFontSize: 25.0,
                  toggleSize: 27.0,
                  inactiveColor: kLightColor500,
                  activeColor: kPrimaryColor,
                  value: _loginBiometric!,
                  borderRadius: 30.0,
                  onToggle: (val) {
                    buildShowModalBottomSheet(
                        context,
                        TransactionPinContainer(
                          isData: false,
                          isCable: false,
                          isBiometric: true,
                          isCard: false,
                          isFundCard: false,
                          doBiom: () {
                            checkBiometric(context, logInBiometric);
                          },
                        ));
                  })),
          BiometricsWidget(
              textTheme: textTheme,
              text: payBiometric,
              isSwitch: _payBiometric!,
              widget: FlutterSwitch(
                  width: 60.0,
                  height: 35.0,
                  valueFontSize: 25.0,
                  toggleSize: 27.0,
                  inactiveColor: kLightColor500,
                  activeColor: kPrimaryColor,
                  value: _payBiometric!,
                  borderRadius: 30.0,
                  onToggle: (val) {
                    buildShowModalBottomSheet(
                        context,
                        TransactionPinContainer(
                          isData: false,
                          isCable: false,
                          isBiometric: true,
                          isCard: false,
                          isFundCard: false,
                          doBiom: () {
                            checkBiometric(context, payBiometric);
                          },
                        ));
                  })),
        ],
      ),
    );
  }

  Future<void> checkBiometric(BuildContext context, String text) async {
    await Hive.openBox(kBiometricsBox);
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      log("error biometrics $e");
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
    log("biometric is available: $canCheckBiometrics");
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      log("error enumerate biometrics $e");
    }
    log("following biometrics are available");
    if (availableBiometrics!.isNotEmpty) {
      availableBiometrics.forEach((ab) {
        log("\ttech: $availableBiometrics");
      });
    } else {
      showErrorBar(context,
          "No biometrics available for this device, Please input your credentials");
    }

    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
          localizedReason: 'Touch the fingerprint sensor',
          options: const AuthenticationOptions(
            biometricOnly: true,
            useErrorDialogs: true,
            stickyAuth: false,
          ),
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
                signInTitle: "Biometrics login", cancelButton: "Cancel"),
            IOSAuthMessages()
          ]);
    } catch (e) {}

    setState(() {
      isAuth = authenticated ? true : false;
    });
    if (isAuth) {
      if (text == payBiometric) {
        ref
            .read(editProfileProvider2.notifier)
            .editProfile(isPaymentBiometricActive: _payBiometric);
      } else {
        ref
            .read(editProfileProvider.notifier)
            .editProfile(isLoginBiometricActive: _loginBiometric);
      }
    }
  }
}

class BiometricsWidget extends ConsumerStatefulWidget {
  BiometricsWidget({
    Key? key,
    required this.textTheme,
    required this.isSwitch,
    required this.widget,
    required this.text,
  }) : super(key: key);

  final TextTheme textTheme;
  bool isSwitch;
  Widget widget;
  final String text;

  @override
  ConsumerState<BiometricsWidget> createState() => _BiometricsWidgetState();
}

class _BiometricsWidgetState extends ConsumerState<BiometricsWidget> {
  bool? _canCheckBiometrics;
  bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AssetPaths.faceId,
              fit: BoxFit.scaleDown,
              color: kPrimaryColor,
              scale: 1.8,
            ),
            SizedBox(
              width: kRegularPadding,
            ),
            Expanded(
              child: Text(
                widget.text,
                style: widget.textTheme.subtitle1,
              ),
            ),
            widget.text == logInBiometric
                ? Consumer(builder: (context, ref, _) {
                    ref.listen(editProfileProvider,
                        (previous, NotifierState<EditProfileResponse> next) {
                      if (next.status == NotifierStatus.done) {
                        if (widget.isSwitch) {
                          setState(() => widget.isSwitch = false);
                          Hive.box(kBiometricsBox).put(kBiometricsKey, 0);
                          ref.read(editProfileInHouseProvider.notifier).state =
                              EditProfileData().copyWith(
                                  isLoginBiometricActive: widget.isSwitch);
                        } else {
                          setState(() => widget.isSwitch = true);
                          Hive.box(kBiometricsBox).put(kBiometricsKey, 1);
                          ref.read(editProfileInHouseProvider.notifier).state =
                              EditProfileData().copyWith(
                                  isLoginBiometricActive: widget.isSwitch);
                        }
                      }
                    });
                    var _widget = widget.widget;
                    return ref.watch(editProfileProvider).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget);
                  })
                : Consumer(builder: (context, ref, _) {
                    ref.listen(editProfileProvider2,
                        (previous, NotifierState<EditProfileResponse> next) {
                      if (next.status == NotifierStatus.done) {
                        if (widget.isSwitch) {
                          setState(() => widget.isSwitch = false);
                          Hive.box(kBiometricsBox).put(kPayBiometricsKey, 0);
                          ref.read(editProfileInHouseProvider.notifier).state =
                              EditProfileData().copyWith(
                                  isPaymentBiometricActive: widget.isSwitch);
                        } else {
                          setState(() => widget.isSwitch = true);
                          Hive.box(kBiometricsBox).put(kPayBiometricsKey, 1);
                          ref.read(editProfileInHouseProvider.notifier).state =
                              EditProfileData().copyWith(
                                  isPaymentBiometricActive: widget.isSwitch);
                        }
                      }
                    });
                    var _widget = widget.widget;
                    return ref.watch(editProfileProvider2).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget);
                  }),
          ],
        ),
        SizedBox(
          height: kRegularPadding,
        ),
        Divider(
          color: kLightPurple,
          thickness: 1,
        ),
        SizedBox(
          height: kRegularPadding,
        ),
      ],
    );
  }
}

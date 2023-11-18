import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:Pouchers/app/common/credentials.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/modules/account/models/profile_model.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/tab_layout/two_fa_modal.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

import '../../../../../../utils/logger.dart';

class BiometricSettings extends ConsumerStatefulWidget {
  static const String routeName = "biometricSettings";

  const BiometricSettings({Key? key}) : super(key: key);

  @override
  ConsumerState<BiometricSettings> createState() => _BiometricSettingsState();
}

class _BiometricSettingsState extends ConsumerState<BiometricSettings> {
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  int id = -1;
  bool? _canCheckBiometrics;
  bool isAuth = false;
  String? userPin;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkBiometricStatus();
    });

    setState(() {});
  }

  checkBiometricStatus() async {
    if (ref.watch(editProfileInHouseProvider).isPaymentBiometricActive ==
        null) {
      ref.read(editProfileInHouseProvider.notifier).state =
          ref.read(editProfileInHouseProvider.notifier).state.copyWith(
                profilePicture: userProfile.profilePicture,
                // isLoginBiometricActive: userProfile.isLoginBiometricActive,
                // isPaymentBiometricActive: userProfile.isPaymentBiometricActive,
              );

      ref.read(biometricProvider.notifier).state =
          ref.read(biometricProvider.notifier).state.copyWith(
                isLoginBiometricActive: userProfile.isLoginBiometricActive,
                isPaymentBiometricActive: userProfile.isPaymentBiometricActive,
              );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    print("jnnk${userProfile.isPaymentBiometricActive}");
    print("kmkmk${ref.watch(biometricProvider).isPaymentBiometricActive!}");
    return InitialPage(
      title: biometric,
      child: Column(
        children: [
          BiometricsWidget(
              textTheme: textTheme,
              text: logInBiometric,
              isSwitch: ref.watch(biometricProvider).isLoginBiometricActive!,
              widget: FlutterSwitch(
                  width: 60.0,
                  height: 35.0,
                  valueFontSize: 25.0,
                  toggleSize: 27.0,
                  inactiveColor: kLightColor500,
                  activeColor: kPrimaryColor,
                  value: ref.watch(biometricProvider).isLoginBiometricActive!,
                  borderRadius: 30.0,
                  onToggle: (val) {
                    buildShowModalBottomSheet(
                        context,
                        TwoFactorPinModal(
                          isBiometric: true,
                          doBiom: () {
                            checkBiometric(context, logInBiometric);
                          },
                        ));
                  })),
          BiometricsWidget(
              textTheme: textTheme,
              text: payBiometric,
              isSwitch: ref.watch(biometricProvider).isPaymentBiometricActive!,
              widget: FlutterSwitch(
                  width: 60.0,
                  height: 35.0,
                  valueFontSize: 25.0,
                  toggleSize: 27.0,
                  inactiveColor: kLightColor500,
                  activeColor: kPrimaryColor,
                  value: ref.watch(biometricProvider).isPaymentBiometricActive!,
                  borderRadius: 30.0,
                  onToggle: (val) async {
                    // await saveUserCredential(transactionPin: "6032");
                    //  UserCredentials? cred = await getUserCredentials();
                    //  print("credential: ${cred?.transactionPin}");

                    final result = await buildShowModalBottomSheet(
                        context,
                        TwoFactorPinModal(
                          isBiometric: true,
                          doBiom: () {
                            checkBiometric(context, payBiometric);
                          },
                        ));
                    if (result != null) {
                      setState(() {
                        userPin = result.join("");
                      });
                    }
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
      logPrint("error biometrics $e");
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
    logPrint("biometric is available: $canCheckBiometrics");
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      logPrint("error enumerate biometrics $e");
    }
    logPrint("following biometrics are available");
    if (availableBiometrics!.isNotEmpty) {
      availableBiometrics.forEach((ab) {
        logPrint("\ttech: $availableBiometrics");
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
              signInTitle: "Biometrics login",
              cancelButton: "Cancel",
            ),
            IOSAuthMessages()
          ]);
    } catch (e) {}

    setState(() {
      isAuth = authenticated ? true : false;
    });
    if (isAuth) {
      if (text == payBiometric) {
        ref.read(editProfileProvider2.notifier).editProfile(
            isPaymentBiometricActive:
                !ref.watch(biometricProvider).isPaymentBiometricActive!,
            isLoginBiometricActive:
                ref.watch(biometricProvider).isLoginBiometricActive,
            then: () async {
              if (ref.watch(biometricProvider).isPaymentBiometricActive!) {
                await saveUserCredential(transactionPin: userPin);
              } else {
                await saveUserCredential(transactionPin: null);
              }
            });
      } else {
        ref.read(editProfileProvider.notifier).editProfile(
              isLoginBiometricActive:
                  !ref.watch(biometricProvider).isLoginBiometricActive!,
              isPaymentBiometricActive:
                  ref.watch(biometricProvider).isPaymentBiometricActive,
            );
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
                          ref.read(biometricProvider.notifier).state = ref
                              .read(biometricProvider.notifier)
                              .state
                              .copyWith(
                                  isLoginBiometricActive: widget.isSwitch,
                                  isPaymentBiometricActive: ref
                                      .watch(biometricProvider)
                                      .isPaymentBiometricActive);
                        } else {
                          setState(() => widget.isSwitch = true);
                          Hive.box(kBiometricsBox).put(kBiometricsKey, 1);
                          ref.read(biometricProvider.notifier).state = ref
                              .read(biometricProvider.notifier)
                              .state
                              .copyWith(
                                  isLoginBiometricActive: widget.isSwitch,
                                  isPaymentBiometricActive: ref
                                      .watch(biometricProvider)
                                      .isPaymentBiometricActive);
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
                          ref.read(biometricProvider.notifier).state = ref
                              .read(biometricProvider.notifier)
                              .state
                              .copyWith(
                                  isPaymentBiometricActive: widget.isSwitch,
                                  isLoginBiometricActive: ref
                                      .watch(biometricProvider)
                                      .isLoginBiometricActive);
                        } else {
                          setState(() => widget.isSwitch = true);
                          Hive.box(kBiometricsBox).put(kPayBiometricsKey, 1);
                          ref.read(biometricProvider.notifier).state = ref
                              .read(biometricProvider.notifier)
                              .state
                              .copyWith(
                                  isPaymentBiometricActive: widget.isSwitch,
                                  isLoginBiometricActive: ref
                                      .watch(biometricProvider)
                                      .isLoginBiometricActive);
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

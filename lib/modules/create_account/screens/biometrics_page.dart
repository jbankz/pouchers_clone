import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/login/screens/login.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

import '../../account/providers/account_provider.dart';

class BiometricsPage extends ConsumerStatefulWidget {
  static const String routeName = "biometricsPage";

  const BiometricsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BiometricsPage> createState() => _BiometricsPageState();
}

class _BiometricsPageState extends ConsumerState<BiometricsPage> {
  bool? _canCheckBiometrics;
  bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(
                    kMediumPadding,
                  ),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(kLargePadding),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor.withOpacity(
                          0.2,
                        )),
                    child: Image.asset(
                      Platform.isAndroid
                          ? AssetPaths.fingerprint
                          : AssetPaths.faceId,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  enableBiometrics,
                  style: textTheme.headline1!.copyWith(
                    fontSize: 26,
                  ),
                ),
                SizedBox(
                  height: kPadding,
                ),
                Text(
                  enableBiometricsSub,
                  style: textTheme.bodyText1!.copyWith(
                    color: kIconGrey,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kMediumPadding, vertical: kLargePadding),
            child: Column(
              children: [
                LargeButton(
                  title: continueText,
                  customColor: true,
                  onPressed: () {
                    Hive.box(kBiometricsBox).put(kBiometricsKey, 1);
                    pushToAndClearStack(context, LogInAccount());
                    ref.read(editProfileProvider.notifier).editProfile(
                          isLoginBiometricActive: true,
                          isPaymentBiometricActive: ref
                              .watch(biometricProvider)
                              .isPaymentBiometricActive,
                        );
                    // checkBiometric(context);
                  },
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                inkWell(
                  onTap: () {
                    pushToAndClearStack(
                      context,
                      TabLayout(),
                    );
                  },
                  child: Text(
                    skip,
                    style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w500, color: kPrimaryTextColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Future<void> checkBiometric(BuildContext context) async {
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("error biometrics $e");
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
    print("biometric is available: $canCheckBiometrics");
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      print("error enumerate biometrics $e");
    }
    print("following biometrics are available");
    if (availableBiometrics!.isNotEmpty) {
      availableBiometrics.forEach((ab) {
        print("\ttech: $availableBiometrics");
      });
    } else {
      showErrorBar(context, "No biometrics available for this device");
      Future.delayed(Duration(seconds: 4)).then((value) => pushToAndClearStack(
            context,
            LogInAccount(),
          ));
    }

    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
          localizedReason: 'To authenticate and login into the app',
          options: const AuthenticationOptions(
            biometricOnly: true,
            useErrorDialogs: true,
            stickyAuth: false,
          ),
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
                signInTitle: "Please place your finger on the sensor",
                cancelButton: "Cancel"),
            IOSAuthMessages()
          ]);
    } catch (e) {
      // showErrorBar(context, "No Biometric available on this Device");
      print("error using biometric auth: $e");
    }

    setState(() {
      isAuth = authenticated ? true : false;
    });
    if (isAuth) {
      // pushToAndClearStack(
      //   context,
      //   TabLayout(),
      // );
      // pushToAndClearStack(
      //   context,
      //   LogInAccount(),
      // );
      // pushToAndClearStack(context, TabLayout());
    }
  }
}

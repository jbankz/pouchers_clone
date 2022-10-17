import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/tab_layout/screens/tab_layout.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class BiometricsPage extends StatefulWidget {
  const BiometricsPage({Key? key}) : super(key: key);

  @override
  State<BiometricsPage> createState() => _BiometricsPageState();
}

class _BiometricsPageState extends State<BiometricsPage> {
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
                      scale: 0.7,
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
                    checkBiometric(context);
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
      showErrorBar(context,
          "No biometrics are available, Please input your credentials");
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
      showErrorBar(context, "Error using Biometric Auth");
      print("error using biometric auth: $e");
    }

    setState(() {
      isAuth = authenticated ? true : false;
    });
    if (isAuth) {
      pushToAndClearStack(context, TabLayout());
    }
  }
}

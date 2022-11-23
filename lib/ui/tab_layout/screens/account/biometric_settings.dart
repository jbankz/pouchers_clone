import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/ui/tab_layout/screens/account/account_widget.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';


class BiometricSettings extends StatefulWidget {
  static const String routeName = "biometricSettings";

  const BiometricSettings({Key? key}) : super(key: key);

  @override
  State<BiometricSettings> createState() => _BiometricSettingsState();
}

class _BiometricSettingsState extends State<BiometricSettings> {
  bool _loginBiometric = false;
  bool _payBiometric = false;

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
            isSwitch: _loginBiometric,
          ),
          BiometricsWidget(
            textTheme: textTheme,
            text: payBiometric,
            isSwitch: _payBiometric,
          ),
        ],
      ),
    );
  }
}

class BiometricsWidget extends StatefulWidget {
  BiometricsWidget(
      {Key? key,
      required this.textTheme,
      required this.isSwitch,
      required this.text})
      : super(key: key);

  final TextTheme textTheme;
  bool isSwitch;
  final String text;

  @override
  State<BiometricsWidget> createState() => _BiometricsWidgetState();
}

class _BiometricsWidgetState extends State<BiometricsWidget> {
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
            FlutterSwitch(
                width: 60.0,
                height: 35.0,
                valueFontSize: 25.0,
                toggleSize: 27.0,
                inactiveColor: kLightColor500,
                activeColor: kPrimaryColor,
                value: widget.isSwitch,
                borderRadius: 30.0,
                onToggle: (val) {
                  setState(() => widget.isSwitch = val);
                  if (widget.isSwitch) {
                    buildShowModalBottomSheet(
                        context,
                        TransactionPinContainer(
                          isData: false,
                          isCable: false,
                          isBiometric: true,
                          isCard: false,
                          isFundCard: false,
                          doBiom: (){
                            checkBiometric(context);
                            // buildShowModalBottomSheet(
                            //   context,
                            //   BiometricModal(),
                            // );
                          },
                        ));
                  }
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
  Future<void> checkBiometric(BuildContext context) async {
    await Hive.openBox(kBiometricsBox);
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
          "No biometrics available for this device, Please input your credentials");
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
    } catch (e) {}

    setState(() {
      isAuth = authenticated ? true : false;
    });
    if (isAuth) {
      Hive.box(kBiometricsBox).put(kBiometricsKey, 1);
      Navigator.pop(context);
    }
  }

}

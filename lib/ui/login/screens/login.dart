import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/create_account/models/create_account_response.dart';
import 'package:pouchers/ui/create_account/screens/create_account.dart';
import 'package:pouchers/ui/login/providers/log_in_provider.dart';
import 'package:pouchers/ui/login/screens/forgot_password.dart';
import 'package:pouchers/ui/tab_layout/screens/tab_layout.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class LogInAccount extends StatefulWidget {
  static const String routeName = "logIn";

  const LogInAccount({Key? key}) : super(key: key);

  @override
  State<LogInAccount> createState() => _LogInAccountState();
}

class _LogInAccountState extends State<LogInAccount> {
  bool obscure = true;
  TextEditingController controller = TextEditingController();
  String? _password;
  String? _email;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? _canCheckBiometrics;
  bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetPaths.poucherLogo),
              SizedBox(height: kMicroPadding,),
              Text(
                logInPoucher,
                style: textTheme.headline1,
              ),
              SizedBox(
                height: kPadding,
              ),
              Text(
                logInSub,
                style: textTheme.bodyText1!
                    .copyWith(fontWeight: FontWeight.normal, height: 1.6),
              ),
              SizedBox(
                height: kLargePadding,
              ),
              TextInputNoIcon(
                textTheme: textTheme,
                text: emailOrPhone,
                hintText: emailAddressText,
                onSaved: (val) => setState(() => _email = val),
                validator: (val) {
                  if (val!.isEmpty) {
                    return emptyField;
                  } else {
                    return null;
                  }
                },
              ),
              TextInputNoIcon(
                textTheme: textTheme,
                text: passwordText,
                obscure: obscure,
                validator: (val) {
                  if (val!.isEmpty) {
                    return emptyField;
                  } else if (!isPassword(val)) {
                    return invalidPassword;
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => setState(() => _password = val),
                inputFormatters: [FilteringTextInputFormatter.deny(" ")],
                icon: InkWell(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: obscure
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: kSecondaryTextColor,
                          )
                        : Icon(Icons.visibility_outlined,
                            color: kSecondaryTextColor)),
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              inkWell(
                onTap: () {
                  pushTo(context, ForgotPassword());
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    forgotPasswordText,
                    style: textTheme.headline2,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              SizedBox(
                height: kMicroPadding,
              ),
              Consumer(builder: (context, ref, _) {
                ref.listen(logInProvider,
                    (previous, NotifierState<VerifyEmailResponse> next) {
                  if (next.status == NotifierStatus.done) {
                    pushToAndClearStack(context, TabLayout());
                  } else if (next.status == NotifierStatus.error) {
                    showErrorBar(context, next.message!);
                  }
                });
                var _widget = LargeButton(
                  title: logIn,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ref.read(logInProvider.notifier).logIn(
                            phoneNumber: _email!,
                            password: _password!,
                            isEmail: _email!.startsWith(
                              RegExp(r'[a-zA-Z]'),
                            ),
                          );
                    }
                  },
                );
                return ref.watch(logInProvider).when(
                    done: (done) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget);
              }),
              SizedBox(
                height: kMediumPadding,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: noAccount,
                        style: textTheme.headline6!.copyWith(fontSize: 16),
                        children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            pushTo(context, CreateAccount());
                          },
                        text: create,
                        style: textTheme.headline6!.copyWith(
                          fontSize: 16,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ])),
              ),
              SizedBox(
                height: kLargePadding,
              ),
              inkWell(
                onTap: () {
                  checkBiometric(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(kRegularPadding),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBackgroundColor,
                  ),
                  child: Image.asset(
                    AssetPaths.faceId,
                    fit: BoxFit.scaleDown,
                    color: kPrimaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/two_factor_auth/security_modal.dart';
import 'package:pouchers/modules/create_account/models/create_account_response.dart';
import 'package:pouchers/modules/create_account/screens/create_account.dart';
import 'package:pouchers/modules/create_account/screens/create_pin.dart';
import 'package:pouchers/modules/create_account/screens/poucher_tag.dart';
import 'package:pouchers/modules/create_account/screens/verify_account.dart';
import 'package:pouchers/modules/login/providers/log_in_provider.dart';
import 'package:pouchers/modules/login/screens/forgot_password.dart';
import 'package:pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

import '../../tab_layout/providers/account_provider.dart';

class LogInAccount extends ConsumerStatefulWidget {
  static const String routeName = "logIn";
  final bool? disabled;

  const LogInAccount({Key? key, this.disabled = false}) : super(key: key);

  @override
  ConsumerState<LogInAccount> createState() => _LogInAccountState();
}

class _LogInAccountState extends ConsumerState<LogInAccount> {
  bool obscure = true;
  TextEditingController controller = TextEditingController();
  String? _password;
  String? _email;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? _canCheckBiometrics;
  bool isAuth = false;

  // HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Hive.openBox(kBiometricsBox);
      // if(userProfile.isLoginBiometricActive!){
      //   await Hive.box(kBiometricsBox).put(kBiometricsKey, 1);
      // }else{
      //   await Hive.box(kBiometricsBox).put(kBiometricsKey, 0);
      // }
      setState(() {});
      if (widget.disabled!) {
        Future.delayed(Duration(seconds: 1)).then((value) => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (ctx) {
              return SecurityModal(
                textTheme: Theme.of(context).textTheme,
                title: accountDisabled,
                message: accountDisabledSub,
                button: contactSupport,
              );
            }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      onTap: (){
        if(Navigator.canPop(context)){
          Navigator.pop(context);
        }else{
          exit(0);
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetPaths.poucherLogo),
              SizedBox(
                height: kMicroPadding,
              ),
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
                hintText: enterPassword,
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
                  pushTo(context, ForgotPassword(),
                      settings:
                          const RouteSettings(name: ForgotPassword.routeName));
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
                    if (next.data!.data!.tag == null) {
                      pushTo(
                          context,
                          PoucherTag(
                            fromLogin: true,
                          ),
                          settings:
                              const RouteSettings(name: PoucherTag.routeName));
                    } else if (!next.data!.data!.isCreatedPin!) {
                      pushTo(
                          context,
                          CreatePin(
                            fromLogin: true,
                          ),
                          settings:
                              const RouteSettings(name: CreatePin.routeName));
                    } else {
                      pushToAndClearStack(
                        context,
                        TabLayout(),
                      );
                    }
                  } else if (next.status == NotifierStatus.error) {
                    if (next.message == "User is not verified") {
                      showErrorBar(context, next.message!);
                      Future.delayed(Duration(seconds: 2)).then(
                        (value) => pushTo(
                            context,
                            VerifyAccount(
                              email: _email!,
                              fromLogin: true,
                            ),
                            settings: const RouteSettings(
                                name: VerifyAccount.routeName)),
                      );
                    }
                    showErrorBar(context, next.message!);
                  }
                });
                var _widget = LargeButton(
                  title: logIn,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ref.read(logInProvider.notifier).logIn(
                            phoneNumber: _email!.trim(),
                            password: _password!.trim(),
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
              ref
                  .watch(editProfileInHouseProvider).isLoginBiometricActive == null
                  ? SizedBox()
                  : ref
                          .watch(editProfileInHouseProvider)
                          .isLoginBiometricActive!
                      ?
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
                              Platform.isAndroid
                                  ? AssetPaths.fingerprint
                                  : AssetPaths.faceId,
                              height: 60,
                              fit: BoxFit.scaleDown,
                              color: kPrimaryColor,
                            ),
                          ),
                        )
                      : SizedBox()
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
      pushToAndClearStack(context, TabLayout());
    }
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/create_account/models/create_account_response.dart';
import 'package:pouchers/ui/create_account/providers/create_account_provider.dart';
import 'package:pouchers/ui/create_account/screens/verify_account.dart';
import 'package:pouchers/ui/login/screens/login.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool obscure = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _password;
  String? _referral;

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
            Text(
              createAccountText,
              style: textTheme.headline1,
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextInputNoIcon(
                    textTheme: textTheme,
                    text: firstName,
                    hintText: enterName,
                    onSaved: (val) => setState(() => _firstName = val),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return emptyField;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: kMediumPadding,
                ),
                Expanded(
                  child: TextInputNoIcon(
                    textTheme: textTheme,
                    text: lastName,
                    hintText: enterName,
                    onSaved: (val) => setState(() => _lastName = val),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return emptyField;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),
            TextInputNoIcon(
              textTheme: textTheme,
              text: onlyEmailText,
              hintText: emailAddressText,
              onSaved: (val) => setState(() => _email = val),
              validator: (val) {
                if (val!.isEmpty) {
                  return emptyField;
                } else if (!isEmail(val)) {
                  return invalidEmail;
                } else {
                  return null;
                }
              },
            ),
            TextInputNoIcon(
              textTheme: textTheme,
              text: phoneText,
              hintText: enterPhoneText,
              onSaved: (val) => setState(() => _phone = val),
              validator: (val) {
                if (val!.isEmpty) {
                  return emptyField;
                } else {
                  return null;
                }
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11)
              ],
            ),
            TextInputNoIcon(
              textTheme: textTheme,
              text: referral,
              hintText: enterReferral,
              onSaved: (val) => setState(() => _referral = val),
            ),
            TextInputNoIcon(
              textTheme: textTheme,
              text: passwordText,
              hintText: enterPasswordText,
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
                        color: kSecondaryTextColor),
              ),
            ),
            Text(
              passwordValidation,
              style: textTheme.subtitle1!.copyWith(
                  fontSize: 16, color: kPrimaryTextColor.withOpacity(0.8)),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(createAccountProvider,
                  (previous, NotifierState<CreateAccountResponse> next) {
                if (next.status == NotifierStatus.done) {
                  pushTo(
                      context,
                      VerifyAccount(
                        email: _email!,
                      ));
                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message!);
                }
              });
              var _widget = LargeButton(
                title: createAccount,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ref.read(createAccountProvider.notifier).createAccount(
                          firstName: _firstName!,
                          lastName: _lastName!,
                          email: _email!,
                          phoneNumber: _phone!,
                          password: _password!,
                        );
                  }
                },
              );
              return ref.watch(createAccountProvider).when(
                    done: (data) => _widget,
                    error: (error) => _widget,
                    loading: () => SpinKitDemo(),
                  );
            }),
            SizedBox(
              height: kMediumPadding,
            ),
            Center(
              child: RichText(
                  text: TextSpan(
                      text: alreadyHaveAccount,
                      style: textTheme.headline6!.copyWith(fontSize: 16),
                      children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          pushTo(context, LogInAccount());
                        },
                      text: logIn,
                      style: textTheme.headline6!.copyWith(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ])),
            ),
            SizedBox(
              height: kFullPadding,
            ),
            Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: byCreatingAccount,
                      style: textTheme.headline6!.copyWith(fontSize: 16),
                      children: [
                        TextSpan(
                          text: " $termsOfUse",
                          style: textTheme.headline6!.copyWith(
                            fontSize: 16,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: " $andText",
                          style: textTheme.headline6!.copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: " $privacyPolicy",
                          style: textTheme.headline6!.copyWith(
                            fontSize: 16,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ])),
            ),
          ],
        ),
      ),
    ));
  }
}

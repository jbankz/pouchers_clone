import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/app/navigators/navigators.dart';
import 'package:flutter_boilerplate/ui/create_account/screens/verify_account.dart';
import 'package:flutter_boilerplate/ui/login/screens/login.dart';
import 'package:flutter_boilerplate/utils/components.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/strings.dart';
import 'package:flutter_boilerplate/utils/widgets.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            createAccountText,
            style: textTheme.headline1,
          ),
          SizedBox(
            height: kPadding,
          ),
          Text(
            createAccountSub,
            style: textTheme.bodyText1!
                .copyWith(fontWeight: FontWeight.normal, height: 1.6),
          ),
          SizedBox(
            height: kMacroPadding,
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
                ),
              ),
            ],
          ),
          SizedBox(
            height: kRegularPadding,
          ),
          TextInputNoIcon(
            textTheme: textTheme,
            text: emailText,
            hintText: emailAddressText,
          ),
          TextInputNoIcon(
            textTheme: textTheme,
            text: phoneText,
            hintText: enterPhoneText,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11)
            ],
          ),
          TextInputNoIcon(
            textTheme: textTheme,
            text: passwordText,
            hintText: enterPasswordText,
          ),
          TextInputNoIcon(
            textTheme: textTheme,
            text: confirmPasswordText,
            hintText: enterPasswordText,
          ),
          SizedBox(
            height: kRegularPadding,
          ),
          LargeButton(
            title: createAccount,
            onPressed: () {
              pushTo(context, VerifyAccount());
            },
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Center(
            child: RichText(
                text: TextSpan(
                    text: alreadyHaveAccount,
                    style: textTheme.bodyText2,
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          pushTo(context, LogInAccount());
                        },
                      text: logIn,
                      style: textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.bold))
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
                    style: textTheme.bodyText2!.copyWith(height: 1.8),
                    children: [
                      TextSpan(
                          text: " \n$termsOfUse",
                          style: textTheme.bodyText2!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(text: " $andText", style: textTheme.bodyText2),
                      TextSpan(
                          text: " $privacyPolicy",
                          style: textTheme.bodyText2!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ])),
          ),
        ],
      ),
    ));
  }
}

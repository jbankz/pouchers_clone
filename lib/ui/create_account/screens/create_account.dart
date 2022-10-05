import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/create_account/screens/verify_account.dart';
import 'package:pouchers/ui/login/screens/login.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool obscure = true;

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
            text: referral,
            hintText: enterReferral,
          ),
          TextInputNoIcon(
            textTheme: textTheme,
            text: passwordText,
            hintText: enterPasswordText,
            obscure: obscure,
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
                  : Icon(Icons.visibility_outlined, color: kSecondaryTextColor),
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
                          style:  textTheme.headline6!.copyWith(
                            fontSize: 16,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                          ),),
                      TextSpan(text: " $andText", style: textTheme.headline6!.copyWith(fontSize: 16),),
                      TextSpan(
                          text: " $privacyPolicy",
                          style:  textTheme.headline6!.copyWith(
                            fontSize: 16,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                          ),),
                    ])),
          ),
        ],
      ),
    ));
  }
}

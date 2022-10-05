import 'package:flutter/material.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/login/screens/reset_password_code.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            forgotPassword,
            style: textTheme.headline1,
          ),
          SizedBox(
            height: kPadding,
          ),
          Text(
            forgotPasswordSub,
            style: textTheme.bodyText1!
                .copyWith(fontWeight: FontWeight.normal, height: 1.6),
          ),
          SizedBox(
            height: kLargePadding,
          ),
          TextInputNoIcon(
            textTheme: textTheme,
            text: onlyEmailText,
            hintText: emailAddressText,
          ),
          SizedBox(
            height: kRegularPadding,
          ),
          LargeButton(
            title: recoverPassword,
            onPressed: () {
              pushTo(
                context,
                ResetPasswordCode(),
              );
            },
          )
        ],
      ),
    ));
  }
}

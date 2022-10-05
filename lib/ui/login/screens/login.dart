import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/create_account/screens/create_account.dart';
import 'package:pouchers/ui/login/screens/forgot_password.dart';
import 'package:pouchers/ui/tab_layout/tab_layout.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class LogInAccount extends StatefulWidget {
  const LogInAccount({Key? key}) : super(key: key);

  @override
  State<LogInAccount> createState() => _LogInAccountState();
}

class _LogInAccountState extends State<LogInAccount> {
  bool obscure = true;
  TextEditingController controller = TextEditingController();
  String? password;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              height: 50,
            ),
            TextInputNoIcon(
              textTheme: textTheme,
              text: emailOrPhone,
              hintText: emailAddressText,
            ),
            TextInputNoIcon(
              textTheme: textTheme,
              text: passwordText,
              obscure: obscure,
              onSaved: (val) {
                password = val;
              },
              inputFormatters: [FilteringTextInputFormatter.deny(" ")],
              controller: controller,
              // validator: (val) {
              //   if (val == null || val.isEmpty) {
              //     return emptyField;
              //   } else if (val.length < 8) {
              //     return "The Password must be at least 8 characters.";
              //   }
              //   return null;
              // },
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
                      : Icon(Icons.visibility_outlined, color: kSecondaryTextColor)),
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            inkWell(
              onTap: (){
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
            LargeButton(
              title: logIn,
              onPressed: () {
                pushToAndClearStack(context, TabLayout());
              },
            ),
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
                        ),)
                  ])),
            ),
            SizedBox(
              height: kFullPadding,
            ),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}

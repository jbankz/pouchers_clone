import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/app/navigators/navigators.dart';
import 'package:flutter_boilerplate/ui/login/screens/reset_successful.dart';
import 'package:flutter_boilerplate/utils/components.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/strings.dart';
import 'package:flutter_boilerplate/utils/widgets.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({Key? key}) : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool obscure = true;
  bool obscure2 = true;
  TextEditingController controller = TextEditingController();
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              setPassword,
              style: textTheme.headline1,
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              resetPasswordSub,
              style: textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.normal, height: 1.6),
            ),
            SizedBox(
              height: kLargePadding,
            ),
            TextInputNoIcon(
              textTheme: textTheme,
              text: newPassword,
              hintText: newPasswordLow,
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
                          color: kPrimaryColor,
                        )
                      : Icon(Icons.visibility_outlined, color: kPrimaryColor)),
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            TextInputNoIcon(
              textTheme: textTheme,
              text: confirmPasswordText,
              hintText: confirmPasswordLow,
              obscure: obscure2,
              onSaved: (val) {
                confirmPassword = val;
              },
              inputFormatters: [FilteringTextInputFormatter.deny(" ")],
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
                      obscure2 = !obscure2;
                    });
                  },
                  child: obscure2
                      ? Icon(
                          Icons.visibility_off_outlined,
                          color: kPrimaryColor,
                        )
                      : Icon(Icons.visibility_outlined, color: kPrimaryColor)),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            LargeButton(
              title: setPasswordText,
              onPressed: () {
                pushTo(context, ResetSuccessful());
              },
            )
          ],
        ),
      ),
    );
  }
}

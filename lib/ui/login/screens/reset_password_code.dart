import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/app/navigators/navigators.dart';
import 'package:flutter_boilerplate/ui/login/screens/set_password.dart';
import 'package:flutter_boilerplate/utils/components.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/strings.dart';
import 'package:flutter_boilerplate/utils/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetPasswordCode extends StatefulWidget {
  const ResetPasswordCode({Key? key}) : super(key: key);

  @override
  State<ResetPasswordCode> createState() => _ResetPasswordCodeState();
}

class _ResetPasswordCodeState extends State<ResetPasswordCode> {
  TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resetPassword,
              style: textTheme.headline1,
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              resetPasswordCodeSub,
              style: textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.normal, height: 1.6),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Text(
              resetCode,
              style: textTheme.subtitle1,
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            PinCodeTextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              enableActiveFill: true,
              animationDuration: const Duration(milliseconds: 300),
              cursorColor: kPrimaryColor,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
              textStyle: textTheme.subtitle1,
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              pinTheme: PinTheme(
                fieldWidth: 48,
                shape: PinCodeFieldShape.box,
                borderWidth: 1.5,
                selectedColor: kPrimaryColor,
                inactiveColor: kTransparent,
                activeColor: kTransparent,
                selectedFillColor: kGreyFill,
                activeFillColor: kGreyFill,
                inactiveFillColor: kGreyFill,
                borderRadius: BorderRadius.circular(3),
              ),
              appContext: context,
              length: 6,
              onChanged: (val) {},
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            LargeButton(
              title: nextText,
              onPressed: () {
                pushTo(context, SetPassword());
              },
            ),
          ],
        ),
      ),
    );
  }
}

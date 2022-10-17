import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/login/providers/log_in_provider.dart';
import 'package:pouchers/ui/login/screens/set_password.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ResetPasswordCode extends StatefulWidget {
  final String email;

  const ResetPasswordCode({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPasswordCode> createState() => _ResetPasswordCodeState();
}

class _ResetPasswordCodeState extends State<ResetPasswordCode> {
  String? _pin;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              style: textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.normal,
                height: 1.6,
              ),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Text(
              resetCode,
              style: textTheme.headline6!.copyWith(
                color: kPrimaryGrey,
              ),
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            Form(
              key: _formKey,
              child: PinCodeTextField(
                keyboardType: TextInputType.number,
                enableActiveFill: true,
                animationDuration: const Duration(milliseconds: 300),
                cursorColor: kPrimaryColor,
                errorTextSpace: 25,
                validator: (val) {
                  if (val!.isEmpty) {
                    return emptyField;
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => setState(() => _pin = val),
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
                  selectedFillColor: kBackgroundColor,
                  activeFillColor: kBackgroundColor,
                  inactiveFillColor: kBackgroundColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                appContext: context,
                length: 6,
                onChanged: (val) {},
              ),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(validateForgotPasswordProvider,
                  (previous, NotifierState<String> next) {
                if (next.status == NotifierStatus.done) {
                  pushTo(context, SetPassword(
                    email : widget.email
                  ));
                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message!);
                }
              });

              var _widget = LargeButton(
                title: recoverPassword,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ref
                        .read(validateForgotPasswordProvider.notifier)
                        .validateForgotPassword(
                          email: widget.email,
                          resetCode: _pin!,
                        );
                  }
                },
              );
              //875479
              return ref.watch(validateForgotPasswordProvider).when(
                  done: (done) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget);
            }),
          ],
        ),
      ),
    );
  }
}

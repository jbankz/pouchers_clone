import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/create_account/models/create_account_response.dart';
import 'package:pouchers/ui/create_account/providers/create_account_provider.dart';
import 'package:pouchers/ui/create_account/screens/poucher_tag.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class VerifyAccount extends StatefulWidget {
  final String email;
  const VerifyAccount({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _pin;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              verifyAccount,
              style: textTheme.headline1,
            ),
            SizedBox(
              height: kPadding,
            ),
            RichText(
              text: TextSpan(
                  text: "$verifyAccountSub",
                  children: [
                    TextSpan(
                      text: " ${widget.email}",
                      style: textTheme.bodyText1!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                  style: textTheme.bodyText1!),
            ),
            SizedBox(
              height: kMacroPadding,
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
              height: kFullPadding,
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(verifyEmailProvider,
                  (previous, NotifierState<VerifyEmailResponse> next) {
                if (next.status == NotifierStatus.done) {
                  pushTo(context, PoucherTag());
                } else if(next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message!);
                }
              });

              var _widget = LargeButton(
                title: verifyCode,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ref.read(verifyEmailProvider.notifier).verifyEmail(
                          otp: _pin!,
                        );
                  }
                },
              );
              return ref.watch(verifyEmailProvider).when(
                  done: (done) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget);
            }),
            SizedBox(
              height: kMicroPadding,
            ),
            CodeResendTimer(email: widget.email)
          ],
        ),
      ),
    );
  }
}

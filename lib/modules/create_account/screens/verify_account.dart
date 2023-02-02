import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/create_account/models/create_account_response.dart';
import 'package:pouchers/modules/create_account/providers/create_account_provider.dart';
import 'package:pouchers/modules/create_account/screens/poucher_tag.dart';
import 'package:pouchers/modules/login/screens/login.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class VerifyAccount extends ConsumerStatefulWidget {
  static const String routeName = "verifyAccount";

  final String? email;
  final bool? fromLogin;

  const VerifyAccount({Key? key, this.email, this.fromLogin = false})
      : super(key: key);

  @override
  ConsumerState<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends ConsumerState<VerifyAccount> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _pin;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      onTap: () {
        widget.fromLogin!
            ? Navigator.popUntil(context,
                (route) => route.settings.name == LogInAccount.routeName)
            : Navigator.pop(context);
      },
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
                  style: textTheme.bodyText1),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Form(
              key: _formKey,
              child: PinCodeTextFieldWidget(
                align: MainAxisAlignment.spaceBetween,
                pinLength: 6,
                onSaved: (val) => setState(() => _pin = val),
                onChanged: (val) {
                  if (val.length == 6) {
                    ref.read(verifyEmailProvider.notifier).verifyEmail(
                          otp: val,
                        );
                  }
                },
              ),
            ),
            SizedBox(
              height: kLargePadding,
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(verifyEmailProvider,
                  (previous, NotifierState<VerifyEmailResponse> next) {
                if (next.status == NotifierStatus.done) {
                  pushTo(context, PoucherTag(),
                      settings:
                          const RouteSettings(name: PoucherTag.routeName));
                } else if (next.status == NotifierStatus.error) {
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
            CodeResendTimer(
              email: widget.email,
              change: false,
            )
          ],
        ),
      ),
    );
  }
}

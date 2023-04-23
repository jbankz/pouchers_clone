import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/login/providers/log_in_provider.dart';
import 'package:Pouchers/modules/login/screens/reset_password_code.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = "forgotPassword";

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        child: SingleChildScrollView(
      child: ListenerPage
        (
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
            Form(
              key: _formKey,
              child: TextInputNoIcon(
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
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            Consumer(builder: (context, ref, _) {
              var _widget = LargeButton(
                title: recoverPassword,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ref.read(forgotPasswordProvider.notifier).forgotPassword(
                          email: _email!,
                        );
                  }
                },
              );

              ref.listen(forgotPasswordProvider,
                  (previous, NotifierState<String> next) {
                if (next.status == NotifierStatus.done) {
                  pushTo(
                      context,
                      ResetPasswordCode(
                        email: _email!,
                        isChangePassword: false,
                        isChangePhone: false,
                        forgot: true,
                      ),
                      settings:
                          const RouteSettings(name: ResetPasswordCode.routeName));
                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message!);
                }
              });
              return ref.watch(forgotPasswordProvider).when(
                    done: (done) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget,
                  );
            })
          ],
        ),
      ),
    ));
  }
}

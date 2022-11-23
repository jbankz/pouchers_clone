import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/login/providers/log_in_provider.dart';
import 'package:pouchers/ui/login/screens/reset_successful.dart';
import 'package:pouchers/ui/tab_layout/screens/account/change_password/change_password.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class SetPassword extends StatefulWidget {
  static const String routeName = "setPassword";

  final String? email;
  final bool? isChangePassword;

  const SetPassword({Key? key, this.email, this.isChangePassword})
      : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool obscure = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _password;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      onTap: () {
        widget.isChangePassword!
            ? Navigator.popUntil(context,
                (route) => route.settings.name == ChangePassword.routeName)
            : Navigator.pop(context);
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                hintText: enterPassword,
                obscure: obscure,
                inputFormatters: [FilteringTextInputFormatter.deny(" ")],
                validator: (val) {
                  if (val!.isEmpty) {
                    return emptyField;
                  } else if (!isPassword(val)) {
                    return invalidPassword;
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => setState(() => _password = val),
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
                        : Icon(Icons.visibility_outlined,
                            color: kSecondaryTextColor)),
              ),
              Text(
                passwordValidation,
                style: textTheme.subtitle1!.copyWith(
                    fontSize: 16, color: kPrimaryTextColor.withOpacity(0.8)),
              ),
              SizedBox(
                height: kMacroPadding,
              ),
              Consumer(builder: (context, ref, _) {
                ref.listen(resetPasswordProvider,
                    (previous, NotifierState<String> next) {
                  if (next.status == NotifierStatus.done) {
                    print(widget.isChangePassword);
                    pushTo(
                        context,
                        ResetSuccessful(
                          message: successResetPassword,
                          isChangePassword: widget.isChangePassword,
                          isResetPin: false,
                        ),
                        settings: const RouteSettings(
                            name: ResetSuccessful.routeName));
                  } else if (next.status == NotifierStatus.error) {
                    showErrorBar(context, next.message!);
                  }
                });

                var _widget = LargeButton(
                  title: setPasswordText,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ref.read(resetPasswordProvider.notifier).resetPassword(
                            email: widget.email!,
                            password: _password!,
                          );
                    }
                  },
                );
                //875479
                return ref.watch(resetPasswordProvider).when(
                    done: (done) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

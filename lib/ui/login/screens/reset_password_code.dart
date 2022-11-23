import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/login/providers/log_in_provider.dart';
import 'package:pouchers/ui/login/screens/set_password.dart';
import 'package:pouchers/ui/tab_layout/providers/account_provider.dart';
import 'package:pouchers/ui/tab_layout/screens/profile/profile_change_number.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ResetPasswordCode extends ConsumerStatefulWidget {
  static const String routeName = "resetPasswordCode";
  final String? email;
  final bool? isChangePassword, isChangePhone;
  final bool? forgot;

  const ResetPasswordCode({
    Key? key,
    this.email,
    this.isChangePassword,
    this.isChangePhone,
    this.forgot
  }) : super(key: key);

  @override
  ConsumerState<ResetPasswordCode> createState() => _ResetPasswordCodeState();
}

class _ResetPasswordCodeState extends ConsumerState<ResetPasswordCode> {
  String? _pin;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      title: widget.isChangePassword!
          ? changePassword
          : widget.isChangePhone!
              ? changePhone
              : "",
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
            Text(
              widget.isChangePhone! ? enterCodeSent : verifySub,
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
              child: PinCodeTextFieldWidget(
                align: MainAxisAlignment.spaceBetween,
                pinLength: 6,
                onSaved: (val) => setState(() => _pin = val),
                onChanged: (val) {
                  if (val.length == 6) {
                    ref.watch(checkResendProvider) == 1
                        ? ref
                            .read(validateOtpProvider.notifier)
                            .validateResendOtp(
                              otp: val,
                            )
                        : ref
                            .read(validateForgotPasswordProvider.notifier)
                            .validateForgotPassword(
                              email: widget.email!,
                              resetCode: val,
                            );
                  }
                },
              ),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            ref.watch(checkResendProvider) == 1
                ? Consumer(builder: (context, ref, _) {
                    ref.listen(validateOtpProvider,
                        (previous, NotifierState<String> next) {
                      if (next.status == NotifierStatus.done) {
                        ref.read(checkResendProvider.notifier).state = 0;
                        widget.isChangePhone!
                            ? pushTo(
                                context,
                                ChangePhoneNumber(),
                                settings: const RouteSettings(
                                    name: ChangePhoneNumber.routeName),
                              )
                            : pushTo(
                                context,
                                SetPassword(
                                  email: widget.email!,
                                  isChangePassword: widget.isChangePassword,
                                ),
                                settings: const RouteSettings(
                                    name: SetPassword.routeName));
                      } else if (next.status == NotifierStatus.error) {
                        showErrorBar(context, next.message!);
                      }
                    });
                    var _widget = LargeButton(
                      title:
                          widget.isChangePassword! ? confirm : recoverPassword,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ref
                              .read(validateOtpProvider.notifier)
                              .validateResendOtp(
                                otp: _pin!,
                              );
                        }
                      },
                    );
                    return ref.watch(validateOtpProvider).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget);
                  })
                : Consumer(builder: (context, ref, _) {
                    ref.listen(validateForgotPasswordProvider,
                        (previous, NotifierState<String> next) {
                      if (next.status == NotifierStatus.done) {
                        widget.isChangePhone!
                            ? pushTo(
                                context,
                                ChangePhoneNumber(),
                                settings: const RouteSettings(
                                    name: ChangePhoneNumber.routeName),
                              )
                            : pushTo(
                                context,
                                SetPassword(
                                  email: widget.email!,
                                  isChangePassword: widget.isChangePassword,
                                ),
                                settings: const RouteSettings(
                                    name: SetPassword.routeName));
                      } else if (next.status == NotifierStatus.error) {
                        showErrorBar(context, next.message!);
                      }
                    });

                    var _widget = LargeButton(
                      title:
                          widget.isChangePassword! ? confirm : recoverPassword,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ref
                              .read(validateForgotPasswordProvider.notifier)
                              .validateForgotPassword(
                                email: widget.email!,
                                resetCode: _pin!,
                              );
                        }
                      },
                    );
                    return ref.watch(validateForgotPasswordProvider).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget);
                  }),
            SizedBox(
              height: kMediumPadding,
            ),
             CodeResendTimer(email: widget.email, change: widget.forgot!)
          ],
        ),
      ),
    );
  }
}

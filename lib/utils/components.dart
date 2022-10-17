import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/ui/create_account/providers/create_account_provider.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class TextInputNoIcon extends StatelessWidget {
  const TextInputNoIcon(
      {required this.textTheme,
      this.text,
      this.icon,
      this.onSaved,
      this.onChanged,
      this.inputType,
      this.controller,
      this.inputFormatters,
      this.read = false,
      this.validator,
      this.widget,
      this.textCapitalize,
        this.prefixIcon,
      this.obscure,
      this.hintText,
      this.focusNode});

  final TextTheme textTheme;
  final String? text;
  final String? hintText;
  final Widget? icon;
  final Widget? prefixIcon;
  final bool? obscure;
  final bool? read;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final TextInputType? inputType;
  final TextEditingController? controller;

  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Widget? widget;
  final TextCapitalization? textCapitalize;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget == null
            ? Text(
                text!,
                style: textTheme.headline6,
              )
            : widget!,
        SizedBox(
          height: kSmallPadding,
        ),
        Container(
          child: TextFormField(
            keyboardType: inputType,
            readOnly: read!,
            style: textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
            obscuringCharacter: "*",
            cursorColor: kPrimaryColor,
            focusNode: focusNode,
            textCapitalization: textCapitalize == null
                ? TextCapitalization.none
                : textCapitalize!,
            obscureText: obscure == null ? false : obscure!,
            onSaved: onSaved,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              filled: true,
              hintText: hintText,
              hintStyle: textTheme.headline6!.copyWith(
                  color: kSecondaryTextColor.withOpacity(0.7), fontSize: 18),
              suffixIcon: icon,
              fillColor: kBackgroundColor,
              border: OutlineInputBorder(),
              prefix: prefixIcon ?? SizedBox(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(kSmallPadding),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: read == true ? Colors.transparent : kPrimaryColor),
                borderRadius: BorderRadius.circular(kSmallPadding),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kSmallPadding),
                borderSide: BorderSide(color: kColorRed),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kSmallPadding),
                borderSide: BorderSide(color: kColorRed),
              ),
            ),
          ),
        ),
        SizedBox(
          height: kRegularPadding,
        ),
      ],
    );
  }
}

class CodeResendTimer extends StatefulWidget {
  final String? email;

  const CodeResendTimer({this.email});

  @override
  _CodeResendTimerState createState() => _CodeResendTimerState();
}

class _CodeResendTimerState extends State<CodeResendTimer> {
  Timer? customTimer;

  int refreshTime = 60;

  @override
  void initState() {
    super.initState();
    activateTimer();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  activateTimer() {
    customTimer = new Timer.periodic(Duration(seconds: 01), (Timer _timer) {
      if (refreshTime == 0) {
        _timer.cancel();
      } else {
        setState(() {
          refreshTime = refreshTime - 1;
        });
      }
    });
  }

  @override
  void dispose() {
    customTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, _) {
              ref.listen(resendEmailProvider,
                      (previous, NotifierState<String> next) {
                    if (next.status == NotifierStatus.done) {
                      showSuccessBar(context, next.data);
                      refreshTime = 60;
                      activateTimer();

                    } else {
                      showErrorBar(context, next.data!);
                    }
                  });
              var _widget = Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    noCode,
                    style: textTheme.headline3,
                  ),
                  inkWell(
                    onTap: refreshTime == 0
                        ? () {
                            ref
                                .read(resendEmailProvider.notifier)
                                .resendVerificationEmail(
                                  email: widget.email!,
                                );
                          }
                        : null,
                    child: Container(
                      child: refreshTime == 0
                          ? Text(
                              resend,
                              style: textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              "$resend in ${timeCheck()}",
                              style: textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      padding: EdgeInsets.symmetric(
                        horizontal: kRegularPadding,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kMediumPadding),
                          color: refreshTime == 0
                              ? kLightPurple
                              : kBackgroundColor),
                    ),
                  )
                ],
              );
              return ref.watch(resendEmailProvider).when(
                  done: (done) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget);
            },
          )
        ],
      ),
    );
  }

  String timeCheck() {
    return refreshTime == 60
        ? "01:00"
        : "${Duration(seconds: refreshTime).inSeconds.remainder(60).toString().padLeft(2, '0')}s";
  }
}

InkWell inkWell({Function()? onTap, required Widget child}) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: onTap,
    child: child,
  );
}

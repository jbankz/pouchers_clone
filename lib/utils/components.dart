import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/strings.dart';

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
      this.obscure,
      this.hintText,
      this.focusNode});

  final TextTheme textTheme;
  final String? text;
  final String? hintText;
  final Widget? icon;
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
                style: textTheme.subtitle1,
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
              hintStyle: textTheme.bodyText2!.copyWith(
                color: kPrimaryColor.withOpacity(0.4),
              ),
              suffixIcon: icon,
              fillColor: kGreyFill,
              border: OutlineInputBorder(),
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
  const CodeResendTimer();

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                noCode,
                style: textTheme.bodyText2,
              ),
              Container(
                child: refreshTime == 0
                    ? Text(resend)
                    : Text("$resend in ${timeCheck()}"),
                padding: EdgeInsets.symmetric(
                  horizontal: refreshTime == 0 ? kMicroPadding : kSmallPadding,
                  vertical: kPadding,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMediumPadding),
                    color: kGreyFill),
              )
            ],
          ),
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

InkWell inkWell ({required Function() onTap, required Widget child}){
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: onTap,
    child: child,
  );
}

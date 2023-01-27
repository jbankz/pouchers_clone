
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/two_factor_auth/success_auth_page.dart';
import 'package:pouchers/modules/tab_layout/providers/account_provider.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ConfirmAuthPin extends ConsumerStatefulWidget {
  static const String routeName = "confirmAuthPin";
  final String? pin;

  const ConfirmAuthPin({Key? key, this.pin}) : super(key: key);

  @override
  ConsumerState<ConfirmAuthPin> createState() => _ConfirmAuthPinState();
}

class _ConfirmAuthPinState extends ConsumerState<ConfirmAuthPin> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _pin;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: factorAuth,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  digitCode,
                  style: textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFamily: "DMSans",
                    fontSize: 26,
                  ),
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
                      } else if (val.length != 6) {
                        return sixDigits;
                      }
                    },
                    onSaved: (val) => setState(() => _pin = val),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    appContext: context,
                    length: 6,
                    onChanged: (val) async {
                      if (val.length == 6) {
                        await Hive.openBox(k2FACodeBox);
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ref
                              .read(validate2FAProvider.notifier)
                              .validate2FA(userToken: _pin!);
                        }
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: kPadding,
                ),
                Text(
                  enterDigitCode,
                  style: textTheme.headline3,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Consumer(builder: (context, ref, _) {
            ref.listen(validate2FAProvider,
                (previous, NotifierState<bool> next) {
              if (next.status == NotifierStatus.done) {
                if (next.data!) {
                  Hive.box(k2FACodeBox).put(k2FACode, true);
                  ref.read(authFactorProvider.notifier).state = true;
                  pushTo(context, SuccessAuthPage(),
                      settings:
                          const RouteSettings(name: SuccessAuthPage.routeName));
                }
              }else if(next.status == NotifierStatus.error) {
                print("here");
                showErrorBar(
                    context, "This pin has expired please input a new one");
              }
            });
            var _widget = LargeButton(
                title: confirm,
                onPressed: () async {
                  await Hive.openBox(k2FACodeBox);
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ref
                        .read(validate2FAProvider.notifier)
                        .validate2FA(userToken: _pin!);
                  }
                });
            return ref
                .watch(validate2FAProvider)
                .when(done: (done) => _widget, loading: () => SpinKitDemo(), error: (val)=> _widget);
          }),
        ],
      ),
    );
  }
}

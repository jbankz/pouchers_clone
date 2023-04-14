import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/response_handler.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/login/screens/login.dart';
import 'package:pouchers/modules/login/screens/reset_successful.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ResetPin extends ConsumerStatefulWidget {
  static const String routeName = "resetPin";

  const ResetPin({Key? key}) : super(key: key);

  @override
  ConsumerState<ResetPin> createState() => _ResetPinState();
}

class _ResetPinState extends ConsumerState<ResetPin> {
  String? _pin, _pin2;
  TextEditingController _pinController = TextEditingController();
  TextEditingController _pin2Controller = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _pinFocusNode = FocusNode();
  FocusNode _pin2FocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pinFocusNode.addListener(() {
      setState(() {});
    });
    _pin2FocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pin2FocusNode.dispose();
    _pinFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: transactionPin,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Text(
                  resetTransactionPin,
                  style: textTheme.headline1,
                ),
                SizedBox(
                  height: kPadding,
                ),
                Text(
                  resetTransactionPinSub,
                  style: textTheme.bodyText1!
                      .copyWith(fontWeight: FontWeight.normal, height: 1.6),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        oldPin,
                        style: textTheme.headline6,
                      ),
                      SizedBox(
                        height: kSmallPadding,
                      ),
                      PinCodeTextFieldWidget(
                          align: MainAxisAlignment.start,
                          focusNode: _pinFocusNode,
                          pinLength: 4,
                          onSaved: (val) => setState(() => _pin = val),
                          onChanged: (val) {
                            if (val.length == 4) {
                              _pinFocusNode.unfocus();
                              _pin2FocusNode.requestFocus();
                              setState(() => _pin = val);
                            }
                          }),
                      SizedBox(
                        height: kSmallPadding,
                      ),
                      Text(
                        newPin,
                        style: textTheme.headline6,
                      ),
                      SizedBox(
                        height: kSmallPadding,
                      ),
                      PinCodeTextFieldWidget(
                        align: MainAxisAlignment.start,
                        focusNode: _pin2FocusNode,
                        pinLength: 4,
                        controller: _pin2Controller,
                        onSaved: (val) => setState(() => _pin2 = val),
                        onChanged: (val) {
                          if (val.length >= 4) {
                            _pinFocusNode.unfocus();
                            _pin2FocusNode.unfocus();
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              ref.read(resetPinProvider.notifier).resetPin(
                                  oldPin: _pin!, newPin: _pin2Controller.text, );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Consumer(
            builder: (context, ref, _) {
              ref.listen(resetPinProvider,
                  (previous, NotifierState<String> next) {
                if (next.status == NotifierStatus.done) {
                  pushTo(
                      context,
                      ResetSuccessful(
                        isResetPin: true,
                        isChangePassword: false,
                        message: resetPinSuccess,
                      ),
                      settings: RouteSettings(name: ResetSuccessful.routeName));
                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message!);
                }
              });
              var _widget = LargeButton(
                title: savePin,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ref
                        .read(resetPinProvider.notifier)
                        .resetPin(oldPin: _pin!, newPin: _pin2!);
                  }
                },
              );
              return ref.watch(resetPinProvider).when(
                  done: (done) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget);
            },
          ),
        ],
      ),
    );
  }
}

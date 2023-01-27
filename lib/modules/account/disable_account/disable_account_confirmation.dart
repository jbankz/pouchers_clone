import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/disable_account/disable_modal.dart';
import 'package:pouchers/modules/account/disable_account/disable_success.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/tab_layout/providers/account_provider.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class DisableConfirm extends StatefulWidget {
  static const String routeName = "disableConfirm";
  final String? reason;

  const DisableConfirm({Key? key, this.reason}) : super(key: key);

  @override
  State<DisableConfirm> createState() => _DisableConfirmState();
}

class _DisableConfirmState extends State<DisableConfirm> {
  bool obscure = true;
  String? _password;
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String modalReturn = "";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: disableAccountText,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    confirmation,
                    style: textTheme.headline1!.copyWith(
                      fontFamily: "DMSans",
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    confirmationSub,
                    style: textTheme.bodyText1!.copyWith(color: kIconGrey),
                  ),
                  SizedBox(
                    height: kLargePadding,
                  ),
                  TextInputNoIcon(
                    textTheme: textTheme,
                    text: passwordText,
                    obscure: obscure,
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
                              color: kSecondaryTextColor),
                    ),
                  ),
                ],
              ),
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(disableUserProvider,
                  (previous, NotifierState<String> next) {
                if (next.status == NotifierStatus.done) {
                  pushTo(context, DisableSuccessful(),
                      settings: const RouteSettings(
                          name: DisableSuccessful.routeName));
                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message!);
                }
              });
              var _widget = LargeButton(
                title: disableAccountText,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final result = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (ctx) {
                        return CommonModal(
                          textTheme: Theme.of(context).textTheme,
                          title: pleaseConfirm,
                          subTitle: pleaseConfirmSub,
                          color: kLightOrange,
                          buttonText: yesDisable,
                        );
                      },
                    );
                    if (result == "yes") {
                      ref.read(disableUserProvider.notifier).disableUser(
                            reason: widget.reason!,
                            password: _password!,
                          );
                    }
                  }
                },
              );
              return ref.watch(disableUserProvider).when(
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

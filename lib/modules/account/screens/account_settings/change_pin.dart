import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/response_handler.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/account_settings/reset_pin.dart';
import 'package:Pouchers/modules/create_account/models/create_account_response.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/login/providers/log_in_provider.dart';
import 'package:Pouchers/modules/login/screens/login.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class ChangeTransactionPin extends StatefulWidget {
  static const String routeName = "changeTransactionPin";

  const ChangeTransactionPin({Key? key}) : super(key: key);

  @override
  State<ChangeTransactionPin> createState() => _ChangeTransactionPinState();
}

class _ChangeTransactionPinState extends State<ChangeTransactionPin> {
  bool obscure = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _password;
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: transactionPin,
      child: ListenerPage(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      enterPassword,
                      style: textTheme.headline1,
                    ),
                    SizedBox(
                      height: kPadding,
                    ),
                    Text(
                      enterPasswordSub,
                      style: textTheme.bodyText1!
                          .copyWith(fontWeight: FontWeight.normal, height: 1.6),
                    ),
                    SizedBox(
                      height: kMacroPadding,
                    ),
                    TextInputNoIcon(
                      textTheme: textTheme,
                      text: passwordText,
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
                                  Icons.visibility_outlined,
                                  color: kSecondaryTextColor,
                                )
                              : Icon(Icons.visibility_off_outlined,
                                  color: kSecondaryTextColor)),
                    ),
                  ],
                ),
              ),
              Consumer(
                builder: (context, ref, _) {
                  ref.listen(logInProvider,
                      (previous, NotifierState<VerifyEmailResponse> next) {
                    if (next.status == NotifierStatus.done) {
                      pushTo(context, ResetPin(),
                          settings: RouteSettings(name: ResetPin.routeName));
                    } else if (next.status == NotifierStatus.error) {
                      showErrorBar(context, next.message!);
                    }
                  });
                  var _widget = LargeButton(
                    title: continueText,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ref.read(logInProvider.notifier).logIn(
                              phoneNumber: userProfile.email!.trim(),
                              password: _password!.trim(),
                              isEmail: true,
                            );
                      }
                    },
                  );
                  return ref.watch(logInProvider).when(
                      done: (done) => _widget,
                      loading: () => SpinKitDemo(),
                      error: (val) => _widget);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

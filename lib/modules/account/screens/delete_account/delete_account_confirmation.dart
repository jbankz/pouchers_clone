import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/common/listener.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/account/screens/delete_account/delete_modal.dart';
import 'package:pouchers/modules/create_account/models/create_account_response.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/login/providers/log_in_provider.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class DeleteConfirm extends StatefulWidget {
  static const String routeName = "deleteConfirm";
  final String? reason;

  const DeleteConfirm({Key? key, this.reason}) : super(key: key);

  @override
  State<DeleteConfirm> createState() => _DeleteConfirmState();
}

class _DeleteConfirmState extends State<DeleteConfirm> {
  bool obscure = true;
  String? _password;
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print(userProfile.toString());
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: deleteAccountText,
      child: ListenerPage(
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
                      deleteConfirm,
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
                          Icons.visibility_outlined,
                          color: kSecondaryTextColor,
                        )
                            : Icon(Icons.visibility_off_outlined,
                            color: kSecondaryTextColor)
                      ),
                    ),
                  ],
                ),
              ),
              Consumer(builder: (context, ref, _) {
                ref.listen(logInProvider,
                    (previous, NotifierState<VerifyEmailResponse> next) {
                  if (next.status == NotifierStatus.done) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (ctx) {
                        return DeleteModal(
                          textTheme: Theme.of(context).textTheme,
                          title: pleaseConfirm,
                          subTitle: pleaseDelConfirmSub,
                          color: kLightOrange,
                          buttonText: yesDelete,
                          reason: widget.reason!,
                        );
                      },
                    );
                  } else if (next.status == NotifierStatus.error) {
                    showErrorBar(context, next.message!);
                  }
                });
                var _widget = LargeButton(
                  title: deleteAccountText,
                  disableColor: kLightOrange,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ref.read(logInProvider.notifier).logIn(
                          phoneNumber: userProfile.email!,
                          password: _password!,
                          isEmail: true);
                    }
                  },
                );
                return ref.watch(logInProvider).when(
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

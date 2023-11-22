import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/login/screens/reset_password_code.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

import '../../../../ui/features/profile/data/dao/user_dao.dart';

class ChangePassword extends StatefulWidget {
  static const String routeName = "changePassword";
  final bool? changePhone, forgotPin;

  const ChangePassword({Key? key, this.changePhone, this.forgotPin = false})
      : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  // HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  final userProfile = userDao.returnUser(userDao.box);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: widget.changePhone! ? changePhone : "",
      child: ListenerPage(
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
                widget.changePhone!
                    ? changePhoneSub
                    : widget.forgotPin!
                        ? sendPinCodeSub
                        : sendCodeSub,
                style: textTheme.bodyText1!.copyWith(color: kIconGrey),
              ),
              SizedBox(
                height: kLargePadding,
              ),
              widget.changePhone!
                  ? Consumer(builder: (context, ref, _) {
                      ref.listen(requestPhoneChangeProvider,
                          (previous, NotifierState<String> next) {
                        if (next.status == NotifierStatus.done) {
                          pushTo(
                              context,
                              ResetPasswordCode(
                                  forgot: false,
                                  email: userProfile.email ?? "",
                                  isChangePassword: false,
                                  isChangePhone: true),
                              settings: const RouteSettings(
                                  name: ResetPasswordCode.routeName));
                        } else if (next.status == NotifierStatus.error) {
                          showErrorBar(context, next.message!);
                        }
                      });

                      var _widget = LargeButton(
                        title: sendCode,
                        onPressed: () {
                          ref
                              .read(requestPhoneChangeProvider.notifier)
                              .requestChangePhone();
                        },
                      );
                      return ref.watch(requestPhoneChangeProvider).when(
                          done: (done) => _widget,
                          loading: () => SpinKitDemo(),
                          error: (val) => _widget);
                    })
                  : Consumer(builder: (context, ref, _) {
                      ref.listen(accountProvider,
                          (previous, NotifierState<String> next) {
                        if (next.status == NotifierStatus.done) {
                          pushTo(
                              context,
                              ResetPasswordCode(
                                  forgot: false,
                                  email: userProfile.email ?? "",
                                  isChangePassword: true,
                                  isForgotPin: widget.forgotPin,
                                  isChangePhone: false),
                              settings: const RouteSettings(
                                  name: ResetPasswordCode.routeName));
                        } else if (next.status == NotifierStatus.error) {
                          showErrorBar(context, next.message!);
                        }
                      });

                      var _widget = LargeButton(
                        title: sendCode,
                        onPressed: () {
                          ref
                              .read(accountProvider.notifier)
                              .requestChangePassword();
                        },
                      );
                      return ref.watch(accountProvider).when(
                          done: (done) => _widget,
                          loading: () => SpinKitDemo(),
                          error: (val) => _widget);
                    })
            ],
          ),
        ),
      ),
    );
  }
}

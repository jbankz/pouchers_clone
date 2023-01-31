import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/screens/account_settings/account_settings.dart';
import 'package:pouchers/modules/login/screens/login.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ResetSuccessful extends StatelessWidget {
  static const String routeName = "resetSuccessful";

  final String? message;
  final bool? isChangePassword;
  final bool? isResetPin;

  const ResetSuccessful(
      {Key? key, this.message, this.isChangePassword, this.isResetPin = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        onTap: () {
          print(isChangePassword);
          isResetPin!
              ? Navigator.popUntil(context,
                  (route) => route.settings.name == AccountSettings.routeName)
              : isChangePassword!
                  ? Navigator.popUntil(
                      context,
                      (route) =>
                          route.settings.name == AccountSettings.routeName)
                  : pushToAndClearStack(context, LogInAccount());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AssetPaths.success, height: 200, width: 200),
            SizedBox(
              height: kMacroPadding,
            ),
            Text(
              resetSuccessful,
              style: textTheme.headline1,
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              message!,
              // resetSuccessfulSub,
              textAlign: TextAlign.center,
              style: textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.normal, height: 1.6),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            LargeButton(
              title: isChangePassword!
                  ? goBack
                  : isResetPin!
                      ? goBack
                      : signIn,
              onPressed: () {
                isResetPin!
                    ? Navigator.popUntil(
                        context,
                        (route) =>
                            route.settings.name == AccountSettings.routeName)
                    : isChangePassword!
                        ? Navigator.popUntil(
                            context,
                            (route) =>
                                route.settings.name ==
                                AccountSettings.routeName)
                        : pushToAndClearStack(context, LogInAccount());
              },
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/login/screens/login.dart';
import 'package:pouchers/ui/onboarding/onboarding.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ResetSuccessful extends StatelessWidget {
  final String message;

  const ResetSuccessful({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        onTap: () {
          // pushToAndClearUntil(
          //   context,
          //   LogInAccount(),
          //   routeName: OnBoardingPage.routeName,
          // );
          Navigator.popUntil(context,
              (route) => route.settings.name == LogInAccount.routeName);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetPaths.resetSuccess),
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
              message,
              // resetSuccessfulSub,
              textAlign: TextAlign.center,
              style: textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.normal, height: 1.6),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            LargeButton(
              title: signIn,
              onPressed: () {
                pushTo(context, LogInAccount());
              },
            )
          ],
        ));
  }
}

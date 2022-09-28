import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/navigators/navigators.dart';
import 'package:flutter_boilerplate/ui/login/screens/login.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/strings.dart';
import 'package:flutter_boilerplate/utils/widgets.dart';

class ResetSuccessful extends StatelessWidget {
  const ResetSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        child: Column(
      children: [
        SizedBox(
          height: kLargePadding,
        ),
        Container(
          height: 85,
          width: 100,
          decoration: BoxDecoration(
              color: kGreyFill,
              borderRadius: BorderRadius.circular(kSmallPadding)),
        ),
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
          resetSuccessfulSub,
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

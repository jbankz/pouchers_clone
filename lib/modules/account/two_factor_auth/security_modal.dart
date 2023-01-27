import 'package:flutter/material.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/two_factor_auth/disable_auth_question.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';

class SecurityModal extends StatelessWidget {
  final String title;
  final String message, button;
  final Color? color;

  const SecurityModal({
    Key? key,
    required this.textTheme,
    required this.title,
    required this.message,
    required this.button,
    this.color
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 1),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: kPrimaryWhite,
            borderRadius:
            BorderRadius.circular(kMediumPadding)),
        margin: EdgeInsets.symmetric(
            horizontal: kSmallPadding,
            vertical: kRegularPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kMediumPadding,
            vertical: 35),
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(kMediumPadding)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              Text(
                message,
                style: textTheme.bodyText1!
                    .copyWith(color: kIconGrey),
              ),
              SizedBox(
                height: kLargePadding,
              ),
              inkWell(
                onTap: (){
                  button == urgentButton ? pushTo(context, DisableAuthQuestion(),  settings: const RouteSettings(
                      name: DisableAuthQuestion.routeName)) :
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    button,
                    style: textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: color ?? kPrimaryColor
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

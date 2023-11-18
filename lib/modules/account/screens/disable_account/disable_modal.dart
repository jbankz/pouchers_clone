import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class CommonModal extends StatelessWidget {
  final String title, buttonText;
  final String subTitle;
  final Color color;
  final Widget? widget;

  const CommonModal(
      {Key? key,
      required this.textTheme,
      required this.buttonText,
      required this.title,
      required this.subTitle,
      required this.color,
      this.widget})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 1),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: kPrimaryWhite,
            borderRadius: BorderRadius.circular(kMediumPadding)),
        margin: EdgeInsets.symmetric(
            horizontal: kSmallPadding, vertical: kRegularPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kLargePadding),
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kMediumPadding)),
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
              widget == null
                  ? Text(
                      subTitle,
                      style: textTheme.bodyText1!.copyWith(color: kIconGrey),
                    )
                  : widget!,
              SizedBox(
                height: kLargePadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  inkWell(
                    onTap: () => Navigator.pop(context, "no"),
                    child: Text(
                      cancel,
                      style: textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: kMacroPadding,
                  ),
                  inkWell(
                    onTap: () => Navigator.pop(context, "yes"),
                    child: Text(
                      buttonText,
                      style: textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

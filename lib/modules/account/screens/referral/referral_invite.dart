import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:share_plus/share_plus.dart';

class ReferralInvite extends StatelessWidget {
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Center(
          child: CircleAvatar(
              backgroundColor: kLightPurple,
              radius: 90,
              child: Padding(
                padding: const EdgeInsets.all(kSmallPadding),
                child: Image.asset(
                  AssetPaths.referralAvatar,
                ),
              )),
        ),
        SizedBox(
          height: kRegularPadding,
        ),
        Text(
          referEarn,
          style: textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: kRegularPadding,
        ),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: referralBonus,
                style: textTheme.bodyText1,
                children: [
                  TextSpan(
                      text: " 10 points",
                      style: textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                      ))
                ])),
        SizedBox(
          height: kMediumPadding,
        ),
        DottedBorder(
            borderType: BorderType.RRect,
            color: kPrimaryColor,
            padding: EdgeInsets.zero,
            strokeWidth: 2,
            radius: Radius.circular(kSmallPadding),
            dashPattern: [9],
            child: Container(
              width: double.infinity,
              padding:
              EdgeInsets.symmetric(vertical: kMacroPadding),
              child: Text(
                userProfile.referralCode ?? "",
                style: textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            )),
        SizedBox(
          height: kRegularPadding,
        ),
        inkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: userProfile.referralCode));
            showSuccessBar(context, "Copied");
          },
          child: Text(
            tapCopyCode,
            style: textTheme.subtitle1,
          ),
        ),
        SizedBox(
          height: kLargePadding,
        ),
        LargeButton(
          title: sendInvite,
          onPressed: () {
            Share.share(userProfile.referralCode ?? "");
          },
        ),
      ],
    );
  }
}

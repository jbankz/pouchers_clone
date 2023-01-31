import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:share_plus/share_plus.dart';

class Referral extends StatelessWidget {
  static const String routeName = "referral";

  const Referral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              referAFriend,
              style: textTheme.headline4!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 26,
              ),
            ),
            SizedBox(
              height: kMicroPadding,
            ),
            Center(
              child: DottedBorder(
                borderType: BorderType.Circle,
                color: kPurpleLight300,
                borderPadding: EdgeInsets.zero,
                padding: EdgeInsets.all(kRegularPadding),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(116)),
                    child: Container(
                      color: kLightPurple,
                      child: Image.asset(
                        AssetPaths.referralImage,
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Give ₦5,000, ",
                style: textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.w500, fontFamily: ""),
                children: [
                  TextSpan(
                    text: "Earn ₦1,000 ",
                    style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "",
                        color: kSecondaryPurple),
                  ),
                  TextSpan(
                    text: "per referral",
                    style: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontFamily: "",
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: kMicroPadding,
            ),
            ReferContainer(
              textTheme: textTheme,
              text: earn,
              subText: earnSub,
              icon: AssetPaths.earnIcon,
            ),
            ReferContainer(
              textTheme: textTheme,
              text: getReminders,
              subText: getRemindersSub,
              icon: AssetPaths.reminderIcon,
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              enterReferral,
              style: textTheme.headline4,
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            Row(
              children: [
                Expanded(
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: kLightPurple,
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(kRegularPadding),
                        color: kBackgroundColor,
                        child: Text(
                          "PHUVI7890",
                          style: textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                      )),
                ),
                inkWell(
                  onTap: (){
                    Clipboard.setData(ClipboardData(text: "PHUVI7890"));
                    showSuccessBar(context, "Copied");
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      kMediumPadding,
                    ),
                    decoration: BoxDecoration(
                      color: kSecondaryPurple,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          kPadding,
                        ),
                        bottomRight: Radius.circular(
                          kPadding,
                        ),
                      ),
                    ),
                    child: Text(
                      "copy",
                      style:
                          textTheme.headline2!.copyWith(color: kContainerColor),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            inkWell(
              onTap: (){
                Share.share("PHUVI7890");
              },
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: kRegularPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kPadding),
                    border: Border.all(color: kSecondaryPurple, width: 1.5)
                  ),
                  child: Text(
                    share,
                    style: textTheme.headline2!.copyWith(
                      color: kSecondaryPurple,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
          ],
        ),
      ),
    );
  }
}

class ReferContainer extends StatelessWidget {
  const ReferContainer(
      {Key? key,
      required this.textTheme,
      required this.text,
      required this.subText,
      required this.icon})
      : super(key: key);

  final TextTheme textTheme;
  final String text, subText, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kRegularPadding,
        vertical: kMediumPadding,
      ),
      margin: EdgeInsets.only(bottom: kSmallPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kPadding),
        color: kBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon),
          SizedBox(height: kPadding),
          Text(
            text,
            style: textTheme.headline2!
                .copyWith(color: kSecondaryPurple, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: kPadding),
          Text(
            subText,
            style: textTheme.subtitle1!.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

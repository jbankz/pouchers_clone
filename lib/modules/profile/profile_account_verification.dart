import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/profile/profile_bvn.dart';
import 'package:pouchers/modules/profile/profile_utility_bill.dart';
import 'package:pouchers/modules/profile/profile_valid_id.dart';
import 'package:pouchers/modules/tab_layout/providers/account_provider.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class AccountVerificationStatus extends ConsumerStatefulWidget {
  static const String routeName = "accountVerificationStatus";
  final String? from;

  AccountVerificationStatus({Key? key, this.from}) : super(key: key);

  @override
  ConsumerState<AccountVerificationStatus> createState() =>
      _AccountVerificationStatusState();
}

class _AccountVerificationStatusState
    extends ConsumerState<AccountVerificationStatus> {
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  int? userTierLevel;
  int? hiveTierLevel;
  bool? isUploadedIdentityCard;
  bool? hiveIsUploadedIdentityCard;
  String result = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await checkTierLevel();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: accountVerification,
        color: kPurpleColor800,
        child: Column(
          children: [
            Text(
              accountVerificationSub,
              style: textTheme.headline3,
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            AccountVerifyContainer(
              textTheme: textTheme,
              title: bvn,
              subTitle: bvnSub,
              bgColor:
                  hiveTierLevel == 1 ? kColorLightYellow : kLightColorGreen,
              status: hiveTierLevel == 1 ? pending : verified,
              iconColor: hiveTierLevel == 1 ? kColorYellow200 : kColorGreen,
              next: hiveTierLevel == 1 ? true : false,
              widget: hiveTierLevel == 1
                  ? Text(
                      "i",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  : Icon(
                      Icons.check,
                      color: kPrimaryWhite,
                      size: 20,
                    ),
              onTap: hiveTierLevel == 1
                  ? () {
                      pushTo(
                        context,
                        BVNPage(from: widget.from),
                        settings: const RouteSettings(
                          name: BVNPage.routeName,
                        ),
                      );
                    }
                  : null,
            ),
            AccountVerifyContainer(
                textTheme: textTheme,
                status: hiveTierLevel == 2 && (!hiveIsUploadedIdentityCard!)
                    ? pending
                    : verified,
                title: validCard,
                subTitle: validCardSub,
                bgColor: hiveTierLevel == 2 && (!hiveIsUploadedIdentityCard!)
                    ? kColorLightYellow
                    : kLightColorGreen,
                iconColor: hiveTierLevel == 2 && (!hiveIsUploadedIdentityCard!)
                    ? kColorYellow200
                    : kColorGreen,
                next: hiveTierLevel == 2 ? false : true,
                widget: hiveTierLevel == 2 && (!hiveIsUploadedIdentityCard!)
                    ? Text(
                        "i",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    : Icon(
                        Icons.check,
                        color: kPrimaryWhite,
                        size: 20,
                      ),
                onTap: hiveTierLevel == 2 && (!hiveIsUploadedIdentityCard!)
                    ? () {
                        pushTo(
                          context,
                          ValidId(from: widget.from),
                          settings: const RouteSettings(
                            name: ValidId.routeName,
                          ),
                        );
                      }
                    : null),
            AccountVerifyContainer(
              textTheme: textTheme,
              status: (hiveTierLevel == 2 && hiveIsUploadedIdentityCard!)
                  ? pending
                  : verified,
              title: utilityBill,
              subTitle: utilityBillSub,
              bgColor: (hiveTierLevel == 2 && hiveIsUploadedIdentityCard!)
                  ? kColorLightYellow
                  : kLightColorGreen,
              iconColor: (hiveTierLevel == 2 && hiveIsUploadedIdentityCard!)
                  ? kColorYellow200
                  : kColorGreen,
              next: (hiveTierLevel == 2 && hiveIsUploadedIdentityCard!)
                  ? false
                  : true,
              widget: (hiveTierLevel == 2 && hiveIsUploadedIdentityCard!)
                  ? Text(
                      "i",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  : Icon(
                      Icons.check,
                      color: kPrimaryWhite,
                      size: 20,
                    ),
              onTap: (hiveTierLevel == 2 &&
                      hiveIsUploadedIdentityCard! &&
                      result == "")
                  ? () async {
                      result = await pushTo(
                        context,
                        ProfileUtilityBill(),
                        settings: const RouteSettings(
                          name: ProfileUtilityBill.routeName,
                        ),
                      );
                      setState(() {
                        result = result;
                      });
                    }
                  : null,
            ),
          ],
        ));
  }

  checkTierLevel() {
    hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
    userTierLevel = userProfile.tierLevels;
    isUploadedIdentityCard = userProfile.isUploadedIdentityCard;
    hiveIsUploadedIdentityCard =
        ref.watch(editProfileInHouseProvider).isUploadedIdentityCard;

    if (hiveIsUploadedIdentityCard == null) {
      setState(() {
        hiveIsUploadedIdentityCard = isUploadedIdentityCard;
      });
    }

    if (hiveTierLevel != null) {
      if (userTierLevel! > hiveTierLevel!) {
        ref
            .read(editProfileInHouseProvider.notifier)
            .state
            .copyWith(tierLevels: userProfile.tierLevels);
      } else {
        setState(() {
          hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
        });
      }
    } else {
      print("here");
      ref.read(editProfileInHouseProvider.notifier).state.tierLevels =
          userProfile.tierLevels;
      setState(() {
        hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
      });
    }
    print("hiveTierLevel$hiveTierLevel");
  }
}

class AccountVerifyContainer extends StatelessWidget {
  final String title, subTitle, status;
  final Color bgColor;
  final Color? iconColor, textColor;
  final Widget widget;
  final Function()? onTap;
  final bool next;

  const AccountVerifyContainer(
      {Key? key,
      required this.textTheme,
      required this.status,
      required this.next,
      required this.title,
      required this.bgColor,
      required this.widget,
      this.textColor,
      this.onTap,
      required this.subTitle,
      this.iconColor})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return inkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: kRegularPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kSmallPadding, vertical: kRegularPadding),
        decoration: BoxDecoration(
            color: kPrimaryWhite,
            borderRadius: BorderRadius.circular(kSmallPadding),
            border: Border.all(color: kColorBackgroundLight200, width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                next
                    ? SizedBox()
                    : Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kRegularPadding, vertical: kPadding),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(kRegularPadding),
                        ),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  AssetPaths.verifiedIcon,
                                  height: 20,
                                  width: 20,
                                  color: iconColor,
                                ),
                                widget
                              ],
                            ),
                            SizedBox(
                              width: kSmallPadding,
                            ),
                            Text(
                              status,
                              style: textTheme.headline6!
                                  .copyWith(color: iconColor),
                            )
                          ],
                        ),
                      )
              ],
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              subTitle,
              style: textTheme.headline6,
            )
          ],
        ),
      ),
    );
  }
}

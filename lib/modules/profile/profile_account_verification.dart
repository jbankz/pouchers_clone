import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/profile/profile_bvn.dart';
import 'package:Pouchers/modules/profile/profile_utility_bill.dart';
import 'package:Pouchers/modules/profile/profile_valid_id.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

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

  // String? _utilityBill;
  bool? isUploadedIdentityCard;
  bool? hiveIsUploadedIdentityCard;
  String? result;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await checkTierLevel();
      // ref.read(getUserProfileProvider.notifier).getUserProfile();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    print(hiveTierLevel);
    print(hiveIsUploadedIdentityCard);
    print(result);
    return InitialPage(
        title: accountVerification,
        color: kPurpleColor800,
        child: ListenerPage(
          child: Container(
            color: Colors.white,
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
                    status: hiveTierLevel == 2 && (hiveIsUploadedIdentityCard!)
                        ? verified
                        : pending,
                    title: validCard,
                    subTitle: validCardSub,
                    bgColor: hiveTierLevel == 2 && (hiveIsUploadedIdentityCard!)
                        ? kLightColorGreen
                        : kColorLightYellow,
                    iconColor:
                        hiveTierLevel == 2 && (hiveIsUploadedIdentityCard!)
                            ? kColorGreen
                            : kColorYellow200,
                    next:
                        hiveTierLevel == 2 || hiveTierLevel == 3 ? false : true,
                    widget: hiveTierLevel == 2 && (hiveIsUploadedIdentityCard!)
                        ? Icon(
                            Icons.check,
                            color: kPrimaryWhite,
                            size: 20,
                          )
                        : Text(
                            "i",
                            style: TextStyle(fontWeight: FontWeight.w500),
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
                  status: (hiveTierLevel == 3 && hiveIsUploadedIdentityCard!)
                      ? verified
                      : pending,
                  title: utilityBill,
                  subTitle: utilityBillSub,
                  bgColor: (hiveTierLevel == 3 && hiveIsUploadedIdentityCard!)
                      ? kLightColorGreen
                      : kColorLightYellow,
                  iconColor: (hiveTierLevel == 3 && hiveIsUploadedIdentityCard!)
                      ? kColorGreen
                      : kColorYellow200,
                  next: (hiveTierLevel == 3 && hiveIsUploadedIdentityCard!)
                      ? false
                      : (hiveTierLevel == 3 && hiveIsUploadedIdentityCard!)
                          ? false
                          : true,
                  widget: (hiveTierLevel == 3 && hiveIsUploadedIdentityCard!)
                      ? Icon(
                          Icons.check,
                          color: kPrimaryWhite,
                          size: 20,
                        )
                      : Text(
                          "i",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                  onTap: (hiveTierLevel == 2 &&
                          hiveIsUploadedIdentityCard! &&
                          result == null)
                      ? () async {
                          result = await pushTo(
                            context,
                            ProfileUtilityBill(from: widget.from),
                            settings: const RouteSettings(
                              name: ProfileUtilityBill.routeName,
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              result = result;
                            });
                          }
                        }
                      : (hiveTierLevel == 2 &&
                              hiveIsUploadedIdentityCard! &&
                              result != null)
                          ? () {
                              showErrorBar(context, "Awaiting approval");
                            }
                          : () {
                              print("$hiveTierLevel");
                              print("$hiveIsUploadedIdentityCard");
                            },
                ),
              ],
            ),
          ),
        ));
  }

  checkTierLevel() {
    hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
    userTierLevel = userProfile.tierLevels;
    isUploadedIdentityCard = userProfile.isUploadedIdentityCard;
    result = ref.watch(editProfileInHouseProvider).utilityBill;
    print("resullkkfkmt$result");
    hiveIsUploadedIdentityCard =
        ref.watch(editProfileInHouseProvider).isUploadedIdentityCard;

    if (hiveIsUploadedIdentityCard == null) {
      setState(() {
        hiveIsUploadedIdentityCard = isUploadedIdentityCard;
      });
    }

    if (hiveTierLevel != null) {
      if (userTierLevel! > hiveTierLevel!) {
        ref.read(editProfileInHouseProvider.notifier).state.copyWith(
            tierLevels: userProfile.tierLevels,
            utilityBill: userProfile.utilityBill);
      } else {
        setState(() {
          hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
          result = ref.watch(editProfileInHouseProvider).utilityBill;
        });
      }
    } else {
      ref.read(editProfileInHouseProvider.notifier).state = ref
          .read(editProfileInHouseProvider.notifier)
          .state
          .copyWith(
              tierLevels: userProfile.tierLevels,
              utilityBill: userProfile.utilityBill);
      setState(() {
        hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
        result = ref.watch(editProfileInHouseProvider).utilityBill;
      });
    }
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
                // next
                //     ? SizedBox()
                //     :
                Container(
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
                        style: textTheme.headline6!.copyWith(color: iconColor),
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

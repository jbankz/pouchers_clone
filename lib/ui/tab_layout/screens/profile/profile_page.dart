import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/login/models/login_response.dart';
import 'package:pouchers/ui/tab_layout/models/profile_model.dart';
import 'package:pouchers/ui/tab_layout/screens/account/account_settings.dart';
import 'package:pouchers/ui/tab_layout/screens/profile/profile_kyc.dart';
import 'package:pouchers/ui/tab_layout/screens/profile/profile_tier_list.dart';
import 'package:pouchers/ui/tab_layout/widgets/profile_widget.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import '../../providers/account_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  static const String routeName = "profilePage";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  int? userTierLevel;
  int? hiveTierLevel;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (ref.watch(editProfileInHouseProvider).profilePicture == null) {
        ref.read(editProfileInHouseProvider.notifier).state = EditProfileData()
            .copyWith(profilePicture: userProfile.profilePicture);
      }
      await checkTierLevel();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kMacroPadding,
            horizontal: kMediumPadding,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  inkWell(
                    onTap: () {
                      pushTo(
                        context,
                        ProfileKYC(),
                        settings: const RouteSettings(
                          name: ProfileKYC.routeName,
                        ),
                      ).then((value) {
                        print("here");
                        checkTierLevel();
                      });
                    },
                    child: CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 8.0,
                      percent: 0.20,
                      backgroundColor: kPurple300,
                      center: ClipRRect(
                        borderRadius: BorderRadius.circular(116),
                        child: CachedNetworkImage(
                          height: 105,
                          width: 105,
                          imageUrl: "https://photow-profile-images.s3.us-west-2.amazonaws.com/${ref.watch(editProfileInHouseProvider).profilePicture ?? ""}",
                          placeholder: (context, url) => Container(
                            color: Colors.transparent,
                            height: 105,
                            width: 105,
                            child: const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    kPrimaryColor),
                              ),
                            ),
                          ),
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: kRegularPadding,
                                width: kRegularPadding,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPurpleColor),
                              ),
                              SizedBox(
                                height: kPadding,
                              ),
                              Container(
                                height: kRegularPadding,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(kSmallPadding),
                                        bottomLeft: Radius.circular(kPadding),
                                        topRight:
                                            Radius.circular(kSmallPadding),
                                        bottomRight: Radius.circular(kPadding)),
                                    color: kPurpleColor500),
                              )
                            ],
                          ),
                        ),
                      ),
                      progressColor: kPurpleColor,
                    ),
                  ),
                  SizedBox(
                    width: kSmallPadding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        ref.watch(editProfileInHouseProvider).firstName == null
                            ? "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.firstName!.substring(1).toLowerCase()} ${userProfile.lastName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(1).toLowerCase()}"
                            : "${ref.watch(editProfileInHouseProvider).firstName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).firstName!.substring(1).toLowerCase()} ${ref.watch(editProfileInHouseProvider).lastName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).lastName!.substring(1).toLowerCase()}",
                        style: textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "@${userProfile.tag}",
                        style: textTheme.bodyText1!.copyWith(
                          color: kIconGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: kPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: kSmallPadding, vertical: 2),
                            decoration: BoxDecoration(
                                color: kColorBackgroundLight,
                                border: Border.all(
                                    color: kPurpleColor700, width: 0.7),
                                borderRadius:
                                    BorderRadius.circular(kSmallPadding)),
                            child: Text(
                              "$tier $hiveTierLevel",
                              style: textTheme.headline4!.copyWith(
                                color: kSecondaryPurple,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: kSmallPadding,
                          ),
                          inkWell(
                            onTap: () {
                              pushTo(
                                context,
                                PouchersTierList(
                                  tier: hiveTierLevel,
                                ),
                                settings: const RouteSettings(
                                  name: PouchersTierList.routeName,
                                ),
                              ).then((value) {
                                checkTierLevel();
                              });
                            },
                            child: Text(
                              upgradeNow,
                              style: textTheme.headline2!.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: kMacroPadding,
              ),
              Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMediumPadding),
                      color: kBackgroundColor)),
              SizedBox(
                height: kLargePadding,
              ),
              ProfileRoleWidget(
                text: referralText,
                subText: referralSub,
                icon: AssetPaths.referralIcon,
                textTheme: textTheme,
                onTap: () {},
              ),
              ProfileRoleWidget(
                text: savedCard,
                subText: savedCardSub,
                textTheme: textTheme,
                icon: AssetPaths.savedCardIcon,
                onTap: () {},
              ),
              ProfileRoleWidget(
                text: accountSetting,
                subText: accountSettingSub,
                textTheme: textTheme,
                icon: AssetPaths.accountIcon,
                onTap: () {
                  pushTo(
                    context,
                    AccountSettings(),
                    settings: const RouteSettings(
                      name: AccountSettings.routeName,
                    ),
                  );
                },
              ),
              ProfileRoleWidget(
                text: helpSupport,
                subText: helpSupportSub,
                textTheme: textTheme,
                icon: AssetPaths.helpIcon,
                onTap: () {},
              ),
              ProfileRoleWidget(
                text: legal,
                subText: legalSub,
                textTheme: textTheme,
                icon: AssetPaths.legalIcon,
                onTap: () {},
              ),
              ProfileRoleWidget(
                text: aboutPouchers,
                subText: aboutPouchersSub,
                icon: AssetPaths.pouIcon,
                textTheme: textTheme,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkTierLevel() {
    hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
    userTierLevel = userProfile.tierLevels;
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
      ref.read(editProfileInHouseProvider.notifier).state.tierLevels =
          userProfile.tierLevels;
      setState(() {
        hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
      });
    }
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/profile_model.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/account/screens/account_settings/account_settings.dart';
import 'package:pouchers/modules/account/screens/account_settings/schedule_payments.dart';
import 'package:pouchers/modules/account/screens/referral/referral.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/login/screens/login.dart';
import 'package:pouchers/modules/profile/profile_kyc.dart';
import 'package:pouchers/modules/profile/profile_tier_list.dart';
import 'package:pouchers/modules/tab_layout/widgets/profile_widget.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'dart:math' as math;

import 'package:pouchers/utils/widgets.dart';

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
      checkProvider();
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
                          imageUrl: ref
                                  .watch(editProfileInHouseProvider)
                                  .profilePicture ??
                              "",
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
                          errorWidget: (context, url, error) => ref
                                      .watch(editProfileInHouseProvider)
                                      .profilePicture !=
                                  null
                              ? Image.network(
                                  ref
                                      .watch(editProfileInHouseProvider)
                                      .profilePicture!,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                )
                              : Column(
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
                                              topLeft: Radius.circular(
                                                  kSmallPadding),
                                              bottomLeft:
                                                  Radius.circular(kPadding),
                                              topRight: Radius.circular(
                                                  kSmallPadding),
                                              bottomRight:
                                                  Radius.circular(kPadding)),
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
                          hiveTierLevel == 3 ? SizedBox() : inkWell(
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
                icon: SvgPicture.asset(
                  AssetPaths.referralIcon,
                ),
                textTheme: textTheme,
                onTap: () {
                  pushTo(
                    context,
                    Referral(),
                    settings: RouteSettings(name: Referral.routeName),
                  );
                },
              ),
              ProfileRoleWidget(
                text: accountSetting,
                subText: accountSettingSub,
                textTheme: textTheme,
                icon: SvgPicture.asset(AssetPaths.accountIcon),
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
                text: scheduledPayment,
                subText: scheduledPaymentSub,
                textTheme: textTheme,
                icon: Transform(
                  transform: Matrix4(
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                  )..rotateX(math.pi),
                  alignment: Alignment.center,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(0.87),
                    child: Icon(
                      Icons.sync,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                onTap: () {
                  pushTo(
                    context,
                    SchedulePayments(),
                    settings: const RouteSettings(
                      name: SchedulePayments.routeName,
                    ),
                  );
                },
              ),
              ProfileRoleWidget(
                text: helpSupport,
                subText: helpSupportSub,
                textTheme: textTheme,
                icon: SvgPicture.asset(AssetPaths.helpIcon),
                onTap: () {},
              ),
              ProfileRoleWidget(
                text: legal,
                subText: legalSub,
                textTheme: textTheme,
                icon: SvgPicture.asset(AssetPaths.legalIcon),
                onTap: () {},
              ),
              ProfileRoleWidget(
                text: aboutPouchers,
                subText: aboutPouchersSub,
                icon: SvgPicture.asset(AssetPaths.pouIcon),
                textTheme: textTheme,
                onTap: () {},
              ),
              LargeButton(
                title: logOut,
                onPressed: () async{
                  ref.invalidate(editProfileInHouseProvider);
                // var refff =   ref.refresh(editProfileInHouseProvider);
                  pushToAndClearStack(
                    context,
                    LogInAccount(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkProvider(){
    if (ref.watch(editProfileInHouseProvider).firstName == null) {
      ref.read(editProfileInHouseProvider.notifier).state = ref
          .read(editProfileInHouseProvider.notifier)
          .state
          .copyWith(
          profilePicture: userProfile.profilePicture,
          firstName: userProfile.firstName,
          lastName: userProfile.lastName,
          tierLevels: userProfile.tierLevels,
          address: userProfile.address,
          gender: userProfile.gender,
          tag: userProfile.tag,
          dob: userProfile.dob,
          phoneNumber: userProfile.phoneNumber,
          email: userProfile.email,
          isLoginBiometricActive: userProfile.isLoginBiometricActive,
          isPaymentBiometricActive: userProfile.isPaymentBiometricActive,
          isUploadedIdentityCard: userProfile.isUploadedIdentityCard);
    } else {
      ref.read(editProfileInHouseProvider.notifier).state = ref
          .read(editProfileInHouseProvider.notifier)
          .state
          .copyWith(
          profilePicture:
          ref.watch(editProfileInHouseProvider).profilePicture,
          firstName: ref.watch(editProfileInHouseProvider).firstName,
          lastName: ref.watch(editProfileInHouseProvider).lastName,
          tierLevels: ref.watch(editProfileInHouseProvider).tierLevels,
          address: ref.watch(editProfileInHouseProvider).address,
          gender: ref.watch(editProfileInHouseProvider).gender,
          tag: ref.watch(editProfileInHouseProvider).tag,
          dob: ref.watch(editProfileInHouseProvider).dob,
          phoneNumber: ref.watch(editProfileInHouseProvider).phoneNumber,
          email: ref.watch(editProfileInHouseProvider).email,
          isLoginBiometricActive: userProfile.isLoginBiometricActive,
          isPaymentBiometricActive: userProfile.isPaymentBiometricActive,
          isUploadedIdentityCard: userProfile.isUploadedIdentityCard);
    }

  }

  checkTierLevel() {
    hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
    userTierLevel = userProfile.tierLevels;
    if (hiveTierLevel != null) {
      if (userTierLevel! > hiveTierLevel!) {
        ref.read(editProfileInHouseProvider.notifier).state = ref
            .read(editProfileInHouseProvider.notifier)
            .state
            .copyWith(tierLevels: userProfile.tierLevels);
      } else {
        setState(() {
          hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
        });
      }
    } else {
      ref.read(editProfileInHouseProvider.notifier).state = ref
          .read(editProfileInHouseProvider.notifier)
          .state
          .copyWith(tierLevels: userProfile.tierLevels);
      setState(() {
        hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
      });
    }
  }
}

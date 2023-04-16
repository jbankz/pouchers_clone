import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/common/credentials.dart';
import 'package:pouchers/app/common/model.dart';
import 'package:pouchers/app/helpers/session_manager.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/ui_models_class.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/login/screens/login.dart';
import 'package:pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:pouchers/modules/make_payment/screens/transfer_poucher_friend.dart';
import 'package:pouchers/modules/profile/profile_account_verification.dart';
import 'package:pouchers/modules/profile/profile_page.dart';
import 'package:pouchers/modules/tab_layout/screens/homepage/fund_wallet.dart';
import 'package:pouchers/modules/tab_layout/screens/homepage/notification.dart';
import 'package:pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/modules/tab_layout/widgets/home_widget.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  static const String routeName = "homePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>  {
  PageController _controller = PageController(viewportFraction: 0.8);
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  Future refresh() async {
   SessionManager.setWalletBalance("");
   ref.read(getWalletProvider.notifier).getWalletDetails();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      checkProvider();
      ref.read(getWalletProvider.notifier).getWalletDetails();
      ref.read(getBannerProvider.notifier).getBanner();
      UserCredentials? cred = await getUserCredentials();
print(cred);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
          left: kMediumPadding, right: kMediumPadding, top: kLargePadding),
      child: Column(
        children: [
          inkWell(
            onTap: () {
              pushTo(
                  context,
                  TabLayout(
                    gottenIndex: 3,
                  ),
                  settings: const RouteSettings(name: TabLayout.routeName));
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(116),
                  child: ref
                      .watch(editProfileInHouseProvider)
                      .profilePicture ==
                      null
                      ? Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                          ref
                              .watch(editProfileInHouseProvider)
                              .profilePicture ==
                              null
                              ? "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(0, 1).toUpperCase()}"
                              : "${ref.watch(editProfileInHouseProvider).firstName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).lastName!.substring(0, 1).toLowerCase()}",
                          style: textTheme.bodyText2!
                              .copyWith(fontSize: 22)),
                    ),
                  )
                      : Image.network(
                    ref
                        .watch(editProfileInHouseProvider)
                        .profilePicture ??
                        "",
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes !=
                              null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: kSmallPadding,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "$welcome ",
                              style: textTheme.headline3!.copyWith(
                                color: kDarkFill,
                              ),
                              children: [
                                TextSpan(
                                  text: ref
                                      .watch(editProfileInHouseProvider)
                                      .firstName ==
                                      null
                                      ? "${userProfile.firstName}"
                                      : "${ref.watch(editProfileInHouseProvider).firstName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).firstName!.substring(1).toLowerCase()}.",
                                  style: textTheme.headline3!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: kDarkFill),
                                )
                              ])),
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
                          "$tier ${ref.watch(editProfileInHouseProvider).tierLevels}",
                          style: textTheme.headline4!.copyWith(
                            color: kSecondaryPurple,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                inkWell(
                  onTap: () {
                    pushTo(context, NotificationPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: kPadding),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kBackgroundColor),
                      child: SvgPicture.asset(
                        AssetPaths.notification,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: refresh,
              color: kPrimaryColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: kMediumPadding,
                      ),
                      ref.watch(editProfileInHouseProvider).tierLevels == 3
                          ? SizedBox()
                          : inkWell(
                              onTap: () {
                                pushTo(
                                  context,
                                  AccountVerificationStatus(from: "homepage"),
                                  settings: const RouteSettings(
                                      name: AccountVerificationStatus.routeName),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kRegularPadding, vertical: kSmallPadding),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(kSmallPadding),
                                    color: kLightOrange100,
                                    border: Border.all(color: kLightOrange200, width: 1)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AssetPaths.shieldIcon),
                                    SizedBox(
                                      width: kPadding,
                                    ),
                                    Expanded(
                                      child: Text(
                                        completeSetUp,
                                        style: textTheme.headline2!.copyWith(
                                          color: kLightOrange300,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        color: kLightOrange200, size: 18)
                                  ],
                                ),
                              ),
                            ),
                      SizedBox(
                        height: kMediumPadding,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: kMediumPadding),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(kRegularPadding),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              totalBalance,
                              style: textTheme.headline3!.copyWith(
                                color: kPurpleLight,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ref.watch(getWalletProvider).when(
                                      done: (done) {
                                        if (done != null) {
                                          return RichText(
                                            text: TextSpan(
                                              text: ref.watch(checkObscureProvider)
                                                  ? "₦"
                                                  : "",
                                              style: TextStyle(
                                                color: kPrimaryWhite,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 30,
                                              ),
                                              children: [
                                                TextSpan(
                                                    text: ref.watch(checkObscureProvider)
                                                        ? kPriceFormatter(double.parse(
                                                            SessionManager
                                                                    .getWalletBalance() ??
                                                                "0.00"))
                                                        : "***** ",
                                                    style: textTheme.bodyText2!.copyWith(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 32,
                                                      height: 1.5,
                                                      fontFamily: "DMSans",
                                                    ))
                                              ],
                                            ),
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      },
                                      loading: () => SpinKitDemo(
                                        size: kMacroPadding,
                                        color: kPrimaryWhite,
                                      ),
                                    ),
                                SizedBox(
                                  width: kPadding,
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        ref.read(checkObscureProvider.notifier).state =
                                            !ref
                                                .read(checkObscureProvider.notifier)
                                                .state;
                                      });
                                    },
                                    child: ref.watch(checkObscureProvider)
                                        ? Icon(
                                            Icons.visibility_off_outlined,
                                            color: kSecondaryTextColor,
                                          )
                                        : Icon(Icons.visibility_outlined,
                                            color: kSecondaryTextColor)),
                              ],
                            ),
                            SizedBox(
                              height: kMacroPadding,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                HomeIcons(
                                  icon: AssetPaths.walletIcon,
                                  onTap: () {
                                    pushTo(context, FundWallet(),
                                            settings: const RouteSettings(
                                                name: FundWallet.routeName))
                                        .then((value) => ref
                                            .read(getWalletProvider.notifier)
                                            .getWalletDetails());
                                  },
                                  text: fundWallet,
                                ),
                                HomeIcons(
                                  icon: AssetPaths.swapIcon,
                                  onTap: () {
                                    buildShowModalBottomSheet(
                                      context,
                                      HomeModal(),
                                    );
                                  },
                                  text: transfer,
                                ),
                                HomeIcons(
                                  icon: AssetPaths.moneyBagIcon,
                                  onTap: () {
                                    pushTo(
                                      context,
                                      TransferPoucherFriend(
                                        isRequestMoney: true,
                                      ),
                                      settings: const RouteSettings(
                                          name: TransferPoucherFriend.routeName),
                                    );
                                  },
                                  text: request,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: kMacroPadding,
                      ),
                      Text(
                        quickLink,
                        style: textTheme.headline3!.copyWith(
                          color: kDarkFill,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: kRegularPadding,
                      ),
                      MasonryGridView.count(
                          crossAxisCount: 4,
                          itemCount: guestHomeClass.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisSpacing: 28,
                          mainAxisSpacing: 8,
                          padding: EdgeInsets.zero,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                inkWell(
                                  onTap: () {
                                    guestHomeClass[index].title == "More"
                                        ? showSuccessBar(context,
                                            "More Products will be added soon...")
                                        : pushTo(context, guestHomeClass[index].page);
                                  },
                                  child: Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kColorBackgroundLight,
                                    ),
                                    padding: EdgeInsets.all(kMediumPadding),
                                    child: SvgPicture.asset(
                                      guestHomeClass[index].icon,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: kRegularPadding,
                                ),
                                Text(
                                  guestHomeClass[index].title,
                                  style: textTheme.headline4,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                                SizedBox(
                                  height: kPadding,
                                ),
                              ],
                            );
                          }),
                      SizedBox(height: kMicroPadding),
                      Consumer(builder: (context, ref, _) {
                        return ref.watch(getBannerProvider).when(
                            done: (done) {
                              if (done != null) {
                                return ProductImageSlider(images: done.data!);
                              } else
                                return SizedBox();
                            },
                            // loading: () => SpinKitDemo(),
                            error: (val) => SizedBox());
                      }),
                      SizedBox(
                        height: kSmallPadding,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  checkProvider() {
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
              utilityBill: userProfile.utilityBill,
              isLoginBiometricActive: userProfile.isLoginBiometricActive,
              isPaymentBiometricActive: userProfile.isPaymentBiometricActive,
              isUploadedIdentityCard: userProfile.isUploadedIdentityCard);

      ref.read(biometricProvider.notifier).state =
          ref.read(biometricProvider.notifier).state.copyWith(
                isLoginBiometricActive: userProfile.isLoginBiometricActive,
                isPaymentBiometricActive: userProfile.isPaymentBiometricActive,
              );
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
              utilityBill: ref.watch(editProfileInHouseProvider).utilityBill,
              isLoginBiometricActive:
                  ref.watch(editProfileInHouseProvider).isLoginBiometricActive,
              isPaymentBiometricActive: ref
                  .watch(editProfileInHouseProvider)
                  .isPaymentBiometricActive,
              isUploadedIdentityCard:
                  ref.watch(editProfileInHouseProvider).isUploadedIdentityCard);

      ref.read(biometricProvider.notifier).state =
          ref.read(biometricProvider.notifier).state.copyWith(
                isLoginBiometricActive:
                    ref.watch(biometricProvider).isLoginBiometricActive,
                isPaymentBiometricActive:
                    ref.watch(biometricProvider).isPaymentBiometricActive,
              );
    }
    ;
  }
}

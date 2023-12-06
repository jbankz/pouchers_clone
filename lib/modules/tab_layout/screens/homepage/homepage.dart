import 'package:Pouchers/app/common/credentials.dart';
import 'package:Pouchers/app/common/model.dart';
import 'package:Pouchers/app/helpers/session_manager.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/cards/providers/cards_providers.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/make_payment/screens/transfer_poucher_friend.dart';
import 'package:Pouchers/modules/profile/profile_bvn.dart';
import 'package:Pouchers/modules/profile/profile_kyc.dart';
import 'package:Pouchers/modules/profile/profile_page.dart';
import 'package:Pouchers/modules/tab_layout/screens/homepage/fund_wallet.dart';
import 'package:Pouchers/modules/tab_layout/screens/homepage/notification.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/modules/tab_layout/widgets/home_widget.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/constant/ui_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../ui/features/transfer/presentation/sheets/transfer_money_sheet.dart';

/// TODO: Rebuild this entire Home Page
class HomePage extends ConsumerStatefulWidget {
  static const String routeName = "homePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  PageController _controller = PageController(viewportFraction: 0.8);
  // HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  bool showSecondGrid = false;

  final CancelToken _cancelToken = CancelToken();

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
      ref.read(getAllFeesProvider.notifier).getAllFees(amount: 0);
      UserCredentials? cred = await getUserCredentials();

      ref.read(walletNotifierProvider.notifier).getWalletBalance(_cancelToken);
    });
  }

  void toggleGrid() {
    setState(() {
      showSecondGrid = !showSecondGrid;
    });
  }

  void onGuestTap(int index) {
    guestHomeClass[index].title == "More"
        ? toggleGrid()
        // showSuccessBar(context,
        //         "More Products Will Be Added Soon...")
        : ref.watch(editProfileInHouseProvider).tierLevels == 1
            ? showSuccessBar(context, "Please Verify Your BVN To Proceed.")
            : pushTo(context, guestHomeClass[index].page);
  }

  @override
  void dispose() {
    _controller.dispose();
    _cancelToken.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    SizeConfig().init(context);
    return ValueListenableBuilder<Box>(
        valueListenable: userDao.getListenable(),
        builder: (_, box, __) {
          final userProfile = userDao.returnUser(box);
          return Padding(
            padding: const EdgeInsets.only(
                left: kMediumPadding,
                right: kMediumPadding,
                top: kSmallPadding),
            child: Column(
              children: [
                inkWell(
                  onTap: () {
                    pushTo(
                        context,
                        TabLayout(
                          gottenIndex: 3,
                        ),
                        settings:
                            const RouteSettings(name: TabLayout.routeName));
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
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kPrimaryColor,
                                ),
                                child: Center(
                                  child: Text(
                                      ref
                                                  .watch(
                                                      editProfileInHouseProvider)
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
                                errorBuilder:
                                    (BuildContext context, _, stackTrace) =>
                                        Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPrimaryColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                        ref
                                                    .watch(
                                                        editProfileInHouseProvider)
                                                    .profilePicture ==
                                                null
                                            ? "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(0, 1).toUpperCase()}"
                                            : "${ref.watch(editProfileInHouseProvider).firstName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).lastName!.substring(0, 1).toLowerCase()}",
                                        style: textTheme.bodyText2!
                                            .copyWith(fontSize: 22)),
                                  ),
                                ),
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ),
                      ),
                      const SizedBox(
                        width: kSmallPadding,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "Hello ",
                                    style: textTheme.headline3!.copyWith(
                                      color: kDarkFill,
                                    ),
                                    children: [
                                  TextSpan(
                                    text: ref
                                                .watch(
                                                    editProfileInHouseProvider)
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
                              padding: const EdgeInsets.symmetric(
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
                          pushTo(context, const NotificationPage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: kPadding),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kBackgroundColor),
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
                            const SizedBox(
                              height: kMediumPadding,
                            ),
                            ref.watch(editProfileInHouseProvider).tierLevels ==
                                    3
                                ? const SizedBox()
                                : ref
                                            .watch(editProfileInHouseProvider)
                                            .tierLevels ==
                                        1
                                    ? inkWell(
                                        onTap: () {
                                          pushTo(
                                            context,
                                            const BVNPage(),
                                            settings: const RouteSettings(
                                                name: BVNPage.routeName),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: kRegularPadding,
                                              vertical: kSmallPadding),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kSmallPadding),
                                              color: kLightOrange100,
                                              border: Border.all(
                                                  color: kLightOrange200,
                                                  width: 1)),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  AssetPaths.shieldIcon),
                                              const SizedBox(
                                                width: kPadding,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Upgrade To Tier 2 To Activate Your Wallet - Please Verify Your BVN",
                                                  style: textTheme.headline2!
                                                      .copyWith(
                                                    color: kLightOrange300,
                                                  ),
                                                ),
                                              ),
                                              const Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: kLightOrange200,
                                                  size: 18)
                                            ],
                                          ),
                                        ),
                                      )
                                    : inkWell(
                                        onTap: () {
                                          pushTo(
                                            context,
                                            const ProfileKYC(),
                                            settings: const RouteSettings(
                                                name: ProfileKYC.routeName),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: kRegularPadding,
                                              vertical: kSmallPadding),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kSmallPadding),
                                              color: kLightOrange100,
                                              border: Border.all(
                                                  color: kLightOrange200,
                                                  width: 1)),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  AssetPaths.shieldIcon),
                                              const SizedBox(
                                                width: kPadding,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  completeSetUp,
                                                  style: textTheme.headline2!
                                                      .copyWith(
                                                    color: kLightOrange300,
                                                  ),
                                                ),
                                              ),
                                              const Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: kLightOrange200,
                                                  size: 18)
                                            ],
                                          ),
                                        ),
                                      ),
                            const SizedBox(
                              height: kMediumPadding,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: kMediumPadding),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius:
                                    BorderRadius.circular(kRegularPadding),
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ref.watch(getWalletProvider).when(
                                              done: (done) => RichText(
                                                text: TextSpan(
                                                  text: ref.watch(
                                                          checkObscureProvider)
                                                      ? "₦"
                                                      : "",
                                                  style: const TextStyle(
                                                    color: kPrimaryWhite,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 30,
                                                  ),
                                                  children: [
                                                    ref.watch(
                                                            checkObscureProvider)
                                                        ? TextSpan(
                                                            text: kPriceFormatter(
                                                                double.parse(
                                                                    SessionManager
                                                                            .getWalletBalance() ??
                                                                        "0.00")),
                                                            style: textTheme
                                                                .bodyText2!
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 32,
                                                              height: 1.5,
                                                              fontFamily:
                                                                  "DMSans",
                                                            ))
                                                        : TextSpan(
                                                            text: "***** ",
                                                            style: textTheme
                                                                .bodyText2!
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 32,
                                                              height: 2,
                                                              fontFamily:
                                                                  "DMSans",
                                                            ))
                                                  ],
                                                ),
                                              ),
                                              loading: () => const SpinKitDemo(
                                                size: kMacroPadding,
                                                color: kPrimaryWhite,
                                              ),
                                            ),
                                        const SizedBox(
                                          width: kPadding,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                ref
                                                        .read(
                                                            checkObscureProvider
                                                                .notifier)
                                                        .state =
                                                    !ref
                                                        .read(
                                                            checkObscureProvider
                                                                .notifier)
                                                        .state;
                                              });
                                            },
                                            child: ref
                                                    .watch(checkObscureProvider)
                                                ? const Icon(
                                                    Icons
                                                        .visibility_off_outlined,
                                                    color: kSecondaryTextColor,
                                                  )
                                                : const Icon(
                                                    Icons.visibility_outlined,
                                                    color:
                                                        kSecondaryTextColor)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: kMacroPadding,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      HomeIcons(
                                        icon: AssetPaths.walletIcon,
                                        onTap: () {
                                          pushTo(context, FundWallet(),
                                                  settings: const RouteSettings(
                                                      name:
                                                          FundWallet.routeName))
                                              .then((value) => ref
                                                  .read(getWalletProvider
                                                      .notifier)
                                                  .getWalletDetails());
                                        },
                                        text: fundWallet,
                                      ),
                                      HomeIcons(
                                        icon: AssetPaths.swapIcon,
                                        onTap: () {
                                          ref
                                                      .watch(
                                                          editProfileInHouseProvider)
                                                      .tierLevels ==
                                                  1
                                              ? showSuccessBar(context,
                                                  "Please Verify Your BVN To Proceed.")
                                              // : buildShowModalBottomSheet(
                                              //     context, const HomeModal());
                                              : BottomSheets.showSheet(
                                                  wrap: false,
                                                  child:
                                                      const TransferMoneySheet());
                                        },
                                        text: transfer,
                                      ),
                                      HomeIcons(
                                        icon: AssetPaths.moneyBagIcon,
                                        onTap: () {
                                          ref
                                                      .watch(
                                                          editProfileInHouseProvider)
                                                      .tierLevels ==
                                                  1
                                              ? showSuccessBar(context,
                                                  "Please Verify Your BVN To Proceed.")
                                              : pushTo(
                                                  context,
                                                  const TransferPoucherFriend(
                                                    isRequestMoney: true,
                                                  ),
                                                  settings: const RouteSettings(
                                                      name:
                                                          TransferPoucherFriend
                                                              .routeName),
                                                );
                                        },
                                        text: request,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: kMacroPadding,
                            ),
                            Text(
                              quickLink,
                              style: textTheme.headline3!.copyWith(
                                color: kDarkFill,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: kRegularPadding,
                            ),
                            MasonryGridView.count(
                                crossAxisCount: 4,
                                itemCount: guestHomeClass.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisSpacing: 28,
                                mainAxisSpacing: 8,
                                padding: EdgeInsets.zero,
                                itemBuilder: (ctx, index) => Column(
                                      children: [
                                        inkWell(
                                          onTap: () => onGuestTap(index),
                                          child: Container(
                                            height: 70,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kColorBackgroundLight,
                                            ),
                                            padding: const EdgeInsets.all(
                                                kMediumPadding),
                                            child: SvgPicture.asset(
                                              guestHomeClass[index].icon,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: kRegularPadding,
                                        ),
                                        Text(
                                          guestHomeClass[index].title,
                                          style: textTheme.headline4,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                        ),
                                        const SizedBox(
                                          height: kPadding,
                                        ),
                                      ],
                                    )),
                            const SizedBox(height: kMicroPadding),
                            Consumer(
                                builder: (context, ref, _) =>
                                    ref.watch(getBannerProvider).when(
                                        done: (done) {
                                          if (done != null) {
                                            if (done.data != null &&
                                                done.data!.isNotEmpty) {
                                              return ProductImageSlider(
                                                  images: done.data!);
                                            }
                                            return const SizedBox();
                                          } else
                                            return const SizedBox();
                                        },
                                        // loading: () => SpinKitDemo(),
                                        error: (val) => const SizedBox())),
                            const SizedBox(
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
        });
  }

  checkProvider() {
    final userProfile = userDao.returnUser(userDao.box);

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
  }
}

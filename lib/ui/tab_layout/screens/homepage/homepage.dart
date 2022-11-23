import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/login/models/login_response.dart';
import 'package:pouchers/ui/tab_layout/models/profile_model.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/ui/tab_layout/providers/account_provider.dart';
import 'package:pouchers/ui/tab_layout/screens/profile/profile_account_verification.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';

class HomePage extends ConsumerStatefulWidget {
  static const String routeName = "homePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool obscure = true;
  PageController _controller = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (ref.watch(editProfileInHouseProvider).profilePicture == null) {
        ref.read(editProfileInHouseProvider.notifier).state = EditProfileData()
            .copyWith(profilePicture: userProfile.profilePicture);
      }
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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: kMediumPadding, right: kMediumPadding, top: kFullPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(116),
                  child: CachedNetworkImage(
                      height: 50,
                      width: 50,
                      imageUrl:
                          "https://photow-profile-images.s3.us-west-2.amazonaws.com/${ref.watch(editProfileInHouseProvider).profilePicture ?? ""}",
                      placeholder: (context, url) => Container(
                            color: Colors.transparent,
                            height: 50,
                            width: 50,
                            child: const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    kPrimaryColor),
                              ),
                            ),
                          ),
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kPrimaryColor),
                            child: Text(
                                ref
                                                .watch(
                                                    editProfileInHouseProvider)
                                                .firstName ==
                                            null ||
                                        ref
                                                .watch(
                                                    editProfileInHouseProvider)
                                                .lastName ==
                                            null
                                    ? "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(0, 1).toUpperCase()}"
                                    : "${ref.watch(editProfileInHouseProvider).firstName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).lastName!.substring(0, 1).toLowerCase()}",
                                style: textTheme.bodyText2!.copyWith(fontSize: 22)),
                          )
                      //     Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       height: kRegularPadding,
                      //       width: kRegularPadding,
                      //       decoration: BoxDecoration(
                      //           shape: BoxShape.circle, color: kPurpleColor),
                      //     ),
                      //     SizedBox(
                      //       height: kPadding,
                      //     ),
                      //     Container(
                      //       height: kRegularPadding,
                      //       width: 35,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.only(
                      //               topLeft: Radius.circular(kSmallPadding),
                      //               bottomLeft: Radius.circular(kPadding),
                      //               topRight: Radius.circular(kSmallPadding),
                      //               bottomRight: Radius.circular(kPadding)),
                      //           color: kPurpleColor500),
                      //     )
                      //   ],
                      // ),
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
                                  ? "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.firstName!.substring(1).toLowerCase()}"
                                  : "${ref.watch(editProfileInHouseProvider).firstName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).firstName!.substring(1).toLowerCase()}",
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
                            border:
                                Border.all(color: kPurpleColor700, width: 0.7),
                            borderRadius: BorderRadius.circular(kSmallPadding)),
                        child:
                            ref.watch(editProfileInHouseProvider).tierLevels ==
                                    null
                                ? Text(
                                    "$tier ${userProfile.tierLevels}",
                                    style: textTheme.headline4!.copyWith(
                                      color: kSecondaryPurple,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                : Text(
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
                Padding(
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
                )
              ],
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            inkWell(
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
                      RichText(
                        text: TextSpan(
                          text: "₦",
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                          ),
                          children: [
                            TextSpan(
                                text: obscure ? "****** " : "500,000.00 ",
                                style: textTheme.bodyText2!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  height: 1.5,
                                  fontFamily: "DMSans",
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: kPadding,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          child: obscure
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: kPrimaryWhite.withOpacity(0.5),
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  color: kPrimaryWhite.withOpacity(0.5),
                                )),
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
                        onTap: () {},
                        text: fundWallet,
                      ),
                      HomeIcons(
                        icon: AssetPaths.swapIcon,
                        onTap: () {},
                        text: transfer,
                      ),
                      HomeIcons(
                        icon: AssetPaths.moneyBagIcon,
                        onTap: () {},
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
            Container(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4,
                // mainAxisSpacing: 10,
                childAspectRatio: SizeConfig.blockSizeHorizontal! / 5.2,

                // childAspectRatio: MediaQuery.of(context).devicePixelRatio / 3.5,
                children: List.generate(
                  guestHomeClass.length,
                  (index) => Column(
                    children: [
                      inkWell(
                        onTap: () {
                          pushTo(context, guestHomeClass[index].page);
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
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            Container(
              height: SizeConfig.blockSizeVertical! * 24,
              // MediaQuery.of(context).size.height /
              //     MediaQuery.of(context).size.width *
              //     90,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              child: PageView(
                padEnds: false,
                children: [
                  Container(
                    padding: EdgeInsets.all(kMediumPadding),
                    margin: EdgeInsets.only(right: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSmallPadding),
                      image: DecorationImage(
                        image: AssetImage(AssetPaths.pageImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homePageText,
                          softWrap: true,
                          style: textTheme.bodyText1!.copyWith(
                              fontSize: SizeConfig.blockSizeVertical! * 3,
                              color: kOffWhite,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: kSmallPadding,
                        ),
                        Text(
                          homePageSubText,
                          style: textTheme.headline4!.copyWith(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(kMediumPadding),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSmallPadding),
                      color: Colors.green,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homePageText,
                          softWrap: true,
                          style: textTheme.bodyText1!.copyWith(
                              fontSize: SizeConfig.blockSizeVertical! * 3,
                              color: kOffWhite,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: kSmallPadding,
                        ),
                        Text(
                          homePageSubText,
                          style: textTheme.headline4!.copyWith(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
                controller: _controller,
                onPageChanged: _onChanged,
              ),
            ),
            SizedBox(
              height: kSmallPadding,
            ),
          ],
        ),
      ),
    );
  }
}

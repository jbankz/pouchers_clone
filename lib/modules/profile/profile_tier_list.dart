import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/profile/profile_account_verification.dart';
import 'package:pouchers/modules/tab_layout/providers/account_provider.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import '../../../../app/helpers/size_config.dart';
import '../../../../utils/assets_path.dart';

class PouchersTierList extends ConsumerStatefulWidget {
  static const String routeName = "pouchersTierList";
  final int? tier;

  const PouchersTierList({Key? key, this.tier}) : super(key: key);

  @override
  ConsumerState<PouchersTierList> createState() => _PouchersTierListState();
}

class _PouchersTierListState extends ConsumerState<PouchersTierList> {
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  int? userTierLevel;
  int? hiveTierLevel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(getTiersProvider.notifier).getTierList();
      await checkTierLevel();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InitialPage(
      title: pouchertier,
      child: ref.watch(getTiersProvider).when(
          done: (done) {
            if (done != null) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: kSmallPadding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: kSmallPadding,
                          height: 580,
                          decoration: BoxDecoration(
                            color: kLight100,
                            borderRadius: BorderRadius.circular(kSmallPadding),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: hiveTierLevel == 1
                                  ? 93
                                  : hiveTierLevel == 2
                                      ? 292
                                      : 490,
                              decoration: BoxDecoration(
                                color: kLightYellow200,
                                borderRadius:
                                    BorderRadius.circular(kSmallPadding),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: hiveTierLevel == 1
                              ? 105
                              : hiveTierLevel == 2
                                  ? 305
                                  : 505,
                          alignment: Alignment.bottomLeft,
                          child: SvgPicture.asset(AssetPaths.tierIcon),
                        ),
                        SizedBox(
                          width: kSmallPadding,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              done.data!.tier1 == null
                                  ? TiersContainer(
                                      text1: "50,000",
                                      text2: "50,000",
                                      maxbalance: "50,000",
                                      tier: tier,
                                    )
                                  : TiersContainer(
                                      maxbalance: done.data!.tier1!.maxBalance!,
                                      text1: done.data!.tier1!.dailyTxLimit!,
                                      text2: done.data!.tier1!.maxBalance!,
                                      tier: tier,
                                    ),
                              SizedBox(
                                height: kMediumPadding,
                              ),
                              done.data!.tier2 == null
                                  ? TiersContainer(
                                      text1: "50,000",
                                      text2: "50,000",
                                      tier: tier2,
                                      maxbalance: "50,000",
                                    )
                                  : TiersContainer(
                                      maxbalance: done.data!.tier2!.maxBalance!,
                                      text1: done.data!.tier2!.dailyTxLimit!,
                                      text2: done.data!.tier2!.maxBalance!,
                                      tier: tier2,
                                    ),
                              SizedBox(
                                height: kMediumPadding,
                              ),
                              done.data!.tier3 == null
                                  ? TiersContainer(
                                      text1: "50,000",
                                      text2: "50,000",
                                      tier: tier3,
                                      maxbalance: "50,000",
                                    )
                                  : TiersContainer(
                                      bgColor: kPrimaryColor,
                                      textColor: kPrimaryColor,
                                      color: kPrimaryWhite,
                                      maxbalance: done.data!.tier3!.maxBalance!,
                                      text1: done.data!.tier3!.dailyTxLimit!,
                                      text2: done.data!.tier3!.maxBalance!,
                                      tier: tier3,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kLargePadding,
                  ),
                  LargeButton(
                    title: upgrade,
                    onPressed: () {
                      pushTo(
                        context,
                        AccountVerificationStatus(),
                        settings: const RouteSettings(
                            name: AccountVerificationStatus.routeName),
                      ).then(
                        (value) => checkTierLevel(),
                      );
                    },
                  )
                ],
              );
            } else
              return SizedBox();
          },
          loading: () => SpinKitDemo()),
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

class TiersContainer extends StatelessWidget {
  final Color? bgColor, color, textColor;
  final String text1, text2, tier, maxbalance;

  const TiersContainer(
      {Key? key,
      this.bgColor,
      this.color,
      this.textColor,
      required this.text1,
      required this.tier,
      required this.maxbalance,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 180,
      padding:
          EdgeInsets.only(top: 35, bottom: 35, right: kMacroPadding, left: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRegularPadding),
        color: bgColor ?? kBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 8,
              top: 8,
              bottom: 8,
              right: kMediumPadding,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kMacroPadding),
                  bottomLeft: Radius.circular(kPadding),
                  topRight: Radius.circular(300),
                  bottomRight: Radius.circular(300)),
              color: color ?? kPrimaryColor,
            ),
            child: Text(
              tier,
              style: textTheme.headline4!.copyWith(
                color: textColor ?? kBackgroundColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dailyLimit,
                style: textTheme.headline2!.copyWith(
                    fontSize: 14,
                    color: tier == tier3 ? kPrimaryWhite : kPrimaryColor),
              ),
              SizedBox(
                height: kPadding,
              ),
              buildRichText(textTheme, text1, tier == tier3 ? true : false),
              SizedBox(
                height: kRegularPadding,
              ),
              Text(
                maxBalance,
                style: textTheme.headline2!.copyWith(
                    fontSize: 14,
                    color: tier == tier3 ? kPrimaryWhite : kPrimaryColor),
              ),
              SizedBox(
                height: kPadding,
              ),
              maxbalance == "unlimited"
                  ? Text(
                      maxbalance,
                      style: textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: tier == tier3 ? kPrimaryWhite : kPrimaryColor,
                        fontSize: 18,
                      ),
                    )
                  : buildRichText(
                      textTheme, text2, tier == tier3 ? true : false),
            ],
          )
        ],
      ),
    );
  }

  RichText buildRichText(TextTheme textTheme, String text, bool isColored) {
    return RichText(
      text: TextSpan(
        text: "₦",
        style: TextStyle(
          color: isColored ? kPrimaryWhite : kPrimaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        children: [
          TextSpan(
              text: text,
              style: textTheme.headline2!.copyWith(
                fontWeight: FontWeight.w700,
                color: isColored ? kPrimaryWhite : kPrimaryColor,
                fontSize: 18,
              ))
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

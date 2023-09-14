import 'package:Pouchers/modules/account/models/tier_list.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/profile/profile_account_verification.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
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
  List<MapEntry<String, String>> tiersList = [];




  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(getTiersProvider.notifier).getTierList(then: (val){
        for (var item in val.data){
          if (item.name!.startsWith('tier')){
            tiersList.add(MapEntry(item.name!, item.value!));
          }
        }
      });
      await checkTierLevel();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InitialPage(
      title: pouchertier,
      child: ListenerPage(
     child: ref.watch(getTiersProvider).when(
          done: (done) {
            if (done != null) {
              var tier1Limit = tiersList.firstWhere((element) => element.key.startsWith('tier1_daily')).value;
              var tier1Bal = tiersList.firstWhere((element) => element.key.startsWith('tier1_maximum')).value;
              var tier2Limit = tiersList.firstWhere((element) => element.key.startsWith('tier2_daily')).value;
              var tier2Bal = tiersList.firstWhere((element) => element.key.startsWith('tier2_maximum')).value;
              var tier3Limit = tiersList.firstWhere((element) => element.key.startsWith('tier3_daily')).value;
              var tier3Bal = tiersList.firstWhere((element) => element.key.startsWith('tier3_maximum')).value;
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
                                TiersContainer(
                                maxbalance: tier1Bal,
                                text1: tier1Limit,
                                tier: "$tier 1",text2: tier1Bal,
                              ),

                              SizedBox(
                                height: kMediumPadding,
                              ),
                               TiersContainer(
                                maxbalance: tier2Bal,
                                text1: tier2Limit,
                                text2: tier2Bal,
                                tier: tier2,
                              ),
                              SizedBox(
                                height: kMediumPadding,
                              ),
                               TiersContainer(
                                bgColor: kPrimaryColor,
                                textColor: kPrimaryColor,
                                color: kPrimaryWhite,
                                maxbalance: tier3Bal,
                                text1: tier3Limit,
                                text2:tier3Bal,
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
    ));
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

class TiersContainer extends StatelessWidget {
  final Color? bgColor, color, textColor;
  final String text1,  tier, maxbalance;
  final String? text2;

  const TiersContainer(
      {Key? key,
      this.bgColor,
      this.color,
      this.textColor,
      required this.text1,
      required this.tier,
      required this.maxbalance,
       this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 180,
      padding:
          EdgeInsets.only(top: 35, bottom: 35, right: kMacroPadding, left: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSmallPadding),
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
                  topLeft: Radius.circular(150),
                  bottomLeft: Radius.circular(80),
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
              Expanded(
                child: Text(
                  maxBalance,
                  style: textTheme.headline2!.copyWith(
                      fontSize: 14,
                      color: tier == tier3 ? kPrimaryWhite : kPrimaryColor),
                ),
              ),
              SizedBox(
                height: kPadding,
              ),
              maxbalance == "Unlimited " || maxbalance== "Unlimited"
                  ?
                   Text(
                     capitalize(maxbalance),
                      style: textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: tier == tier3 ? kPrimaryWhite : kPrimaryColor,
                        fontSize: 16,
                      ),
                    )
                  : buildRichText(
                      textTheme, "${text2}", tier == tier3 ? true : false),
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
              text: kPriceFormatter(double.parse(text)).replaceAll(".00", ""),
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

String getValue(List<TierListResponseData> data, String targetName) {
  for (var item in data) {
    if (item.name == targetName) {
      return item.value!;
    }
  }
  return "Value not found";
}

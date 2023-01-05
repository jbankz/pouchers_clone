import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/cards/screens/card_widgets.dart';
import 'package:pouchers/ui/cards/screens/create_virtual_card.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class CardHome extends StatefulWidget {
  static const String routeName = "cardHome";

  const CardHome({Key? key}) : super(key: key);

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      title: dollarVirtualCard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      AssetPaths.cardFrameIcon,
                      fit: BoxFit.fill,
                    ),
                    width: double.infinity,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: kSmallPadding, horizontal: kMediumPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            balance,
                            style: textTheme.headline6!.copyWith(
                              color: kPrimaryWhite,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "₦",
                              style: TextStyle(
                                color: kPrimaryWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              ),
                              children: [
                                TextSpan(
                                    text: "400,000.00 ",
                                    style: textTheme.bodyText2!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 26,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: kSmallPadding, horizontal: kMediumPadding),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: kDeepPurple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        15,
                      ),
                      bottomRight: Radius.circular(
                        15,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Munachi  Abi",
                              style: textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: kPadding,
                            ),
                            Text(
                              "**** **** 6799",
                              style: textTheme.bodyText2!.copyWith(
                                color: Color.fromRGBO(255, 255, 255, 0.8),
                              ),
                            )
                          ],
                        ),
                      ),
                      SvgPicture.asset(AssetPaths.visaIcon)
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardColumn(
                  onTap: () {
                    pushTo(
                        context,
                        CreateVirtualCard(
                          isFundCard: true,
                          isNaira: false,
                          isFundNaira: false,
                        ),
                        settings: const RouteSettings(
                            name: CreateVirtualCard.routeName));
                  },
                  textTheme: textTheme,
                  text: fundCard,
                  icon: AssetPaths.fundCardIcon),
              CardColumn(
                  onTap: () {
                    buildShowModalBottomSheet(
                      context,
                      CardDetails(),
                    );
                  },
                  textTheme: textTheme,
                  text: cardDetails,
                  icon: AssetPaths.cardDetailIcon),
              CardColumn(
                  textTheme: textTheme,
                  text: manage,
                  onTap: () {
                    buildShowModalBottomSheet(
                      context,
                      ManageCard(),
                    );
                  },
                  icon: AssetPaths.manageIcon)
            ],
          ),
          SizedBox(
            height: kLargePadding,
          ),
          Text(
            transHistory,
            style: textTheme.headline2!
                .copyWith(fontWeight: FontWeight.w700, color: kDarkFill),
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: kFullPadding,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 13,
                        left: kSmallPadding,
                        right: kSmallPadding,
                        bottom: kMediumPadding),
                    decoration: BoxDecoration(
                        color: kContainerColor,
                        borderRadius: BorderRadius.circular(kSmallPadding)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: kSmallPadding,
                          width: 70,
                          decoration: BoxDecoration(
                              color: kSecondaryTextColor,
                              borderRadius: BorderRadius.circular(kPadding)),
                        ),
                        SizedBox(
                          height: kSmallPadding,
                        ),
                        Container(
                          height: kSmallPadding,
                          width: 70,
                          decoration: BoxDecoration(
                              color: kSecondaryTextColor,
                              borderRadius: BorderRadius.circular(kPadding)),
                        ),
                        SizedBox(
                          height: kRegularPadding,
                        ),
                        Container(
                          height: kSmallPadding,
                          width: kLargePadding,
                          decoration: BoxDecoration(
                            color: kLightColor200,
                            borderRadius: BorderRadius.circular(kPadding),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Center(
                  child: Text(
                    noTransaction,
                    style: textTheme.headline4!.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kContainerColor),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: RotationTransition(
                        child: Icon(
                          Icons.send_rounded,
                          color: kColorGreen,
                          size: 17,
                        ),
                        turns: AlwaysStoppedAnimation(0.9),
                      ),
                    ),
                    SizedBox(
                      width: kSmallPadding,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Card funding",
                          style: textTheme.subtitle1!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "12 sep, 2022",
                          style: textTheme.headline3,
                        )
                      ],
                    )),
                    Row(
                      children: [
                        Text(
                          "+ ",
                          style: textTheme.subtitle1!.copyWith(fontSize: 16),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "₦",
                            style: TextStyle(
                              color: kPrimaryTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: "407,000.00",
                                style: textTheme.subtitle1!.copyWith(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: kRegularPadding),
                Divider(
                  thickness: 1,
                  color: kLight100,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kContainerColor),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: RotationTransition(
                        child: Icon(
                          Icons.send_rounded,
                          color: kColorOrange,
                          size: 17,
                        ),
                        turns: AlwaysStoppedAnimation(1.4),
                      ),
                    ),
                    SizedBox(
                      width: kSmallPadding,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Card funding",
                          style: textTheme.subtitle1!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "12 sep, 2022",
                          style: textTheme.headline3,
                        )
                      ],
                    )),
                    Text(
                      "- \$407,000.00",
                      style: textTheme.subtitle1!.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

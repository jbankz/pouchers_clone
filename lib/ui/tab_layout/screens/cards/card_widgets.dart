import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/tab_layout/screens/account/disable_account/disable_modal.dart';
import 'package:pouchers/ui/tab_layout/screens/cards/create_virtual_card.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

import '../../../../utils/flushbar.dart';
import '../../models/ui_models_class.dart';

String headerText(bool isFundCard, bool isFundNaira, bool isNaira) {
  if (isFundCard && !isFundNaira) {
    return fundDollarCard;
  } else if (isFundCard && isFundNaira) {
    return fundNairaCard;
  } else {
    if (!isFundCard && !isNaira) {
      return createDollarCard;
    } else {
      return createNairaCard;
    }
  }
}

class CreateCardWidget extends StatelessWidget {
  const CreateCardWidget({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kMicroPadding),
            topRight: Radius.circular(kMicroPadding),
          ),
          color: kPrimaryWhite),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: kMacroPadding,
              height: 5,
              decoration: BoxDecoration(
                color: kPurpleColor200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Text(
            selectCardType,
            style: textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          VirtualCardType(
            textTheme: textTheme,
            isNaira: true,
            onTap: () {
              Navigator.pop(context);
              pushTo(
                  context,
                  CreateVirtualCard(
                    isNaira: true,
                    isFundNaira: false,
                    isFundCard: false,
                  ),
                  settings:
                      const RouteSettings(name: CreateVirtualCard.routeName));
            },
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          VirtualCardType(
            textTheme: textTheme,
            isNaira: false,
            onTap: () {
              Navigator.pop(context);
              pushTo(
                  context,
                  CreateVirtualCard(
                    isNaira: false,
                    isFundNaira: false,
                    isFundCard: false,
                  ),
                  settings:
                      const RouteSettings(name: CreateVirtualCard.routeName));
            },
          ),
        ],
      ),
    );
  }
}

class VirtualCardType extends StatelessWidget {
  final bool isNaira;
  final Function() onTap;

  const VirtualCardType({
    Key? key,
    required this.textTheme,
    required this.onTap,
    required this.isNaira,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return inkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: kMacroPadding,
          horizontal: kMicroPadding,
        ),
        decoration: BoxDecoration(
          color: isNaira ? kGreen100Color : kBrightPurple,
          borderRadius: BorderRadius.circular(kSmallPadding),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isNaira ? nairaVirtualCard : dollarVirtualCard,
                    style: textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: "DMSans",
                    ),
                  ),
                  SizedBox(
                    height: kMicroPadding,
                  ),
                  RichText(
                    text: TextSpan(
                      text: isNaira ? "₦" : "\$",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: "2,000",
                          style: textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    creationFee.toLowerCase(),
                    style: textTheme.headline6!.copyWith(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(kRegularPadding),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 255, 255, 0.07),
              ),
              child: Container(
                  padding: EdgeInsets.all(kMediumPadding),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    isNaira ? AssetPaths.nairaIcon : AssetPaths.dollarIcon,
                    fit: BoxFit.scaleDown,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kMicroPadding),
            topRight: Radius.circular(kMicroPadding),
          ),
          color: kPrimaryWhite),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: kMacroPadding,
              height: 5,
              decoration: BoxDecoration(
                color: kPurpleColor200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Text(
            cardDetails,
            textAlign: TextAlign.center,
            style: textTheme.headline4!.copyWith(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kRegularPadding, vertical: kSmallPadding),
            decoration: BoxDecoration(
              color: kContainerColor,
              borderRadius: BorderRadius.circular(kSmallPadding),
            ),
            child: Column(
              children: [
                AirtimeRow(
                  textTheme: textTheme,
                  text: cardNumber,
                  isCopyIcon: true,
                  noSymbol: true,
                  subText: "1234 4556 8748 8734",
                  style: textTheme.headline4!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: cvv,
                  subText: "227",
                  noSymbol: true,
                  isCopyIcon: true,
                  style: textTheme.headline4!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: validTill,
                  subText: "07/24",
                  noSymbol: true,
                  isCopyIcon: true,
                  style: textTheme.headline4!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: cardName,
                  subText: "Munachi Abi",
                  noSymbol: true,
                  isCopyIcon: true,
                  style: textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kRegularPadding, vertical: kSmallPadding),
            decoration: BoxDecoration(
              color: kContainerColor,
              borderRadius: BorderRadius.circular(kSmallPadding),
            ),
            child: Column(
              children: [
                AirtimeRow(
                  textTheme: textTheme,
                  text: billingAddress,
                  subText: "19 Phaye street",
                  noSymbol: true,
                  isCopyIcon: true,
                  style: textTheme.headline4!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: zipCode,
                  subText: "123455",
                  noSymbol: true,
                  isCopyIcon: true,
                  style: textTheme.headline4!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: city,
                  subText: "Lekki",
                  noSymbol: true,
                  isCopyIcon: true,
                  style: textTheme.headline4!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: state,
                  isCopyIcon: true,
                  noSymbol: true,
                  subText: "Lagos",
                  style: textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ManageCard extends StatefulWidget {
  const ManageCard({Key? key}) : super(key: key);

  @override
  State<ManageCard> createState() => _ManageCardState();
}

class _ManageCardState extends State<ManageCard> {
  bool _freezeCard = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kMicroPadding),
            topRight: Radius.circular(kMicroPadding),
          ),
          color: kPrimaryWhite),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: kMacroPadding,
              height: 5,
              decoration: BoxDecoration(
                color: kPurpleColor200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Text(
            manageCard,
            textAlign: TextAlign.center,
            style: textTheme.headline4!.copyWith(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: kBackgroundColor),
                alignment: Alignment.center,
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset(
                  AssetPaths.freezeCardIcon,
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
                    freezeCard,
                    style: textTheme.subtitle1!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    freezeCardSub,
                    style: textTheme.headline3,
                  )
                ],
              )),
              FlutterSwitch(
                  width: 40.0,
                  height: 25.0,
                  valueFontSize: 25.0,
                  toggleSize: 15.0,
                  activeColor: kPrimaryColor,
                  inactiveColor: kLightColor500,
                  value: _freezeCard,
                  borderRadius: 30.0,
                  padding: 5.0,
                  onToggle: (val) {
                    setState(() {
                      _freezeCard = val;
                    });
                    Navigator.pop(context);

                    buildShowModalBottomSheet(
                        context,
                        DisableModal(
                          title: whatItMeans,
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FreezeCardWidget(textTheme: textTheme, text: freezeCardSub1,),
                              SizedBox(height: kSmallPadding,),
                              FreezeCardWidget(textTheme: textTheme, text: freezeCardSub2,),
                            ],
                          ),
                          buttonText: freezeCard,
                          color: kPrimaryColor,
                          subTitle: "",
                          textTheme: textTheme,
                        ));
                  }),
            ],
          )
        ],
      ),
    );
  }
}

class FreezeCardWidget extends StatelessWidget {
  final String text;
  const FreezeCardWidget({
    Key? key,
    required this.text,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 4,
          width: 4,
          margin: EdgeInsets.only(top: kSmallPadding),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kIconGrey
          ),
        ),
        SizedBox(width: kPadding,),
        Expanded(
          child: Text(
            text,
            style: textTheme.headline2!
                .copyWith(color: kIconGrey, height: 1.5),
          ),
        ),
      ],
    );
  }
}

// class ManageCardModal extends StatelessWidget {
//   const ManageCardModal({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     TextTheme textTheme = Theme.of(context).textTheme;
//     return Align(
//       alignment: Alignment(0, 1),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//             color: kPrimaryWhite,
//             borderRadius: BorderRadius.circular(kMediumPadding)),
//         margin: EdgeInsets.symmetric(
//             horizontal: kSmallPadding, vertical: kRegularPadding),
//         padding: EdgeInsets.symmetric(
//             horizontal: kMediumPadding, vertical: kLargePadding),
//         child: Material(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(kMediumPadding)),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: textTheme.subtitle1!.copyWith(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 20,
//                 ),
//               ),
//               SizedBox(
//                 height: kSmallPadding,
//               ),
//               widget == null
//                   ? Text(
//                 subTitle,
//                 style: textTheme.bodyText1!.copyWith(color: kIconGrey),
//               )
//                   : widget!,
//               SizedBox(
//                 height: kLargePadding,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   inkWell(
//                     onTap: () => Navigator.pop(context, "no"),
//                     child: Text(
//                       cancel,
//                       style: textTheme.bodyText1!.copyWith(
//                         fontWeight: FontWeight.w700,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   SizedBox(
//                     width: kMacroPadding,
//                   ),
//                   inkWell(
//                     onTap: () =>  Navigator.pop(context, "yes"),
//                     child: Text(
//                       buttonText,
//                       style: textTheme.bodyText1!.copyWith(
//                         fontWeight: FontWeight.w700,
//                         color: color,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class CardColumn extends StatelessWidget {
  final String text, icon;
  final Function() onTap;

  const CardColumn(
      {Key? key,
      required this.textTheme,
      required this.text,
      required this.onTap,
      required this.icon})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return inkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            // height: 80,
            // width: 80,
            padding: EdgeInsets.all(kSmallPadding),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(80, 52, 196, 0.9),
            ),
            child: SvgPicture.asset(
              icon,
              // fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            height: kPadding,
          ),
          Text(
            text,
            style: textTheme.headline4!.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }
}

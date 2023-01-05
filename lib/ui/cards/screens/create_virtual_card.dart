import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/cards/screens/card_summary.dart';
import 'package:pouchers/ui/cards/screens/card_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class CreateVirtualCard extends StatefulWidget {
  final bool? isNaira;
  static const String routeName = "createVirtualCard";
  final bool? isFundCard;
  final bool? isFundNaira;

  const CreateVirtualCard(
      {Key? key, this.isNaira, this.isFundCard, this.isFundNaira})
      : super(key: key);

  @override
  State<CreateVirtualCard> createState() => _CreateVirtualCardState();
}

class _CreateVirtualCardState extends State<CreateVirtualCard> {
  List<int> pinPicked = [];
  List<int> decimalPinPicked = [];
  List<bool> containerBoolean = [];
  String wholeText = "0";
  String decimalText = "00";
  bool wholeTextString = true;

  @override
  void initState() {
    super.initState();
    containerBoolean = List.generate(containerIndex.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      color: kPrimaryColor,
      titleColor: kPrimaryWhite,
      title:
          headerText(widget.isFundCard!, widget.isFundNaira!, widget.isNaira!),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            widget.isNaira!
                ? SizedBox()
                : FittedBox(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kSmallPadding,
                        vertical: kPadding,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kSmallPadding),
                        color: Color.fromRGBO(255, 255, 255, 0.2),
                      ),
                      child: Row(
                        children: [
                          Text("\$1 = ",
                              style: textTheme.bodyText2!.copyWith(
                                fontFamily: "DMSans",
                                fontSize: 16,
                              )),
                          RichText(
                            text: TextSpan(
                                text: "₦",
                                style: TextStyle(
                                  color: kPrimaryWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(
                                    text: "850",
                                    style: textTheme.bodyText2!.copyWith(
                                      fontFamily: "DMSans",
                                      fontSize: 16,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              height: kMacroPadding,
            ),
            RichText(
              text: TextSpan(
                  text: widget.isNaira! ? "₦" : "\$",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    fontWeight: FontWeight.w700,
                    fontSize: 42,
                  ),
                  children: [
                    TextSpan(
                        text: wholeText,
                        style: textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: kBackgroundColor.withOpacity(0.5),
                          fontSize: 42,
                        )),
                    TextSpan(
                        text: ".",
                        style: textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: kBackgroundColor.withOpacity(0.5),
                          fontSize: 22,
                        )),
                    TextSpan(
                        text: decimalText,
                        style: textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: kBackgroundColor.withOpacity(0.5),
                          fontSize: 22,
                        )),
                  ]),
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            widget.isFundCard!
                ? SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$creationFeeText: + ",
                        style: textTheme.headline3!
                            .copyWith(color: kBackgroundColor.withOpacity(0.8)),
                      ),
                      RichText(
                        text: TextSpan(
                            text: widget.isNaira! ? "₦" : "\$",
                            style: TextStyle(
                              color: kBackgroundColor.withOpacity(0.8),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "2,000.00",
                                style: textTheme.headline3!.copyWith(
                                    color: kBackgroundColor.withOpacity(0.8)),
                              ),
                            ]),
                      ),
                    ],
                  ),
            SizedBox(
              height: kLargePadding,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.count(
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,
                children: List.generate(
                  guestNumberDot.length,
                  (index) => Column(
                    children: [
                      inkWell(
                        onTap: guestNumberDot[index].title == "Delete"
                            ? () {
                                wholeTextString
                                    ? setState(() {
                                        if (pinPicked.isNotEmpty) {
                                          pinPicked.removeLast();
                                          if (pinPicked.isEmpty) {
                                            wholeText = "0";
                                          } else {
                                            wholeText = pinPicked.join("");
                                          }
                                        }
                                      })
                                    : setState(() {
                                        if (decimalPinPicked.isNotEmpty) {
                                          decimalPinPicked.removeLast();
                                          if (decimalPinPicked.isEmpty) {
                                            decimalText = "00";
                                            wholeTextString = true;
                                          } else {
                                            decimalText =
                                                decimalPinPicked.join("");
                                          }
                                        }
                                      });
                              }
                            : guestNumberDot[index].title == "."
                                ? () {
                                    setState(() {
                                      wholeTextString = false;
                                    });
                                  }
                                : () {
                                    wholeTextString
                                        ? setState(() {
                                            pinPicked.add(
                                              int.parse(
                                                  guestNumberDot[index].title),
                                            );
                                            if (pinPicked.first == 0) {
                                              pinPicked.removeAt(0);
                                              wholeText = "0";
                                            } else {
                                              wholeText = pinPicked.join("");
                                            }
                                          })
                                        : setState(() {
                                            if (decimalPinPicked.length != 2) {
                                              decimalPinPicked.add(
                                                int.parse(
                                                    guestNumber[index].title),
                                              );
                                              decimalText =
                                                  decimalPinPicked.join("");
                                            }
                                          });
                                  },
                        child: guestNumberDot[index].title == "Delete"
                            ? SvgPicture.asset(
                                AssetPaths.backSpaceIcon,
                                color: kPrimaryWhite,
                              )
                            : Container(
                                height: 35,
                                width: 35,
                                child: Text(
                                  guestNumberDot[index].title,
                                  style: textTheme.headline4!.copyWith(
                                      color: kPrimaryWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            LargeButton(
              disableColor: kPurpleDeep,
              title: fundCard,
              onPressed: () {
                pushTo(
                  context,
                  CardSummary(
                    isFundCard: widget.isFundCard,
                    isFundNaira: widget.isFundNaira,
                    isNaira: widget.isNaira,
                  ),
                  settings: const RouteSettings(
                    name: CardSummary.routeName,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

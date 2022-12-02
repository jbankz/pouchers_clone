import 'package:flutter/material.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/ui/tab_layout/screens/cards/card_widgets.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class CardSummary extends StatelessWidget {
  final bool? isFundCard;
  final bool? isNaira;
  final bool? isFundNaira;

  static const String routeName = "cardSummary";

  const CardSummary({Key? key, this.isFundCard, this.isNaira, this.isFundNaira})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      title: headerText(isFundCard!, isFundNaira!, isNaira!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Text(
                  transConfirm,
                  style: textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: kMicroPadding,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kRegularPadding, vertical: kMacroPadding),
                  decoration: BoxDecoration(
                    color: kContainerColor,
                    borderRadius: BorderRadius.circular(kSmallPadding),
                  ),
                  child: Column(
                    children: [
                      AirtimeRow(
                        textTheme: textTheme,
                        text: amountText,
                        subText: "22,400.00",
                        isCopyIcon: false,
                        isNaira: (isNaira! || isFundNaira!) ? true : false,
                        noSymbol: false,
                        style: textTheme.headline4!.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: kMacroPadding,
                      ),
                      isFundCard!
                          ? SizedBox()
                          : AirtimeRow(
                              textTheme: textTheme,
                              text: creationFeeText,
                              subText: "2000.00",
                              isCopyIcon: false,
                              noSymbol: false,
                              isNaira: isNaira!,
                              style: textTheme.headline4!.copyWith(
                                fontSize: 16,
                              ),
                            ),
                      SizedBox(
                        height: isFundCard! ? 0 : kMacroPadding,
                      ),
                      AirtimeRow(
                        textTheme: textTheme,
                        text:
                            (isNaira! || isFundNaira!) ? total : totalInDollars,
                        subText: "22,400",
                        isCopyIcon: false,
                        noSymbol: false,
                        isBold: true,
                        isNaira: (isNaira! || isFundNaira!) ? true : false,
                        style: textTheme.headline4!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: isFundCard! ? kMacroPadding : 0,
                      ),
                      isFundCard!
                          ? AirtimeRow(
                              textTheme: textTheme,
                              text: totalInNaira,
                              subText: "22,400",
                              noSymbol: false,
                              isCopyIcon: false,
                              isBold: true,
                              isNaira: isFundNaira!,
                              style: textTheme.headline4!
                                  .copyWith(fontWeight: FontWeight.w700),
                            )
                          : SizedBox(),
                      isNaira!
                          ? SizedBox()
                          : Column(
                              children: [
                                SizedBox(
                                  height: kMacroPadding,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: exchangeRate,
                                        style: textTheme.headline3,
                                      ),
                                      TextSpan(
                                        text: " \$1 = ₦850",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: kSecondaryTextColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: kMediumPadding,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: kLargePadding,
                ),
                RichText(
                  text: TextSpan(
                      text: debitText1,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: kSecondaryTextColor,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: " ₦",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: kPrimaryTextColor,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                            text: "22,400",
                            style: textTheme.headline3!.copyWith(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: debitText3, style: textTheme.headline3),
                      ]),
                ),
                SizedBox(
                  height: kSupremePadding,
                ),
                BalanceWidget(
                  textTheme: textTheme,
                  text: "945.04",
                  hasBalance: false,
                ),
              ],
            ),
          ),
          LargeButton(
            title: isFundCard!
                ? fundCard
                : headerText(isFundCard!, isFundNaira!, isNaira!),
            onPressed: () {
              buildShowModalBottomSheet(
                context,
                TransactionPinContainer(
                  isData: false,
                  isCard: !isFundCard!,
                  isFundCard: isFundCard!,
                ),
              );
            },
            disableColor: kPurpleColor100,
          )
        ],
      ),
    );
  }
}

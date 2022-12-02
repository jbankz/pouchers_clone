import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class TransferSummary extends StatelessWidget {
  static const String routeName = "transferSummary";

  const TransferSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: transferMoney,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    confirmation,
                    style: textTheme.subtitle1!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AirtimeRow(
                          textTheme: textTheme,
                          text: amountText,
                          isCopyIcon: false,
                          noSymbol: false,
                          isNaira: true,
                          subText: "22,000.00",
                          style: textTheme.headline4!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: kMacroPadding,
                        ),
                        AirtimeRow(
                          textTheme: textTheme,
                          text: transferFee,
                          subText: "100.00",
                          isCopyIcon: false,
                          noSymbol: false,
                          isNaira: true,
                          style: textTheme.headline4!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: kMacroPadding,
                        ),
                        AirtimeRow(
                          textTheme: textTheme,
                          text: bankName,
                          subText: "Access Bank",
                          noSymbol: true,
                          isCopyIcon: false,
                          style: textTheme.headline4!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: kMacroPadding,
                        ),
                        AirtimeRow(
                          textTheme: textTheme,
                          text: accNumber,
                          subText: "Kingley Odinaka",
                          noSymbol: true,
                          isCopyIcon: false,
                          style: textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: kMacroPadding,
                        ),
                        AirtimeRow(
                          textTheme: textTheme,
                          text: total,
                          subText: "22,100.00",
                          isCopyIcon: false,
                          noSymbol: false,
                          isNaira: true,
                          isBold: true,
                          style: textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 16),
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
                              text: "9,068",
                              style: textTheme.headline3!.copyWith(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: debitText3, style: textTheme.headline3),
                        ]),
                  ),
                  SizedBox(
                    height: kFullPadding,
                  ),
                  BalanceWidget(
                    textTheme: textTheme,
                    text: "text",
                    hasBalance: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            LargeButton(
                title: fundCard,
                onPressed: () {
                  buildShowModalBottomSheet(
                    context,
                    TransactionPinContainer(
                        isData: false, isCard: false, isFundCard: true),
                  );
                })
          ],
        ));
  }
}

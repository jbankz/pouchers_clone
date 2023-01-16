import 'package:flutter/material.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class HistoryDetail extends StatelessWidget {
  static const String routeName = "historyDetail";
  final VoucherItems? item;

  const HistoryDetail({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      title: transReceipt,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(35),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: kColorGreen.withOpacity(0.2)),
                child: Container(
                  padding: EdgeInsets.all(35),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: kColorGreen),
                  child: Icon(Icons.check, color: kPrimaryWhite, size: 50),
                ),
              ),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            Text(
              transSuccessful,
              style: textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w500,
                color: kColorGreen,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              transSummary,
              style: textTheme.bodyText1!.copyWith(color: kDarkGrey100),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: kDarkGrey100),
                ),
                SizedBox(
                  width: kRegularPadding,
                ),
                Expanded(
                  child: Text(
                    item!.code,
                    style: textTheme.headline3!.copyWith(
                        color: kBlueColorDark, fontWeight: FontWeight.w500),
                  ),
                ),
                NairaWidget(
                  sign: '-',
                  addSign: true,
                  text: item!.value,
                  textStyle1: TextStyle(fontSize: 16, color: kColorRedDeep),
                  textStyle2: textTheme.headline3!.copyWith(
                    color: kColorRedDeep,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TransactionDate(
                  textTheme: textTheme,
                  text: "Oct 18,2022",
                ),
                SizedBox(
                  width: kRegularPadding,
                ),
                TransactionDate(
                  textTheme: textTheme,
                  text: "16:30 PM",
                )
              ],
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            TransactionDetails(
              textTheme: textTheme,
              text: status,
              subText: "Completed",
            ),
            TransactionDetails(
              textTheme: textTheme,
              text: paidWith,
              subText: "BalancePayment",
            ),
            TransactionDetails(
              textTheme: textTheme,
              text: operator,
              subText: "Globacom",
            ),
            TransactionDetails(
              textTheme: textTheme,
              text: phoneNumberText,
              subText: "+2348145224890",
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: kRegularPadding, horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSmallPadding),
                  color: kBackgroundColor),
              child: Column(
                children: [
                  Text(
                    transNumber,
                    style: textTheme.headline3!.copyWith(
                      color: kIconGrey,
                    ),
                  ),
                  SizedBox(
                    height: kSmallPadding,
                  ),
                  Text(
                    "3006211465789745271937",
                    style: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            LargeButton(title: getReceipt, onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class TransactionDetails extends StatelessWidget {
  const TransactionDetails(
      {Key? key,
      required this.textTheme,
      required this.text,
      required this.subText})
      : super(key: key);

  final TextTheme textTheme;
  final String text, subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: textTheme.headline3!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subText,
              style: textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: kRegularPadding,
        )
      ],
    );
  }
}

class TransactionDate extends StatelessWidget {
  final String text;

  const TransactionDate({Key? key, required this.textTheme, required this.text})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: kSmallPadding, vertical: kPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSmallPadding),
        border: Border.all(color: kSecondaryTextColor, width: 1),
      ),
      child: Text(
        text,
        style: textTheme.headline3!.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}

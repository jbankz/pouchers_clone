import 'package:flutter/material.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';

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
            Expanded(
              child: Text(
                text,
                style: textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Text(
                subText,
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
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

class ShareTransactionReceiptOptions extends StatelessWidget {
  final String text;
  final Widget icon;
  final Function()? onTap;
  const ShareTransactionReceiptOptions(
      {Key? key, required this.text, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: inkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: kRegularPadding, vertical: kSmallPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSmallPadding),
              border: Border.all(
                color: kPrimaryColor,
                width: 1,
              )),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: kSmallPadding,
              ),
              Text(
                text,
                style: textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionReceiptItems extends StatelessWidget {
  const TransactionReceiptItems(
      {Key? key,
      required this.text,
      required this.subText,
      this.color,
      this.hasSymbol = false})
      : super(key: key);
  final String text, subText;
  final Color? color;
  final bool hasSymbol;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            hasSymbol
                ? NairaWidget(
                    text: subText,
                    textStyle1: textTheme.subtitle1!.copyWith(fontFamily: ""),
                    textStyle2: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color ?? kPrimaryTextColor,
                      fontSize: 16,
                    ),
                  )
                : Flexible(
                    child: Text(
                      subText,
                      style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: color ?? kPrimaryTextColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.right,
                      softWrap: true,
                    ),
                  ),
          ],
        ),
        SizedBox(
          height: kMicroPadding,
        )
      ],
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 2.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

String changeCatNme(
    String name, String currency, String subCat, String beneficiary) {
  String cat = "";
  switch (name) {
    case "airtime-purchase":
      cat = "Airtime Purchase ($subCat)";
      break;
    case "data-purchase":
      cat = "Data Purchase ($subCat)";
      break;
    case "cable-purchase":
      cat = "Cable Purchase ($subCat)";
      break;
    case "electricity-purchase":
      cat = "Electricity Purchase ($subCat)";
      break;
    case "internet-purchase":
      cat = "Internet Purchase ($subCat)";
      break;
    case "voucher-redeem":
      cat = "Vouchers Redeem";
      break;
    case "voucher-purchase":
      cat = "Vouchers Purchase";
      break;
    case "p2p-transfer":
      cat = "Money Transfer (P2P)";
      break;
    case "fund-wallet":
      cat = "Wallet Funding";
      break;
    case "education-purchase":
      cat = "Education Purchase";
      break;
    case "create-virtual-card":
      cat = "Virtual Card Created ($currency)";
      break;
    case "fund-virtual-card":
      cat = "Virtual Card Funded ($currency)";
      break;
    case "local-bank-transfer":
      cat = "Money Transfer (Bank)";
      break;
    case "betting-purchase":
      cat = "Betting Purchase ($subCat)";
      break;
    case "admin-debit-wallet":
      cat = "Admin Debit Wallet";
      break;
    case "admin-credit-wallet":
      cat = "Admin Credit Wallet";
      break;
    case "referral-bonus-payment":
      cat = "Referral Bonus ($beneficiary)";
      break;
    default:
      cat = name;
  }
  return cat;
}

// String finalCatName(String currency, String itemCat){
//   String cat ='';
//   if(changeCatNme(itemCat) == "Virtual Card Funded" && currency == "NGN" ){
//     cat = "Virtual Card Funded (NGN)";
//   }else if(changeCatNme(itemCat) == "Virtual Card Funded" && currency == "USD"){
//     cat = "Virtual Card Funded (USD)";
//   }else if(changeCatNme(itemCat) == "Virtual Card Created" && currency == "USD"){
//     cat = "Virtual Card Created (USD)";
//   }else if(changeCatNme(itemCat) == "Virtual Card Created" && currency == "NGN"){
//     cat = "Virtual Card Created (NGN)";
//   }else{
//     cat = changeCatNme(itemCat);
//   }
//   return cat;
// }

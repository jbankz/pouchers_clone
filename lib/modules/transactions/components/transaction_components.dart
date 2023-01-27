import 'package:flutter/material.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';

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


class ShareTransactionReceiptOptions extends StatelessWidget {
  final String text;
  final Widget icon;
  final Function()? onTap;
  const ShareTransactionReceiptOptions({
    Key? key,
    required this.text,
    required this.icon,
    this.onTap
  }) : super(key: key);


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
                text, style: textTheme.headline2!.copyWith(
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
            Text(
              text,
              style: textTheme.headline3!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            hasSymbol
                ? NairaWidget(
                    text: subText,
                    textStyle1: textTheme.subtitle1!.copyWith(
                      fontFamily: ""
                    ),
                    textStyle2: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color ?? kPrimaryTextColor,
                      fontSize: 16,
                    ),
                  )
                : Text(
                    subText,
                    style: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color ?? kPrimaryTextColor,
                      fontSize: 16,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/create_account/screens/create_account.dart';
import 'package:pouchers/modules/onboarding/screens/pay_card.dart';
import 'package:pouchers/modules/onboarding/screens/pay_ussd.dart';
import 'package:pouchers/modules/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

import '../../../utils/constant/theme_color_constants.dart';

class GuestDiscountModal extends StatelessWidget {
  const GuestDiscountModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment(0, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: kPrimaryWhite,
            borderRadius: BorderRadius.circular(kMediumPadding)),
        margin: EdgeInsets.symmetric(
            horizontal: kSmallPadding, vertical: kRegularPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kLargePadding),
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kMediumPadding)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    child: Image.asset(
                      AssetPaths.micImage,
                      fit: BoxFit.cover,
                    ),
                    width: double.infinity,
                  ),
                  Positioned(
                    right: 0,
                    top: kRegularPadding,
                    child: Container(
                      padding: EdgeInsets.all(kRegularPadding),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kPrimaryWhite),
                      child: SvgPicture.asset(AssetPaths.bettingIcon),
                    ),
                  ),
                  Positioned(
                    right: 85,
                    top: kMicroPadding,
                    child: Container(
                      padding: EdgeInsets.all(kSmallPadding),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kPrimaryWhite),
                      child: SvgPicture.asset(AssetPaths.waterTapIcon),
                    ),
                  ),
                  Positioned(
                    right: kLargePadding,
                    top: kSmallPadding,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(kSmallPadding),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kPrimaryWhite),
                      child: SvgPicture.asset(AssetPaths.voucherIcon),
                    ),
                  ),
                  Positioned(
                    right: kSmallPadding,
                    bottom: kRegularPadding,
                    child: Container(
                      padding: EdgeInsets.all(kSmallPadding),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kPrimaryWhite),
                      child: SvgPicture.asset(AssetPaths.televisionIcon),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 0,
                    bottom: 50,
                    left: 0,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(kSmallPadding),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kPrimaryWhite),
                        child: SvgPicture.asset(AssetPaths.wifiIcon),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 10,
                    bottom: 0,
                    left: 80,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(kSmallPadding),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kPrimaryWhite),
                        child: SvgPicture.asset(AssetPaths.ticketIcon),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    left: 0,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(kSmallPadding),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kPrimaryWhite),
                        child: SvgPicture.asset(AssetPaths.electricityIcon),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 70,
                    bottom: 10,
                    // left: 120,
                    child: Container(
                      padding: EdgeInsets.all(kSmallPadding),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kPrimaryWhite),
                      child: SvgPicture.asset(AssetPaths.educationIcon),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: kMicroPadding,
              ),
              Text(
                joinPouchers,
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              RichText(
                text: TextSpan(
                    text: joinPouchers1,
                    style: textTheme.headline3!.copyWith(
                      color: kIconGrey,
                    ),
                    children: [
                      TextSpan(text: joinPouchers2, style: textTheme.headline2),
                      TextSpan(
                        text: joinPouchers3,
                        style: textTheme.headline3!.copyWith(
                          color: kIconGrey,
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: kLargePadding,
              ),
              LargeButton(
                  title: createAccountText,
                  onPressed: () {
                    Navigator.pop(context);
                    pushTo(context, CreateAccount(),
                        settings: RouteSettings(name: CreateAccount.routeName));
                  }),
              SizedBox(
                height: kMediumPadding,
              ),
              inkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    cancel,
                    style: textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuestMaximumAmountModal extends StatelessWidget {
  const GuestMaximumAmountModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment(0, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: kPrimaryWhite,
            borderRadius: BorderRadius.circular(kMediumPadding)),
        margin: EdgeInsets.symmetric(
            horizontal: kSmallPadding, vertical: kRegularPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kLargePadding),
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kMediumPadding)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                joinPouchers,
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              RichText(
                text: TextSpan(
                    text: maxGuestAmount,
                    style: TextStyle(
                      color: kIconGrey,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                          text: " ₦10,000. \n\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: kPrimaryTextColor)),
                      TextSpan(
                          text: maxGuestAmountSub,
                          style: textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          )),
                      TextSpan(
                        text: orText,
                        style: textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.normal, color: kIconGrey),
                      ),
                      TextSpan(
                        text: logIn,
                        style: textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: " $maxGuestAmountSub3",
                        style: textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.normal, color: kIconGrey),
                      )
                    ]),
              ),
              SizedBox(
                height: kLargePadding,
              ),
              LargeButton(
                  title: createAccountText,
                  onPressed: () {
                    Navigator.pop(context);
                    pushTo(context, CreateAccount(),
                        settings: RouteSettings(name: CreateAccount.routeName));
                  }),
              SizedBox(
                height: kMediumPadding,
              ),
              inkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    cancel,
                    style: textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuestRechargeSummary extends StatefulWidget {
  const GuestRechargeSummary({
    Key? key,
    required this.textTheme,
    this.purchaseDelivered = false,
  }) : super(key: key);

  final TextTheme textTheme;
  final bool? purchaseDelivered;

  @override
  State<GuestRechargeSummary> createState() => _GuestRechargeSummaryState();
}

class _GuestRechargeSummaryState extends State<GuestRechargeSummary> {
  String _payWith = payWithCard;

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
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(kRegularPadding),
            height: 70,
            width: 70,
            decoration:
                BoxDecoration(color: kContainerColor, shape: BoxShape.circle),
            child: SvgPicture.asset(
              AssetPaths.mtnLogoIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            airtime,
            textAlign: TextAlign.center,
            style: widget.textTheme.headline4!.copyWith(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: kLargePadding,
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
                  textTheme: widget.textTheme,
                  text: recipient,
                  subText: "08031234567",
                  isCopyIcon: false,
                  noSymbol: true,
                  style: widget.textTheme.headline3!.copyWith(
                      color: kPurpleColor, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                AirtimeRow(
                  textTheme: widget.textTheme,
                  text: amountText,
                  subText: "4,000.00",
                  isCopyIcon: false,
                  isNaira: true,
                  isBold: true,
                  noSymbol: false,
                  style: widget.textTheme.headline4!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                AirtimeRow(
                  textTheme: widget.textTheme,
                  text: fee,
                  subText: "0.00",
                  isNaira: true,
                  isCopyIcon: false,
                  noSymbol: false,
                  style: widget.textTheme.headline4!.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          Text(
            selectPaymentOption,
            style: widget.textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.w500,
              color: kIconGrey,
            ),
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Column(
            children: [
              inkWell(
                onTap: () {
                  setState(() => _payWith = payWithCard);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kMediumPadding, vertical: kRegularPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kSmallPadding),
                    border: Border.all(
                      color: _payWith == payWithCard
                          ? kPrimaryColor
                          : kLightPurple,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _payWith == payWithCard
                                ? kPrimaryColor
                                : kPurpleColor400,
                            width: 1.5,
                          ),
                        ),
                        child: _payWith == payWithCard
                            ? Container(
                                height: kSmallPadding,
                                width: kSmallPadding,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kPrimaryColor,
                                ),
                              )
                            : SizedBox(
                                height: kSmallPadding,
                                width: kSmallPadding,
                              ),
                      ),
                      SizedBox(
                        width: kMediumPadding,
                      ),
                      Text(
                        payWithCard,
                        style: widget.textTheme.subtitle1!
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: kMediumPadding,
              ),
              inkWell(
                onTap: () {
                  setState(() => _payWith = payWithUssd);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kMediumPadding, vertical: kRegularPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kSmallPadding),
                    border: Border.all(
                      color: _payWith == payWithUssd
                          ? kPrimaryColor
                          : kLightPurple,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _payWith == payWithUssd
                                ? kPrimaryColor
                                : kLightPurple,
                            width: 1.5,
                          ),
                        ),
                        child: _payWith == payWithUssd
                            ? Container(
                                height: kSmallPadding,
                                width: kSmallPadding,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kPrimaryColor,
                                ),
                              )
                            : SizedBox(
                                height: kSmallPadding,
                                width: kSmallPadding,
                              ),
                      ),
                      SizedBox(
                        width: kMediumPadding,
                      ),
                      Text(
                        payWithUssd,
                        style: widget.textTheme.subtitle1!
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: kLargePadding,
          ),
          LargeButton(
            title: continueText,
            onPressed: () {
              _payWith == payWithCard
                  ? pushTo(context, PayWithCard(
                isCable: true,
              ),
                      settings: RouteSettings(name: PayWithCard.routeName))
                  : pushTo(context, PayWithUssd(
              ),
                      settings: RouteSettings(name: PayWithUssd.routeName));
            },
          )
        ],
      ),
    );
  }
}

class PayWithAmount extends StatelessWidget {
  const PayWithAmount(
      {Key? key, required this.onTap, required this.text, required this.amount})
      : super(key: key);

  final Function() onTap;
  final String text, amount;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          backgroundColor: MaterialStateProperty.all<Color>(kPurpleColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: kBorderSmallRadius,
              side: BorderSide(color: kPrimaryColor),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(kMediumPadding),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w700, color: kPrimaryWhite),
            ),
            RichText(
              text: TextSpan(
                text: "₦",
                style: TextStyle(
                  color: kPrimaryWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: amount,
                    style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w700, color: kPrimaryWhite),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

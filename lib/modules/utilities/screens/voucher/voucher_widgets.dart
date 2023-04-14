import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/modules/utilities/screens/voucher/buy_voucher.dart';
import 'package:pouchers/modules/utilities/screens/voucher/gift_voucher.dart';
import 'package:pouchers/modules/utilities/screens/voucher/redeem_voucher.dart';
import 'package:pouchers/modules/utilities/screens/voucher/voucher.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';
import 'package:share_plus/share_plus.dart';

class VoucherItems {
  final String value, code, expiry, image;
  final String? sign;

  VoucherItems(
      {required this.value,
      required this.code,
      required this.expiry,
      required this.image,
      this.sign});

  @override
  String toString() {
    return 'VoucherItems{value: $value, code: $code, expiry: $expiry, image: $image}';
  }
}

class VoucherModal extends StatefulWidget {
  const VoucherModal({Key? key, required this.voucherItems}) : super(key: key);
  final List<Voucher> voucherItems;

  @override
  State<VoucherModal> createState() => _VoucherModalState();
}

class _VoucherModalState extends State<VoucherModal> {
  Voucher _value = Voucher(
    code: "",
    amount: "0.0",
    buyerId: "buyerId",
    status: "status",
    redeemed: true,
    createdAt: DateTime.now(),
  );
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        maxChildSize: 0.5,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kMicroPadding),
                topRight: Radius.circular(kMicroPadding),
              ),
              color: kPrimaryWhite),
          child: ListView(
            controller: controller,
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
                height: kMediumPadding,
              ),
              Text(
                availableVouchers,
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              widget.voucherItems.isEmpty
                  ? NoVoucher(
                      textTheme: textTheme,
                      text: noVouchers,
                    )
                  : Column(
                      children: widget.voucherItems
                          .mapIndexed(
                            (index, element) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kPadding,
                                  horizontal: kMicroPadding),
                              child: Column(
                                children: [
                                  inkWell(
                                    onTap: () {
                                      setState(() {
                                        _value = element;
                                        currentIndex = index;
                                      });
                                      Navigator.pop(context, _value);
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: currentIndex != index
                                                  ? kSecondaryTextColor
                                                  : kPrimaryColor,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: currentIndex == index
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
                                          width: kSmallPadding,
                                        ),
                                        Expanded(
                                          child: Text(
                                            element.code,
                                            style: textTheme.headline2!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700,
                                                    fontSize: 18,
                                                    color: currentIndex !=
                                                            index
                                                        ? kSecondaryTextColor
                                                        : kPrimaryColor),
                                          ),
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                text: "₦",
                                                style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal,
                                                  color: kColorGreen,
                                                  fontSize: 16,
                                                ),
                                                children: [
                                              TextSpan(
                                                text: kPriceFormatter(
                                                    double.parse(
                                                        element.amount)),
                                                style: textTheme.headline2!
                                                    .copyWith(
                                                  color: kColorGreen,
                                                ),
                                              )
                                            ])),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: kSmallPadding,
                                  ),
                                  Divider(
                                    color: kLightPurple,
                                    thickness: 1,
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class ViewVoucherHistoryHeading extends StatelessWidget {
  final String text;
  final Color color, bgColor;
  final Function() onTap;

  const ViewVoucherHistoryHeading(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.color,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return inkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: kRegularPadding, vertical: kPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              kRegularPadding,
            ),
            color: bgColor),
        child: Text(
          text,
          style: textTheme.headline6!.copyWith(color: color),
        ),
      ),
    );
  }
}

class VoucherSuccessful extends StatelessWidget {
  final String? amount, voucherCode;
  final bool isGift, isRedeem;
  final String message;

  const VoucherSuccessful(
      {Key? key,
      this.amount,
      required this.message,
      this.voucherCode,
      this.isGift = false,
      this.isRedeem = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      noBackButton: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isGift || isRedeem
              ? Lottie.asset(AssetPaths.success, height: 200, width: 200)
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMicroPadding),
                child: VoucherImage(
                    amount: amount!,
                    available: false,
                    voucherCode: voucherCode!,
                  ),
              ),
          SizedBox(
            height: kLargePadding,
          ),
          Text(
            dataSuccess,
            style: textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: kSmallPadding,
          ),
          Text(
            message,
            style: textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: kLargePadding,
          ),
          isGift || isRedeem
              ? SizedBox()
              : LargeButton(
                  title: shareVoucher,
                  whiteButton: true,
                  download: true,
                  onPressed: () {
                    Share.share(voucherCode!);
                  }),
          SizedBox(
            height: kMediumPadding,
          ),
          LargeButton(
            title: continueText,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class VoucherImage extends StatelessWidget {
  const VoucherImage({
    Key? key,
    required this.amount,
    required this.voucherCode,
     this.available = true
  }) : super(key: key);

  final String amount;
  final String voucherCode;
  final bool available;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(
            AssetPaths.voucherImage,
          ),
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SvgPicture.asset(
                AssetPaths.pouIcon,
                color: kPurple100,
                height: constraints.maxHeight / 1.8,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight / 5,
                  left: constraints.maxWidth / 10,
                  right: kMediumPadding,
                  bottom: kLargePadding,
                ),
                margin: EdgeInsets.only(left: kSmallPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          AssetPaths.poucherTextImage,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Total value",
                              style: textTheme.headline3!.copyWith(
                                color: kLightPurple,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "₦",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: kPrimaryWhite),
                                    children: [
                                  TextSpan(
                                    text: kPriceFormatter(double.parse(amount)),
                                    style: textTheme.bodyText2!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "DMSans",
                                      fontSize: 12,
                                    ),
                                  )
                                ])),
                          ],
                        )
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: available ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                            children: [
                              Text(
                                available ? "Available vouchers" : "Code",
                                style: textTheme.headline3!.copyWith(
                                    color: kLightPurple, fontSize: 10),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                voucherCode,
                                style: textTheme.bodyText2!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "DMSans",
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ]),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

class OnBoardingVoucherImage extends StatelessWidget {
  const OnBoardingVoucherImage({Key? key, required this.image})
      : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
        height: 100,
        child: SvgPicture.asset(
          image,
        ));
  }
}

class NoVoucher extends StatelessWidget {
  const NoVoucher({Key? key, required this.textTheme, required this.text})
      : super(key: key);

  final TextTheme textTheme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kBackgroundColor,
          ),
          padding: EdgeInsets.all(kMacroPadding),
          child: SvgPicture.asset(
            AssetPaths.voucherIcon,
            color: kIconGrey,
            height: 35,
            width: 35,
          ),
        ),
        SizedBox(
          height: kRegularPadding,
        ),
        Text(
          text,
          style: textTheme.headline3!.copyWith(
            color: kIconGrey,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:pouchers/modules/onboarding/screens/guest_widget.dart';
import 'package:pouchers/modules/tab_layout/screens/homepage/fund_wallet.dart';
import 'package:pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';

class GetProviderClass {
  final String title;
  final String icon;

  GetProviderClass({required this.title, required this.icon});
}

class ProviderRow {
  final String icon;

  const ProviderRow({required this.icon});
}

List<ProviderRow> provider = [
  ProviderRow(
    icon: AssetPaths.mtnLogoIcon,
  ),
  ProviderRow(
    icon: AssetPaths.gloIcon,
  ),
  ProviderRow(
    icon: AssetPaths.mobile9Icon,
  ),
  ProviderRow(
    icon: AssetPaths.airtelIcon,
  ),
];

class HomeIcons extends StatelessWidget {
  final String icon, text;
  final Function() onTap;

  const HomeIcons(
      {Key? key, required this.icon, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return inkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            child: SvgPicture.asset(
              icon,
              height: 24,
              width: 24,
            ),
            padding: EdgeInsets.all(kSmallPadding),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 255, 255, 0.9)),
          ),
          SizedBox(
            height: kPadding,
          ),
          Text(
            text,
            style: textTheme.headline6!.copyWith(color: kPurple200),
          )
        ],
      ),
    );
  }
}

class TransactionPinContainer extends ConsumerStatefulWidget {
  final bool isData,
      isCable,
      isBiometric,
      is2FA,
      isCard,
      isFundCard,
      isBuyVoucher,
      isGiftVoucher,
      isSchedule,
      isTransfer,
      returnPin;
  final Function()? doBiom, doSchedule, doTransfer;

  const TransactionPinContainer(
      {Key? key,
      required this.isData,
      this.isCable = false,
      this.isBiometric = false,
      this.isBuyVoucher = false,
      this.isGiftVoucher = false,
      this.isSchedule = false,
      this.isTransfer = false,
      this.returnPin = false,
      this.doBiom,
      this.doSchedule,
      this.doTransfer,
      required this.isCard,
      required this.isFundCard,
      this.is2FA = false})
      : super(key: key);

  @override
  ConsumerState<TransactionPinContainer> createState() =>
      _TransactionPinContainerState();
}

class _TransactionPinContainerState
    extends ConsumerState<TransactionPinContainer> {
  List<int> pinPicked = [];
  List<bool> containerBoolean = [];

  @override
  void initState() {
    super.initState();
    containerBoolean = List.generate(containerIndex.length, (index) => false);
  }

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
            enterPin,
            textAlign: TextAlign.center,
            style: textTheme.headline4!.copyWith(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                containerIndex.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: kRegularPadding),
                  height: kMediumPadding,
                  width: kMediumPadding,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: containerBoolean[index] == true
                          ? kPrimaryColor
                          : kPurpleColor300),
                ),
              ),
            ],
          ),
          // Consumer(builder: (context, ref, _) {
          //   ref.listen(
          //     validatePinProvider,
          //     (previous, NotifierState<String> next) {
          //       if (next.status == NotifierStatus.done) {
          //         if (widget.isBiometric) {
          //           Navigator.pop(context, pinPicked);
          //           widget.doBiom!();
          //         } else if(widget.isSchedule){
          //           Navigator.pop(context);
          //           widget.doSchedule!();
          //         }else if(widget.isTransfer){
          //           Navigator.pop(context);
          //           widget.doTransfer!();
          //         }
          //         else {
          //           widget.is2FA
          //               ? Navigator.pop(context, pinPicked)
          //               : pushTo(
          //                   context,
          //                   SuccessMessage(
          //                       text: widget.isData
          //                           ? dataSuccess
          //                           : widget.isCard
          //                               ? dataSuccess
          //                               : widget.isCable
          //                                   ? dataSuccess
          //                                   : widget.isBuyVoucher
          //                                       ? dataSuccess
          //                                       : rechargeSuccessful,
          //                       subText: widget.isData
          //                           ? dataSubSuccess
          //                           : widget.isCard
          //                               ? virtualCardSuccess
          //                               : widget.isFundCard
          //                                   ? virtualSuccess
          //                                   : widget.isCable
          //                                       ? deliveredPurchase
          //                                       : widget.isBuyVoucher
          //                                           ? voucherSuccessful
          //                                           : widget.isGiftVoucher
          //                                               ? giftVoucherSuccessful
          //                                               : rechargeSuccessfulSub,
          //                       onTap: () {
          //                         widget.isCard
          //                             ? pushToAndClearStack(
          //                                 context,
          //                                 TabLayout(
          //                                   gottenIndex: 1,
          //                                 ),
          //                               )
          //                             : pushToAndClearStack(
          //                                 context,
          //                                 TabLayout(
          //                                   gottenIndex: 0,
          //                                 ),
          //                               );
          //                       }),
          //                 );
          //         }
          //       } else if (next.status == NotifierStatus.error) {
          //         showErrorBar(context, next.message ?? next.data!);
          //       }
          //     },
          //   );
          //   var _widget = Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ...List.generate(
          //         containerIndex.length,
          //         (index) => Container(
          //           margin: EdgeInsets.symmetric(horizontal: kRegularPadding),
          //           height: kMediumPadding,
          //           width: kMediumPadding,
          //           decoration: BoxDecoration(
          //               shape: BoxShape.circle,
          //               color: containerBoolean[index] == true
          //                   ? kPrimaryColor
          //                   : kPurpleColor300),
          //         ),
          //       ),
          //     ],
          //   );
          //   return ref.watch(validatePinProvider).when(
          //         done: (done) => _widget,
          //         loading: () => SpinKitDemo(),
          //         error: (val) => _widget,
          //       );
          // }),
          SizedBox(
            height: kMacroPadding,
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
                guestNumber.length,
                (index) => Column(
                  children: [
                    inkWell(
                      onTap: guestNumber[index].title == "Delete"
                          ? () {
                              if (pinPicked.length != 0) {
                                setState(() {
                                  pinPicked.removeLast();
                                  for (int i = 3;
                                      i <= containerBoolean.length;) {
                                    if (containerBoolean[i] == true) {
                                      setState(
                                          () => containerBoolean[i] = false);
                                      break;
                                    } else {
                                      i--;
                                    }
                                  }
                                });
                              }
                            }
                          : () {
                              if (pinPicked.length != 4) {
                                setState(() {
                                  pinPicked.add(
                                    int.parse(guestNumber[index].title),
                                  );
                                });
                                for (int i = 0; i < containerBoolean.length;) {
                                  if (containerBoolean[i] == false) {
                                    setState(() => containerBoolean[i] = true);
                                    break;
                                  } else {
                                    i++;
                                  }
                                }
                                ref.read(phoneProvider.notifier).state =
                                    pinPicked.length;
                                if (ref.watch(phoneProvider) == 4) {
                                  Navigator.pop(context, pinPicked.join(""));
                                  // ref
                                  //     .read(validatePinProvider.notifier)
                                  //     .validatePin(pin: pinPicked.join(""));
                                }
                              }
                            },
                      child: guestNumber[index].title == "Delete"
                          ? SvgPicture.asset(AssetPaths.backSpaceIcon)
                          : Container(
                              height: 35,
                              width: 35,
                              child: Text(
                                guestNumber[index].title,
                                style: textTheme.headline4!.copyWith(
                                    color: kDarkFill100,
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
        ],
      ),
    );
  }
}

class AirtimeRow extends StatelessWidget {
  const AirtimeRow(
      {Key? key,
      required this.textTheme,
      required this.text,
      required this.subText,
      this.isNaira = false,
      this.isBold = false,
      required this.isCopyIcon,
      required this.noSymbol,
      required this.style})
      : super(key: key);

  final TextTheme textTheme;
  final String text, subText;
  final TextStyle style;
  final bool isNaira, isBold, isCopyIcon, noSymbol;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: textTheme.headline3!.copyWith(
              color: kIconGrey,
            ),
          ),
        ),
        !noSymbol
            ? RichText(
                text: TextSpan(
                  text: isNaira ? "₦" : "\$",
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontWeight: isBold ? FontWeight.w700 : FontWeight.normal,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: subText,
                      style: style,
                    )
                  ],
                ),
              )
            : Text(
                subText,
                style: style,
              ),
        SizedBox(
          width: kSmallPadding,
        ),
        isCopyIcon ? SvgPicture.asset(AssetPaths.copyIcon) : SizedBox()
      ],
    );
  }
}

class RechargeSummary extends StatelessWidget {
  const RechargeSummary({
    Key? key,
    required this.textTheme,
    required this.billerName,
    required this.billerLogo,
    required this.recipientNo,
    required this.amount,
  }) : super(key: key);

  final TextTheme textTheme;
  final String billerName, billerLogo, recipientNo, amount;

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
            billerName,
            textAlign: TextAlign.center,
            style: textTheme.headline4!.copyWith(
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
                  textTheme: textTheme,
                  text: recipient,
                  subText: recipientNo,
                  isCopyIcon: false,
                  noSymbol: true,
                  style: textTheme.headline3!.copyWith(
                      color: kPurpleColor, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: amountText,
                  subText: kPriceFormatter(double.parse(amount))
                      .replaceAll(".00", ""),
                  isCopyIcon: false,
                  isNaira: true,
                  isBold: true,
                  noSymbol: false,
                  style: textTheme.headline4!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: fee,
                  subText: "0.00",
                  isNaira: true,
                  isCopyIcon: false,
                  noSymbol: false,
                  style: textTheme.headline4!.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: cashBack,
                  subText: "0.00",
                  isCopyIcon: false,
                  noSymbol: false,
                  isNaira: true,
                  style: textTheme.headline4!.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: kLargePadding,
          ),
          Consumer(builder: (context, ref, _) {
            return BalanceWidget(
              hasBalance: double.parse(
                          ref.watch(getWalletProvider).data!.data!.balance!) >
                      double.parse(amount)
                  ? true
                  : false,
              textTheme: textTheme,
              text: ref.watch(getWalletProvider).data == null
                  ? ""
                  : kPriceFormatter(double.parse(
                      ref.watch(getWalletProvider).data!.data!.balance!)),
            );
          }),
          SizedBox(
            height: kFullPadding,
          ),
          PayWithAmount(
            amount: kPriceFormatter(double.parse(amount)).replaceAll(".00", ""),
            text: "$pay ",
            onTap: () async {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class BalanceWidget extends StatelessWidget {
  final String text;
  final bool hasBalance;

  const BalanceWidget(
      {Key? key,
      required this.textTheme,
      required this.text,
      required this.hasBalance})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return hasBalance
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: SvgPicture.asset(
                    AssetPaths.walletIcon,
                    height: kRegularPadding,
                    width: kRegularPadding,
                  ),
                  decoration: BoxDecoration(
                      color: kLightPurple, shape: BoxShape.circle),
                  padding: EdgeInsets.all(kSmallPadding)),
              Text(
                "  $balance - ",
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "₦",
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: text.replaceAll(".00", ""),
                      style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: SvgPicture.asset(
                            AssetPaths.walletIcon,
                            height: 22,
                            width: 22,
                          ),
                          decoration: BoxDecoration(
                              color: kLightPurple, shape: BoxShape.circle),
                          padding: EdgeInsets.all(kSmallPadding)),
                      Text(
                        "  $balance - ",
                        style: textTheme.headline4!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "₦",
                          style: TextStyle(
                            color: kPrimaryTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: text.replaceAll(".00", ""),
                              style: textTheme.headline4!.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  inkWell(
                    onTap: () {
                      pushTo(context, FundWallet(),
                          settings:
                              const RouteSettings(name: FundWallet.routeName));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: kRegularPadding, vertical: kSmallPadding),
                      decoration: BoxDecoration(
                          color: kPurpleColor,
                          borderRadius: BorderRadius.circular(kSmallPadding)),
                      child: Text(
                        fundWallet,
                        style: textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: kPrimaryWhite,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: kPadding,
              ),
              Text(
                insufficient,
                style: textTheme.headline4!.copyWith(
                  color: kColorOrange,
                ),
              ),
            ],
          );
  }
}

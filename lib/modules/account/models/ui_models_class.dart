import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:Pouchers/app/common/credentials.dart';
import 'package:Pouchers/app/common/model.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/onboarding/screens/guest_widget.dart';
import 'package:Pouchers/modules/onboarding/screens/pay_card.dart';
import 'package:Pouchers/modules/onboarding/screens/pay_ussd.dart';
import 'package:Pouchers/modules/tab_layout/screens/homepage/fund_wallet.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:Pouchers/modules/utilities/screens/webview_page.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/constant/ui_constants.dart';
import 'package:Pouchers/utils/extras.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class GetProviderClass {
  final String title;
  final String icon;

  GetProviderClass({required this.title, required this.icon});
}

class ProviderRow {
  final String icon;

  const ProviderRow({required this.icon});
}

List<ProviderRow> airtimeProvider = [
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

String icon(String displayName) {
  String icon = "";
  switch (displayName) {
    case "MTN":
      return airtimeProvider[0].icon;
    case "GLO":
      return airtimeProvider[1].icon;
    case "Airtel":
      return airtimeProvider[3].icon;
    default:
      return airtimeProvider[2].icon;
  }
}

int getIndex(String displayName) {
  String icon = "";
  switch (displayName) {
    case "MTN":
      return 0;
    case "GLO":
      return 1;
    case "Airtel":
      return 3;
    default:
      return 2;
  }
}

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
                          : () async {
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

class RechargeSummary extends ConsumerStatefulWidget {
  const RechargeSummary(
      {Key? key,
      required this.textTheme,
      required this.billerName,
      required this.billerLogo,
      required this.recipientNo,
      required this.billerId,
      required this.amount,
      this.utility = false,
      this.billerCode,
      this.category,
      this.isGuest = false,
      this.mobileOperatorServiceId,
      this.email,
      this.threshold,
      this.name})
      : super(key: key);

  final TextTheme textTheme;
  final bool utility, isGuest;
  final String? billerCode,
      category,
      mobileOperatorServiceId,
      name,
      email,
      threshold;

  final String billerName, billerLogo, recipientNo, amount, billerId;

  @override
  ConsumerState<RechargeSummary> createState() => _RechargeSummaryState();
}

class _RechargeSummaryState extends ConsumerState<RechargeSummary> {
  String _payWith = payWithCard;
  bool? _canCheckBiometrics;
  bool isAuth = false;
  UserCredentials? cred;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("utility is ${widget.utility}");
    getUserCred();
  }

  getUserCred() async {
    cred = await getUserCredentials();
  }

  @override
  Widget build(BuildContext context) {
    print(ref
        .watch(biometricProvider)
        .isPaymentBiometricActive);
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
          widget.billerLogo == ""
              ? SizedBox()
              : Container(
                  padding: EdgeInsets.all(kRegularPadding),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: kContainerColor, shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    widget.billerLogo,
                    fit: BoxFit.scaleDown,
                  ),
                ),
          Text(
            widget.billerName,
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
                  subText: widget.recipientNo,
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
                  subText: kPriceFormatter(double.parse(widget.amount))
                      .replaceAll(".00", ""),
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
                widget.isGuest
                    ? SizedBox()
                    : AirtimeRow(
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
                SizedBox(
                  height: widget.isGuest ? 0 : kRegularPadding,
                ),
                AirtimeRow(
                  textTheme: widget.textTheme,
                  text: cashBack,
                  subText: "0.00",
                  isCopyIcon: false,
                  noSymbol: false,
                  isNaira: true,
                  style: widget.textTheme.headline4!.copyWith(
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
            return ref.watch(getWalletProvider).data == null
                ? SizedBox()
                : BalanceWidget(
                    hasBalance: double.parse(ref
                                .watch(getWalletProvider)
                                .data!
                                .data!
                                .balance!) >
                            double.parse(widget.amount)
                        ? true
                        : false,
                    textTheme: widget.textTheme,
                    text: ref.watch(getWalletProvider).data == null
                        ? ""
                        : kPriceFormatter(double.parse(
                            ref.watch(getWalletProvider).data!.data!.balance!)),
                  );
          }),
          SizedBox(
            height: widget.isGuest ? kSmallPadding : kFullPadding,
          ),
          widget.isGuest
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    inkWell(
                      onTap: () {
                        setState(() => _payWith = payWithCard);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kMediumPadding,
                            vertical: kRegularPadding),
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
                            horizontal: kMediumPadding,
                            vertical: kRegularPadding),
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
                    ),
                    SizedBox(
                      height: kLargePadding,
                    ),
                    LargeButton(
                      title: continueText,
                      onPressed: () {
                        _payWith == payWithCard
                            ? pushTo(
                                context,
                                PayWithCard(
                                  isCable: true,
                                ),
                                settings:
                                    RouteSettings(name: PayWithCard.routeName))
                            : pushTo(
                                context,
                                PayWithUssd(
                                    cardNumber: widget.recipientNo,
                                    category: widget.category,
                                    subCat: widget.billerName,
                                    amount: widget.amount,
                                    name: widget.name,
                                    email: widget.email,
                                    providerId: widget.billerId,
                                    isUtility: widget.utility,
                                    serviceId: widget.mobileOperatorServiceId,
                                    merchantService: widget.billerCode),
                                settings:
                                    RouteSettings(name: PayWithUssd.routeName));
                      },
                    )
                  ],
                )
              : widget.utility
                  ? Consumer(builder: (context, ref, _) {
                      var _widget = PayWithAmount(
                        amount: kPriceFormatter(double.parse(widget.amount))
                            .replaceAll(".00", ""),
                        text: "$pay ",
                        onTap: double.parse(ref
                                    .watch(getWalletProvider)
                                    .data!
                                    .data!
                                    .balance!) <=
                                double.parse(widget.amount)
                            ? () {}
                            : () async {
                                if (ref
                                                .watch(biometricProvider)
                                                .isPaymentBiometricActive ==
                                            null ||
                                        !ref
                                            .watch(biometricProvider)
                                            .isPaymentBiometricActive!
                                    ) {
                                  final result =
                                      await buildShowModalBottomSheet(
                                    context,
                                    TransactionPinContainer(
                                      isData: false,
                                      isCard: false,
                                      isFundCard: false,
                                    ),
                                  );
                                  if (result != null) {
                                    ref
                                        .read(buyUtilitiesProvider.notifier)
                                        .buyUtilities(
                                            amount: double.parse(widget.amount),
                                            isSchedule: false,
                                            merchantAccount: widget.billerId,
                                            merchantReferenceNumber:
                                                widget.recipientNo,
                                            merchantService:
                                                widget.billerCode == null
                                                    ? []
                                                    : [widget.billerCode!],
                                            applyDiscount: double.parse(
                                                        widget.threshold!) <=
                                                    double.parse(widget.amount)
                                                ? true
                                                : false,
                                            subCategory: widget.billerName,
                                            transactionPin: result,
                                            category: "cable-purchase",
                                            then: () {
                                              ref
                                                  .read(getWalletProvider
                                                      .notifier)
                                                  .getWalletDetails();
                                              pushTo(
                                                context,
                                                SuccessMessage(
                                                  text: dataSuccess,
                                                  subText: deliveredPurchase,
                                                  onTap: () {
                                                    pushToAndClearStack(
                                                      context,
                                                      TabLayout(
                                                        gottenIndex: 0,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            error: (val) =>
                                                showErrorBar(context, val));
                                  }
                                } else {
                                  if (cred?.transactionPin == null ||
                                      cred?.transactionPin == "") {
                                    final result =
                                        await buildShowModalBottomSheet(
                                      context,
                                      TransactionPinContainer(
                                        isData: false,
                                        isCard: false,
                                        isFundCard: false,
                                      ),
                                    );
                                    if (result != null) {
                                      ref
                                          .read(buyUtilitiesProvider.notifier)
                                          .buyUtilities(
                                              amount:
                                                  double.parse(widget.amount),
                                              isSchedule: false,
                                              merchantAccount: widget.billerId,
                                              merchantReferenceNumber:
                                                  widget.recipientNo,
                                              merchantService:
                                                  widget.billerCode == null
                                                      ? []
                                                      : [widget.billerCode!],
                                              applyDiscount: double.parse(
                                                          widget.threshold!) <=
                                                      double.parse(
                                                          widget.amount)
                                                  ? true
                                                  : false,
                                              subCategory: widget.billerName,
                                              transactionPin: result,
                                              category: "cable-purchase",
                                              then: () {
                                                ref
                                                    .read(getWalletProvider
                                                        .notifier)
                                                    .getWalletDetails();
                                                pushTo(
                                                  context,
                                                  SuccessMessage(
                                                    text: dataSuccess,
                                                    subText: deliveredPurchase,
                                                    onTap: () {
                                                      pushToAndClearStack(
                                                        context,
                                                        TabLayout(
                                                          gottenIndex: 0,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              error: (val) =>
                                                  showErrorBar(context, val));
                                    }
                                  } else
                                    checkBiometric(context);
                                }
                              },
                      );
                      return ref.watch(buyUtilitiesProvider).when(
                          done: (done) => _widget,
                          loading: () => SpinKitDemo(),
                          error: (val) => _widget);
                    })
                  : Consumer(builder: (context, ref, _) {
                      var _widget = PayWithAmount(
                        amount: kPriceFormatter(double.parse(widget.amount))
                            .replaceAll(".00", ""),
                        text: "$pay ",
                        onTap: widget.isGuest
                            ? () {
                                ref
                                    .read(guestAirtimeProvider.notifier)
                                    .guestAirtime(
                                        subCategory: widget.billerName,
                                        amount: widget.amount,
                                        category: widget.category!,
                                        name: widget.name,
                                        email: widget.email,
                                        isAirtime:
                                            widget.category!.contains("airtime")
                                                ? true
                                                : false,
                                        mobileOperatorServiceId:
                                            widget.mobileOperatorServiceId,
                                        destinationPhoneNumber:
                                            widget.recipientNo,
                                        mobileOperatorPublicId: widget.billerId,
                                        then: (val) {
                                          pushTo(
                                              context,
                                              WebViewPage(
                                                url: val,
                                              ));
                                          print("val$val");
                                        },
                                        error: (val) =>
                                            showErrorBar(context, val));
                              }
                            : double.parse(ref
                                        .watch(getWalletProvider)
                                        .data!
                                        .data!
                                        .balance!) >
                                    double.parse(widget.amount)
                                ? () async {
                                    if (ref
                                                .watch(biometricProvider)
                                                .isPaymentBiometricActive ==
                                            null ||
                                        !ref
                                            .watch(biometricProvider)
                                            .isPaymentBiometricActive!) {
                                      final result =
                                          await buildShowModalBottomSheet(
                                        context,
                                        TransactionPinContainer(
                                          isData: false,
                                          isCard: false,
                                          isFundCard: false,
                                        ),
                                      );
                                      if (result != null) {
                                        ref
                                            .read(buyAirtimeProvider.notifier)
                                            .buyAirtime(
                                                subCategory: widget.billerName,
                                                amount: widget.amount,
                                                applyDiscount: double.parse(
                                                            widget
                                                                .threshold!) <=
                                                        double.parse(
                                                            widget.amount)
                                                    ? true
                                                    : false,
                                                category: widget.category!,
                                                isAirtime: widget.category!
                                                        .contains("airtime")
                                                    ? true
                                                    : false,
                                                mobileOperatorServiceId: widget
                                                    .mobileOperatorServiceId,
                                                destinationPhoneNumber:
                                                    widget.recipientNo,
                                                transactionPin: result,
                                                mobileOperatorPublicId:
                                                    widget.billerId,
                                                then: () async{
                                                  await saveUserCredential(
                                                  transactionPin: result);
                                                  ref
                                                      .read(getWalletProvider
                                                          .notifier)
                                                      .getWalletDetails();
                                                  pushTo(
                                                      context,
                                                      SuccessMessage(
                                                          text:
                                                              rechargeSuccessful,
                                                          subText:
                                                              rechargeSuccessfulSub,
                                                          onTap: () {
                                                            pushToAndClearStack(
                                                              context,
                                                              TabLayout(
                                                                gottenIndex: 0,
                                                              ),
                                                            );
                                                          }));
                                                },
                                                error: (val) async{
                                                  if(val.contains("Invalid credentials")){

                                                  }else{
                                                    await saveUserCredential(
                                                    transactionPin: result);
                                                  }
                                                  print("hghghjgjhsd$val");
                                                  showErrorBar(context, val);
                                                });
                                      }
                                    } else {
                                      if (cred?.transactionPin == null ||
                                          cred?.transactionPin == "") {
                                        print("touched here");
                                        print(cred?.transactionPin );
                                        final result =
                                            await buildShowModalBottomSheet(
                                          context,
                                          TransactionPinContainer(
                                            isData: false,
                                            isCard: false,
                                            isFundCard: false,
                                          ),
                                        );
                                        if (result != null) {
                                          ref
                                              .read(buyAirtimeProvider.notifier)
                                              .buyAirtime(
                                                  subCategory:
                                                      widget.billerName,
                                                  amount: widget.amount,
                                                  applyDiscount: double.parse(
                                                              widget
                                                                  .threshold!) <=
                                                          double.parse(
                                                              widget.amount)
                                                      ? true
                                                      : false,
                                                  category: widget.category!,
                                                  isAirtime: widget.category!
                                                          .contains("airtime")
                                                      ? true
                                                      : false,
                                                  mobileOperatorServiceId: widget
                                                      .mobileOperatorServiceId,
                                                  destinationPhoneNumber:
                                                      widget.recipientNo,
                                                  transactionPin: result,
                                                  mobileOperatorPublicId:
                                                      widget.billerId,
                                                  then: () async{
                                                    await saveUserCredential(
                                                    transactionPin: result);
                                                    ref
                                                        .read(getWalletProvider
                                                            .notifier)
                                                        .getWalletDetails();
                                                    pushTo(
                                                        context,
                                                        SuccessMessage(
                                                            text:
                                                                rechargeSuccessful,
                                                            subText:
                                                                rechargeSuccessfulSub,
                                                            onTap: () {
                                                              pushToAndClearStack(
                                                                context,
                                                                TabLayout(
                                                                  gottenIndex:
                                                                      0,
                                                                ),
                                                              );
                                                            }));
                                                  },
                                                  error: (val) async{
                                                    if(val.contains("Invalid credentials")){

                                                    }else{
                                                      await saveUserCredential(
                                                      transactionPin: result);
                                                    }
                                                    print("val ,mkkdkue$val");
                                                    showErrorBar(
                                                        context, val);
                                                  });
                                        }
                                      } else{
                                        print(cred?.transactionPin );
                                         checkBiometric(context);
                                      }

                                    }
                                  }
                                : () {},
                      );

                      return widget.isGuest
                          ? ref.watch(guestAirtimeProvider).when(
                              done: (done) => _widget,
                              loading: () => SpinKitDemo(),
                              error: (val) => _widget)
                          : ref.watch(buyAirtimeProvider).when(
                              done: (done) => _widget,
                              loading: () => SpinKitDemo(),
                              error: (val) => _widget);
                    })
        ],
      ),
    );
  }

  Future<void> checkBiometric(BuildContext context) async {
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("error biometrics $e");
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
    print("biometric is available: $canCheckBiometrics");
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      print("error enumerate biometrics $e");
    }
    print("following biometrics are available");
    if (availableBiometrics!.isNotEmpty) {
      availableBiometrics.forEach((ab) {
        print("\ttech: $availableBiometrics");
      });
    } else {
      showErrorBar(context,
          "No biometrics available for this device, Please input your credentials");
    }

    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
          localizedReason: 'To Pay',
          options: const AuthenticationOptions(
            biometricOnly: true,
            useErrorDialogs: true,
            stickyAuth: false,
          ),
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
                signInTitle: "Please place your finger on the sensor",
                cancelButton: "Cancel"),
            IOSAuthMessages()
          ]);
    } catch (e) {}

    setState(() {
      isAuth = authenticated ? true : false;
    });
    if (isAuth) {
      widget.utility
          ? ref.read(buyUtilitiesProvider.notifier).buyUtilities(
              amount: double.parse(widget.amount),
              isSchedule: false,
              merchantAccount: widget.billerId,
              merchantReferenceNumber: widget.recipientNo,
              merchantService:
                  widget.billerCode == null ? [] : [widget.billerCode!],
              applyDiscount:
                  double.parse(widget.threshold!) <= double.parse(widget.amount)
                      ? true
                      : false,
              subCategory: widget.billerName,
              transactionPin: cred!.transactionPin!,
              category: "cable-purchase",
              then: () {
                ref.read(getWalletProvider.notifier).getWalletDetails();
                pushTo(
                  context,
                  SuccessMessage(
                    text: dataSuccess,
                    subText: deliveredPurchase,
                    onTap: () {
                      pushToAndClearStack(
                        context,
                        TabLayout(
                          gottenIndex: 0,
                        ),
                      );
                    },
                  ),
                );
              },
              error: (val) => showErrorBar(context, val))
          : ref.read(buyAirtimeProvider.notifier).buyAirtime(
              subCategory: widget.billerName,
              amount: widget.amount,
              applyDiscount:
                  double.parse(widget.threshold!) <= double.parse(widget.amount)
                      ? true
                      : false,
              category: widget.category!,
              isAirtime: widget.category!.contains("airtime") ? true : false,
              mobileOperatorServiceId: widget.mobileOperatorServiceId,
              destinationPhoneNumber: widget.recipientNo,
              transactionPin: cred!.transactionPin!,
              mobileOperatorPublicId: widget.billerId,
              then: () {
                ref.read(getWalletProvider.notifier).getWalletDetails();
                pushTo(
                    context,
                    SuccessMessage(
                        text: rechargeSuccessful,
                        subText: rechargeSuccessfulSub,
                        onTap: () {
                          pushToAndClearStack(
                            context,
                            TabLayout(
                              gottenIndex: 0,
                            ),
                          );
                        }));
              },
              error: (val) => showErrorBar(context, val));
    }
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

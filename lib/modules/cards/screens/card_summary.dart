import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/ui_models_class.dart';
import 'package:pouchers/modules/cards/providers/cards_providers.dart';
import 'package:pouchers/modules/cards/screens/card_home.dart';
import 'package:pouchers/modules/cards/screens/card_widgets.dart';
import 'package:pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';

class CardSummary extends ConsumerStatefulWidget {
  final bool? isFundCard;
  final bool? isNaira;
  final bool? isFundNaira;
  final AddressClass? addressDetails;
  final String? amount;

  static const String routeName = "cardSummary";

  const CardSummary(
      {Key? key,
      this.amount,
      this.isFundCard,
      this.addressDetails,
      this.isNaira,
      this.isFundNaira})
      : super(key: key);

  @override
  ConsumerState<CardSummary> createState() => _CardSummaryState();
}

class _CardSummaryState extends ConsumerState<CardSummary> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print(ref.watch(getWalletProvider).data!.data!.balance);
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      title:
          headerText(widget.isFundCard!, widget.isFundNaira!, widget.isNaira!),
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
                        subText: kPriceFormatter(double.parse(widget.amount!)),
                        isCopyIcon: false,
                        isNaira: (widget.isNaira! || widget.isFundNaira!)
                            ? true
                            : false,
                        noSymbol: false,
                        style: textTheme.headline4!.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: kMacroPadding,
                      ),
                      widget.isFundCard!
                          ? SizedBox()
                          : AirtimeRow(
                              textTheme: textTheme,
                              text: creationFeeText,
                              subText: "0",
                              isCopyIcon: false,
                              noSymbol: false,
                              isNaira: widget.isNaira!,
                              style: textTheme.headline4!.copyWith(
                                fontSize: 16,
                              ),
                            ),
                      SizedBox(
                        height: widget.isFundCard! ? 0 : kMacroPadding,
                      ),
                      AirtimeRow(
                        textTheme: textTheme,
                        text: (widget.isNaira! || widget.isFundNaira!)
                            ? total
                            : totalInDollars,
                        subText:
                            kPriceFormatter(double.parse(widget.amount!) + 0),
                        isCopyIcon: false,
                        noSymbol: false,
                        isBold: true,
                        isNaira: (widget.isNaira! || widget.isFundNaira!)
                            ? true
                            : false,
                        style: textTheme.headline4!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: widget.isFundCard! ? kMacroPadding : 0,
                      ),
                      widget.isFundCard!
                          ? AirtimeRow(
                              textTheme: textTheme,
                              text: totalInNaira,
                              subText: widget.isFundNaira!
                                  ? kPriceFormatter(
                                      double.parse(widget.amount!) + 0)
                                  : kPriceFormatter(
                                      double.parse(widget.amount!) * 850),
                              noSymbol: false,
                              isCopyIcon: false,
                              isBold: true,
                              isNaira: true,
                              style: textTheme.headline4!
                                  .copyWith(fontWeight: FontWeight.w700),
                            )
                          : SizedBox(),
                      widget.isNaira!
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
                          text: widget.isFundNaira! ? " ₦" : " \$",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: kPrimaryTextColor,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                            text: kPriceFormatter(
                                double.parse(widget.amount!) + 0),
                            style: textTheme.headline3!.copyWith(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: debitText3, style: textTheme.headline3),
                      ]),
                ),
                SizedBox(
                  height: kSupremePadding,
                ),
                ref.watch(getWalletProvider).data == null
                    ? SizedBox()
                    : BalanceWidget(
                        textTheme: textTheme,
                        text: ref.watch(getWalletProvider).data == null
                            ? "0"
                            : kPriceFormatter(double.parse(ref
                                .watch(getWalletProvider)
                                .data!
                                .data!
                                .balance!)),
                        hasBalance: checkBalance()),
              ],
            ),
          ),
          SizedBox(
            height: kRegularPadding,
          ),
          widget.isFundCard!
              ? Consumer(builder: (context, ref, _) {
                  ref.listen(fundVirtualCardProvider,
                      (previous, NotifierState<String> next) {
                    if (next.status == NotifierStatus.done) {
                      ref.read(getWalletProvider.notifier).getWalletDetails();
                      pushTo(
                          context,
                          SuccessMessage(
                            text: dataSuccess,
                            subText: next.message ?? next.data ?? "",
                            onTap: () {
                              //Navigator.
                              widget.isFundNaira!
                                  ? Navigator.popUntil(
                                      context,
                                      (route) {
                                        route.isFirst;
                                      return  route.settings.name ==
                                            CardHome.routeName;

                                      }
                                    )
                                  : Navigator.popUntil(
                                      context,
                                      (route) =>
                                          route.settings.name ==
                                          CardHome.routeName,
                                    );
                            },
                          ),
                          settings:
                              RouteSettings(name: SuccessMessage.routeName));
                    } else if (next.status == NotifierStatus.error) {
                      showErrorBar(context, next.message ?? "");
                    }
                  });
                  var _widget = LargeButton(
                    title: fundCard,
                    onPressed: checkBalance() == true
                        ? () async {
                            final result = await buildShowModalBottomSheet(
                              context,
                              TransactionPinContainer(
                                isData: false,
                                isCard: !widget.isFundCard!,
                                isFundCard: widget.isFundCard!,
                              ),
                            );
                            if (result != null) {
                              ref
                                  .read(fundVirtualCardProvider.notifier)
                                  .fundVirtualCard(
                                      type: widget.isFundNaira! ? "NGN" : "USD",
                                      amount: double.parse(widget.amount!),
                                      transactionPin: result);
                            }
                          }
                        : () {},
                    disableColor: checkBalance() == true
                        ? kPrimaryColor
                        : kPurpleColor100,
                  );
                  return ref.watch(fundVirtualCardProvider).when(
                        done: (data) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget,
                      );
                })
              : Consumer(builder: (context, ref, _) {
                  ref.listen(createVirtualCardProvider,
                      (previous, NotifierState<String> next) {
                    if (next.status == NotifierStatus.done) {
                      ref.read(getWalletProvider.notifier).getWalletDetails();
                      pushTo(
                        context,
                        SuccessMessage(
                          text: dataSuccess,
                          subText: virtualCardSuccess,
                          onTap: () {
                            pushToAndClearStack(
                              context,
                              TabLayout(
                                gottenIndex: 1,
                              ),
                            );
                          },
                        ),
                      );
                    } else if (next.status == NotifierStatus.error) {
                      showErrorBar(context, next.message ?? "");
                    }
                  });
                  var _widget = LargeButton(
                    title: headerText(widget.isFundCard!, widget.isFundNaira!,
                        widget.isNaira!),
                    onPressed: checkBalance() == true
                        ? () async {
                            final result = await buildShowModalBottomSheet(
                              context,
                              TransactionPinContainer(
                                isData: false,
                                isCard: !widget.isFundCard!,
                                isFundCard: widget.isFundCard!,
                              ),
                            );
                            if (result != null) {
                              ref
                                  .read(createVirtualCardProvider.notifier)
                                  .createVirtualCard(
                                      address: widget.addressDetails!.address,
                                      city: widget.addressDetails!.city,
                                      residentState:
                                          widget.addressDetails!.residentState,
                                      country: widget.addressDetails!.country,
                                      postalCode:
                                          widget.addressDetails!.postalCode,
                                      currency: widget.isNaira! ? "NGN" : "USD",
                                      bvn: widget.addressDetails!.bvn,
                                      amount: double.parse(widget.amount!),
                                      transactionPin: result);
                            }
                          }
                        : () {},
                    disableColor: checkBalance() == true
                        ? kPrimaryColor
                        : kPurpleColor100,
                  );
                  return ref.watch(createVirtualCardProvider).when(
                        done: (data) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget,
                      );
                })
        ],
      ),
    );
  }

  bool checkBalance() {
    bool status = false;
    if (ref.watch(getWalletProvider).data != null) {
      if (widget.isFundNaira! || widget.isNaira!) {
        if (double.parse(ref.watch(getWalletProvider).data!.data!.balance!) >
            (double.parse(widget.amount!) + 0)) {
          status = true;
        } else {
          status = false;
        }
      } else {
        if (double.parse(ref.watch(getWalletProvider).data!.data!.balance!) >
            (double.parse(widget.amount!) * 850)) {
          status = true;
        } else {
          status = false;
        }
      }
      return status;
    } else {
      return status;
    }
  }
}

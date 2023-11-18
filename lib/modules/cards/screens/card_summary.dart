import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:Pouchers/app/common/credentials.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/common/model.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/cards/providers/cards_providers.dart';
import 'package:Pouchers/modules/cards/screens/card_home.dart';
import 'package:Pouchers/modules/cards/screens/card_widgets.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class CardSummary extends ConsumerStatefulWidget {
  final bool? isFundCard;
  final bool? isNaira;
  final bool? isFundNaira;
  final String? country;
  final String? bvn;
  final String? amount;

  static const String routeName = "cardSummary";

  const CardSummary(
      {Key? key,
      this.amount,
      this.isFundCard,
      this.country,
      this.bvn,
      this.isNaira,
      this.isFundNaira})
      : super(key: key);

  @override
  ConsumerState<CardSummary> createState() => _CardSummaryState();
}

class _CardSummaryState extends ConsumerState<CardSummary> {
  bool? _canCheckBiometrics;
  bool isAuth = false;
  UserCredentials? cred;

  @override
  void initState() {
    super.initState();
    getUserCred();
  }

  getUserCred() async {
    cred = await getUserCredentials();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    TextTheme textTheme = Theme.of(context).textTheme;

    ///For creating naira card
    double nairaCreationTotalFee = (int.parse(ref
            .watch(getAllFeesProvider)
            .data!
            .data!
            .firstWhere((element) => element.name == "naira_card_creation_fee")
            .value!)) +
        int.parse(ref
            .watch(getAllFeesProvider)
            .data!
            .data!
            .firstWhere((element) =>
                element.name == "sudo_verve_naira_card_creation_fee")
            .value!) +
        int.parse(ref
            .watch(getAllFeesProvider)
            .data!
            .data!
            .firstWhere((element) => element.name == "naira_card_funding_fee")
            .value!) +
        double.parse(ref
            .watch(getAllFeesProvider)
            .data!
            .data!
            .firstWhere((element) =>
                element.name == "sudo_verve_naira_card_funding_fee")
            .value!);

    ///For creating dollar card
    double dollarCreationTotalFee = (int.parse(ref
            .watch(getAllFeesProvider)
            .data!
            .data!
            .firstWhere((element) => element.name == "dollar_card_creation_fee")
            .value!)) +
        double.parse(ref
            .watch(getAllFeesProvider)
            .data!
            .data!
            .firstWhere(
                (element) => element.name == "sudo_dollar_card_creation_fee")
            .value!) +
        double.parse(ref
            .watch(getAllFeesProvider)
            .data!
            .data!
            .firstWhere((element) => element.name == "dollar_card_funding_fee")
            .value!) +
        double.parse(ref
            .watch(getAllFeesProvider)
            .data!
            .data!
            .firstWhere(
                (element) => element.name == "sudo_dollar_card_funding_fee")
            .value!);
    return InitialPage(
      title:
          headerText(widget.isFundCard!, widget.isFundNaira!, widget.isNaira!),
      child: ListenerPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    confirmation,
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
                          subText:
                              kPriceFormatter(double.parse(widget.amount!)),
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
                            ? AirtimeRow(
                                textTheme: textTheme,
                                text: fundingFeeText,
                                subText: widget.isNaira!
                                    ? kPriceFormatter(double.parse(ref
                                            .watch(getAllFeesProvider)
                                            .data!
                                            .data!
                                            .firstWhere((element) =>
                                                element.name ==
                                                "naira_card_funding_fee")
                                            .value!) +
                                        double.parse(ref
                                            .watch(getAllFeesProvider)
                                            .data!
                                            .data!
                                            .firstWhere((element) =>
                                                element.name ==
                                                "sudo_verve_naira_card_funding_fee")
                                            .value!))
                                    : kPriceFormatter((double.parse(ref
                                            .watch(getAllFeesProvider)
                                            .data!
                                            .data!
                                            .firstWhere((element) =>
                                                element.name == "dollar_card_funding_fee")
                                            .value!) +
                                        double.parse(ref.watch(getAllFeesProvider).data!.data!.firstWhere((element) => element.name == "sudo_dollar_card_funding_fee").value!))),
                                isCopyIcon: false,
                                noSymbol: false,
                                isNaira: widget.isNaira!,
                                style: textTheme.headline4!.copyWith(
                                  fontSize: 16,
                                ),
                              )
                            : AirtimeRow(
                                textTheme: textTheme,
                                text: creationFeeText,
                                subText: widget.isNaira!
                                    ? kPriceFormatter(
                                        (nairaCreationTotalFee).toDouble())
                                    : kPriceFormatter(dollarCreationTotalFee),
                                isCopyIcon: false,
                                noSymbol: false,
                                isNaira: widget.isNaira!,
                                style: textTheme.headline4!.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                        SizedBox(
                          height: kMacroPadding,
                        ),
                        widget.isFundCard!
                            ? AirtimeRow(
                                textTheme: textTheme,
                                text: widget.isFundNaira!
                                    ? total
                                    : totalInDollars,
                                subText: (widget.isFundNaira!)
                                    ? kPriceFormatter(double.parse(
                                            widget.amount!) +
                                        double.parse(ref
                                            .watch(getAllFeesProvider)
                                            .data!
                                            .data!
                                            .firstWhere((element) =>
                                                element.name ==
                                                "naira_card_funding_fee")
                                            .value!) +
                                        double.parse(ref
                                            .watch(getAllFeesProvider)
                                            .data!
                                            .data!
                                            .firstWhere((element) =>
                                                element.name ==
                                                "sudo_verve_naira_card_funding_fee")
                                            .value!))
                                    : kPriceFormatter(double.parse(
                                            widget.amount!) +
                                        double.parse(
                                          ref
                                              .watch(getAllFeesProvider)
                                              .data!
                                              .data!
                                              .firstWhere((element) =>
                                                  element.name ==
                                                  "dollar_card_funding_fee")
                                              .value!,
                                        ) +
                                        double.parse(ref
                                            .watch(getAllFeesProvider)
                                            .data!
                                            .data!
                                            .firstWhere((element) =>
                                                element.name ==
                                                "sudo_dollar_card_funding_fee")
                                            .value!)),
                                isCopyIcon: false,
                                noSymbol: false,
                                isBold: true,
                                isNaira: widget.isFundNaira! ? true : false,
                                style: textTheme.headline4!
                                    .copyWith(fontWeight: FontWeight.w700),
                              )
                            : AirtimeRow(
                                textTheme: textTheme,
                                text: (widget.isNaira! || widget.isFundNaira!)
                                    ? total
                                    : totalInDollars,
                                subText: (widget.isNaira! ||
                                        widget.isFundNaira!)
                                    ? kPriceFormatter(
                                        double.parse(widget.amount!) +
                                            nairaCreationTotalFee.toDouble())
                                    : kPriceFormatter(
                                        double.parse(widget.amount!) +
                                            dollarCreationTotalFee),
                                isCopyIcon: false,
                                noSymbol: false,
                                isBold: true,
                                isNaira:
                                    (widget.isNaira! || widget.isFundNaira!)
                                        ? true
                                        : false,
                                style: textTheme.headline4!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                        SizedBox(
                          height: kMacroPadding,
                        ),
                        widget.isFundNaira! || widget.isNaira!
                            ? SizedBox()
                            : AirtimeRow(
                                textTheme: textTheme,
                                text: totalInNaira,
                                subText: !widget.isFundNaira!
                                    ? kPriceFormatter((getTotalFee()))
                                    : !widget.isNaira!
                                        ? kPriceFormatter(
                                            (double.parse(widget.amount!) +
                                                    dollarCreationTotalFee) *
                                                double.parse(ref
                                                    .watch(getAllFeesProvider)
                                                    .data!
                                                    .data!
                                                    .firstWhere((element) =>
                                                        element.name ==
                                                        "current_dollar_rate")
                                                    .value!))
                                        : "0",
                                noSymbol: false,
                                isCopyIcon: false,
                                isBold: true,
                                isNaira: true,
                                style: textTheme.headline4!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
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
                                          text:
                                              " \$1 = ₦${ref.watch(getAllFeesProvider).data!.data!.firstWhere((element) => element.name == "current_dollar_rate").value!}",
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
                          widget.isFundCard!
                              ? TextSpan(
                                  text:
                                      // widget.isFundNaira!
                                      //     ? kPriceFormatter(getTotalFee())
                                      //     :
                                      kPriceFormatter(getTotalFee()),
                                  style: textTheme.headline3!.copyWith(
                                      color: kPrimaryTextColor,
                                      fontWeight: FontWeight.bold))
                              : TextSpan(
                                  text: widget.isNaira!
                                      ? kPriceFormatter(getTotalFee() +
                                          nairaCreationTotalFee.toDouble())
                                      : kPriceFormatter((getTotalFee() +
                                              dollarCreationTotalFee) *
                                          double.parse(ref
                                              .watch(getAllFeesProvider)
                                              .data!
                                              .data!
                                              .firstWhere((element) =>
                                                  element.name ==
                                                  "current_dollar_rate")
                                              .value!)),
                                  style: textTheme.headline3!.copyWith(
                                      color: kPrimaryTextColor,
                                      fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: debitText3, style: textTheme.headline3),
                        ]),
                  ),
                  SizedBox(
                    height: kSupremePadding,
                  ),
                  // ref.watch(getWalletProvider).data == null
                  //     ? SizedBox()
                  //     :
                  BalanceWidget(
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
                                widget.isFundNaira!
                                    ? Navigator.popUntil(context, (route) {
                                        route.isFirst;
                                        return route.settings.name ==
                                            CardHome.routeName;
                                      })
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
                              if (ref
                                          .watch(biometricProvider)
                                          .isPaymentBiometricActive ==
                                      null ||
                                  !ref
                                      .watch(biometricProvider)
                                      .isPaymentBiometricActive!) {
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
                                          type: widget.isFundNaira!
                                              ? "NGN"
                                              : "USD",
                                          amount:
                                              (double.parse(widget.amount!)),
                                          transactionPin: result);
                                }
                              } else {
                                if (cred?.transactionPin == null ||
                                    cred?.transactionPin == "") {
                                  final result =
                                      await buildShowModalBottomSheet(
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
                                            type: widget.isFundNaira!
                                                ? "NGN"
                                                : "USD",
                                            amount:
                                                (double.parse(widget.amount!)),
                                            transactionPin: result);
                                  }
                                } else
                                  checkBiometric(context);
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
                              if (ref
                                          .watch(biometricProvider)
                                          .isPaymentBiometricActive ==
                                      null ||
                                  !ref
                                      .watch(biometricProvider)
                                      .isPaymentBiometricActive!) {
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
                                          // address: widget.addressDetails!.address,
                                          // city: widget.addressDetails!.city,
                                          // residentState: widget
                                          //     .addressDetails!.residentState,
                                          country: widget.country!,
                                          // postalCode:
                                          //     widget.addressDetails!.postalCode,
                                          currency:
                                              widget.isNaira! ? "NGN" : "USD",
                                          bvn: widget.bvn!,
                                          brand: widget.isNaira!
                                              ? "Verve"
                                              : "MasterCard",
                                          amount: double.parse(widget.amount!),
                                          transactionPin: result);
                                }
                              } else {
                                if (cred?.transactionPin == null ||
                                    cred?.transactionPin == "") {
                                  final result =
                                      await buildShowModalBottomSheet(
                                    context,
                                    TransactionPinContainer(
                                      isData: false,
                                      isCard: !widget.isFundCard!,
                                      isFundCard: widget.isFundCard!,
                                    ),
                                  );
                                  if (result != null) {
                                    ref
                                        .read(
                                            createVirtualCardProvider.notifier)
                                        .createVirtualCard(
                                            // address: widget.addressDetails!.address,
                                            // city: widget.addressDetails!.city,
                                            // residentState: widget
                                            //     .addressDetails!.residentState,
                                            country: widget.country!,
                                            // postalCode:
                                            // widget.addressDetails!.postalCode,
                                            currency:
                                                widget.isNaira! ? "NGN" : "USD",
                                            bvn: widget.bvn!,
                                            brand: widget.isNaira!
                                                ? "Verve"
                                                : "MasterCard",
                                            amount:
                                                double.parse(widget.amount!),
                                            transactionPin: result);
                                  }
                                } else
                                  checkBiometric(context);
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
      ),
    );
  }

  double getTotalFee() {
    double fee = 0;
    if (widget.isFundCard!) {
      if (widget.isFundNaira!) {
        fee = (double.parse(widget.amount!) +
            double.parse(ref
                .watch(getAllFeesProvider)
                .data!
                .data!
                .firstWhere(
                    (element) => element.name == "naira_card_funding_fee")
                .value!) +
            double.parse(ref
                .watch(getAllFeesProvider)
                .data!
                .data!
                .firstWhere((element) =>
                    element.name == "sudo_verve_naira_card_funding_fee")
                .value!));
      } else {
        fee = ((double.parse(widget.amount!) +
                double.parse(ref
                    .watch(getAllFeesProvider)
                    .data!
                    .data!
                    .firstWhere(
                        (element) => element.name == "dollar_card_funding_fee")
                    .value!) +
                double.parse(ref
                    .watch(getAllFeesProvider)
                    .data!
                    .data!
                    .firstWhere((element) =>
                        element.name == "sudo_dollar_card_funding_fee")
                    .value!)) *
            double.parse(ref
                .watch(getAllFeesProvider)
                .data!
                .data!
                .firstWhere((element) => element.name == "current_dollar_rate")
                .value!));
      }
    } else {
      if (widget.isNaira!) {
        fee = double.parse(widget.amount!);
      } else {
        fee = ((double.parse(widget.amount!)
            // +
            //     double.parse(ref
            //         .watch(getAllFeesProvider)
            //         .data!
            //         .data!
            //         .firstWhere(
            //             (element) => element.name == "dollar_card_creation_fee")
            //         .value!)) *
            // double.parse(ref
            //     .watch(getAllFeesProvider)
            //     .data!
            //     .data!
            //     .firstWhere((element) => element.name == "current_dollar_rate")
            //     .value!)
            ));
      }
    }
    return fee;
  }

  bool checkBalance() {
    bool status = false;
    if (ref.watch(getWalletProvider).data != null) {
      if (widget.isFundCard!) {
        if (widget.isFundNaira!) {
          if (double.parse(ref.watch(getWalletProvider).data!.data!.balance!) >=
              (double.parse(widget.amount!) +
                  double.parse(ref
                      .watch(getAllFeesProvider)
                      .data!
                      .data!
                      .firstWhere(
                          (element) => element.name == "naira_card_funding_fee")
                      .value!) +
                  double.parse(ref
                      .watch(getAllFeesProvider)
                      .data!
                      .data!
                      .firstWhere((element) =>
                          element.name == "sudo_verve_naira_card_funding_fee")
                      .value!))) {
            status = true;
          } else {
            status = false;
          }
        } else {
          if (double.parse(ref.watch(getWalletProvider).data!.data!.balance!) >=
              ((double.parse(widget.amount!) +
                      double.parse(ref
                          .watch(getAllFeesProvider)
                          .data!
                          .data!
                          .firstWhere((element) =>
                              element.name == "dollar_card_funding_fee")
                          .value!) +
                      double.parse(ref
                          .watch(getAllFeesProvider)
                          .data!
                          .data!
                          .firstWhere((element) =>
                              element.name == "sudo_dollar_card_funding_fee")
                          .value!)) *
                  double.parse(ref
                      .watch(getAllFeesProvider)
                      .data!
                      .data!
                      .firstWhere(
                          (element) => element.name == "current_dollar_rate")
                      .value!))) {
            status = true;
          } else {
            status = false;
          }
        }
      } else {
        if (widget.isNaira!) {
          if (double.parse(ref.watch(getWalletProvider).data!.data!.balance!) >=
              (double.parse(widget.amount!) +
                  double.parse(ref
                      .watch(getAllFeesProvider)
                      .data!
                      .data!
                      .firstWhere((element) =>
                          element.name == "naira_card_creation_fee")
                      .value!) +
                  int.parse(ref
                      .watch(getAllFeesProvider)
                      .data!
                      .data!
                      .firstWhere((element) =>
                          element.name == "sudo_verve_naira_card_creation_fee")
                      .value!) +
                  int.parse(ref
                      .watch(getAllFeesProvider)
                      .data!
                      .data!
                      .firstWhere(
                          (element) => element.name == "naira_card_funding_fee")
                      .value!) +
                  double.parse(ref
                      .watch(getAllFeesProvider)
                      .data!
                      .data!
                      .firstWhere((element) =>
                          element.name == "sudo_verve_naira_card_funding_fee")
                      .value!))) {
            status = true;
          } else {
            status = false;
          }
        } else {
          if (double.parse(ref.watch(getWalletProvider).data!.data!.balance!) >=
              ((double.parse(widget.amount!) +
                      double.parse(ref
                          .watch(getAllFeesProvider)
                          .data!
                          .data!
                          .firstWhere((element) =>
                              element.name == "dollar_card_creation_fee")
                          .value!) +
                      double.parse(ref
                          .watch(getAllFeesProvider)
                          .data!
                          .data!
                          .firstWhere((element) =>
                              element.name == "sudo_dollar_card_creation_fee")
                          .value!) +
                      double.parse(ref
                          .watch(getAllFeesProvider)
                          .data!
                          .data!
                          .firstWhere((element) =>
                              element.name == "dollar_card_funding_fee")
                          .value!) +
                      double.parse(ref
                          .watch(getAllFeesProvider)
                          .data!
                          .data!
                          .firstWhere((element) =>
                              element.name == "sudo_dollar_card_funding_fee")
                          .value!)) *
                  double.parse(ref
                      .watch(getAllFeesProvider)
                      .data!
                      .data!
                      .firstWhere(
                          (element) => element.name == "current_dollar_rate")
                      .value!))) {
            status = true;
          } else {
            status = false;
          }
        }
      }

      return status;
    } else {
      return status;
    }
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
      widget.isFundCard!
          ? ref.read(fundVirtualCardProvider.notifier).fundVirtualCard(
              type: widget.isFundNaira! ? "NGN" : "USD",
              amount: (double.parse(widget.amount!)),
              transactionPin: cred!.transactionPin!)
          : ref.read(createVirtualCardProvider.notifier).createVirtualCard(
              // address: widget.addressDetails!.address,
              // city: widget.addressDetails!.city,
              // residentState: widget.addressDetails!.residentState,
              country: widget.country!,
              // postalCode: widget.addressDetails!.postalCode,
              currency: widget.isNaira! ? "NGN" : "USD",
              bvn: widget.bvn!,
              brand: widget.isNaira! ? "Verve" : "MasterCard",
              amount: double.parse(widget.amount!),
              transactionPin: cred!.transactionPin!);
    }
  }
}

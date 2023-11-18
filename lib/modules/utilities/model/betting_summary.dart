import 'package:Pouchers/app/common/credentials.dart';
import 'package:Pouchers/app/common/model.dart';
import 'package:Pouchers/app/helpers/session_manager.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/onboarding/screens/guest_widget.dart';
import 'package:Pouchers/modules/onboarding/screens/pay_card.dart';
import 'package:Pouchers/modules/onboarding/screens/pay_ussd.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:Pouchers/modules/utilities/screens/webview_page.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class BettingSummary extends ConsumerStatefulWidget {
  const BettingSummary(
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
  ConsumerState<BettingSummary> createState() => _RechargeSummaryState();
}

class _RechargeSummaryState extends ConsumerState<BettingSummary> {
  String _payWith = payWithCard;
  bool? _canCheckBiometrics;
  bool isAuth = false;
  UserCredentials? cred;
  int failedAttempts = 0;

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
    print(ref.watch(biometricProvider).isPaymentBiometricActive);
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
              : Consumer(builder: (context, ref, _) {
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
                                    .isPaymentBiometricActive!) {
                              final result = await buildShowModalBottomSheet(
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
                                                    widget.threshold ?? "0") <=
                                                double.parse(widget.amount)
                                            ? true
                                            : false,
                                        subCategory: widget.billerName,
                                        transactionPin: result,
                                        category: "betting-purchase",
                                        then: () {
                                          ref
                                              .read(getWalletProvider.notifier)
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
                                final result = await buildShowModalBottomSheet(
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
                                          category: "betting-purchase",
                                          then: () {
                                            ref
                                                .read(
                                                    getWalletProvider.notifier)
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
        ],
      ),
    );
  }

  Future<void> _incrementFailedAttempts() async {
    setState(() {
      failedAttempts++;
    });
    SessionManager.setFailedAttempt(failedAttempts);
  }

  Future<void> _resetFailedAttempts() async {
    setState(() {
      failedAttempts = 0;
    });
    SessionManager.setFailedAttempt(failedAttempts);
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
      ref.read(buyUtilitiesProvider.notifier).buyUtilities(
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
          category: "betting-purchase",
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
          error: (val) => showErrorBar(context, val));
    } else {
      if (failedAttempts >= 3) {
        final result = await buildShowModalBottomSheet(
          context,
          TransactionPinContainer(
            isData: false,
            isCard: false,
            isFundCard: false,
          ),
        );
        if (result != null) {
          ref.read(buyUtilitiesProvider.notifier).buyUtilities(
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
              transactionPin: result,
              category: "betting-purchase",
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
              error: (val) => showErrorBar(context, val));
        }
      } else {
        print('authentication failed');
      }
    }
  }
}

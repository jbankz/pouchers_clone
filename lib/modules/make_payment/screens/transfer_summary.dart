import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:Pouchers/app/common/credentials.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/common/model.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/make_payment/screens/transfer_success.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';


class TransferSummary extends ConsumerStatefulWidget {
  static const String routeName = "transferSummary";
  final String? transferName, accNo, amount, beneficiary;
  final double? fee;

  const TransferSummary(
      {Key? key,
      this.fee,
      this.amount,
      this.accNo,
      this.transferName,
      this.beneficiary})
      : super(key: key);

  @override
  ConsumerState<TransferSummary> createState() => _TransferSummaryState();
}

class _TransferSummaryState extends ConsumerState<TransferSummary> {


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
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: transferMoney,
        child: ListenerPage(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      confirmation,
                      style: textTheme.subtitle1!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AirtimeRow(
                            textTheme: textTheme,
                            text: amountText,
                            isCopyIcon: false,
                            noSymbol: false,
                            isNaira: true,
                            subText: widget.amount!,
                            style: textTheme.headline4!.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: kMacroPadding,
                          ),
                          AirtimeRow(
                            textTheme: textTheme,
                            text: transferFee,
                            subText: "${widget.fee}",
                            isCopyIcon: false,
                            noSymbol: false,
                            isNaira: true,
                            style: textTheme.headline4!.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: kMacroPadding,
                          ),
                          AirtimeRow(
                            textTheme: textTheme,
                            text: bankName,
                            subText: widget.transferName!,
                            noSymbol: true,
                            isCopyIcon: false,
                            style: textTheme.headline4!.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: kMacroPadding,
                          ),
                          AirtimeRow(
                            textTheme: textTheme,
                            text: accNumber,
                            subText: widget.accNo!,
                            noSymbol: true,
                            isCopyIcon: false,
                            style: textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: kMacroPadding,
                          ),
                          AirtimeRow(
                            textTheme: textTheme,
                            text: total,
                            subText: "${double.parse(widget.amount!) + widget.fee!.toDouble()}",
                            isCopyIcon: false,
                            noSymbol: false,
                            isNaira: true,
                            isBold: true,
                            style: textTheme.headline4!.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 16),
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
                            TextSpan(
                                text: "${double.parse(widget.amount!) + widget.fee!.toDouble()}",
                                style: textTheme.headline3!.copyWith(
                                    color: kPrimaryTextColor,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: debitText4, style: textTheme.headline3),
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kMediumPadding,
              ),
              Consumer(builder: (context, ref, _) {
                ref.listen(localBankTransferProvider,
                    (previous, NotifierState<LocalTransferResponse> next) {
                  if (next.status == NotifierStatus.done) {
                    pushTo(
                        context,
                        TransferSuccess(
                            text: "bank",
                            isRequest: false,
                            typeOfTransfer: "localBank",
                            amount: next.data!.data!.transactionAmount,
                            accNo: next.data!.data!.receiverAccountNumber,
                            senderName: next.data!.data!.senderName,
                            transferName: widget.transferName,
                            transactionFee: next.data!.data!.transactionFee,
                            beneficiary: next.data!.data!.receiverName,));
                  } else if (next.status == NotifierStatus.error) {
                    showErrorBar(context, next.message ?? "Error");
                  }
                });
                var _widget = LargeButton(
                    title: transfer.substring(0, 8),
                    onPressed: () async {
    if (cred?.transactionPin == null ||
    cred?.transactionPin == "") {
      final result = await buildShowModalBottomSheet(
            context,
            TransactionPinContainer(
              isData: false,
              isCard: false,
              isFundCard: false,
              isTransfer: true,
            ));
      if (result != null) {
          ref
              .read(localBankTransferProvider.notifier)
              .localBankTransfer(
              accountNumber: widget.accNo!,
              bankName: widget.transferName!,
              amount: widget.amount!,
              transactionPin: result);
      }
    }else{
      checkBiometric(context);
    }

                    });
                return ref.watch(localBankTransferProvider).when(
                      done: (data) => _widget,
                      loading: () => SpinKitDemo(),
                      error: (val) => _widget,
                    );
              })
            ],
          ),
        ));
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
      ref
          .read(localBankTransferProvider.notifier)
          .localBankTransfer(
          accountNumber: widget.accNo!,
          bankName: widget.transferName!,
          amount: widget.amount!,
          transactionPin: cred!.transactionPin!);

    }
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:pouchers/modules/make_payment/screens/transfer_success.dart';
import 'package:pouchers/modules/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class TransferSummary extends StatelessWidget {
  static const String routeName = "transferSummary";
  final String? transferName, accNo, amount, beneficiary;

  const TransferSummary(
      {Key? key, this.amount, this.accNo, this.transferName, this.beneficiary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: transferMoney,
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
                          subText: amount!,
                          style: textTheme.headline4!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: kMacroPadding,
                        ),
                        AirtimeRow(
                          textTheme: textTheme,
                          text: transferFee,
                          subText: "53.75",
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
                          subText: transferName!,
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
                          subText: accNo!,
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
                          subText: "${double.parse(amount!) + 53.75}",
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
                              text: "${double.parse(amount!) + 53.75}",
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
              ref.listen(localBankTransferProvider, (previous, NotifierState next) {
                if(next.status == NotifierStatus.done){
                  pushTo(
                      context,
                      TransferSuccess(
                          text: "bank",
                          isRequest: false,
                          typeOfTransfer: "localBank",
                          amount: amount,
                          accNo: accNo,
                          transferName: transferName,
                          beneficiary: beneficiary));
                }else if(next.status == NotifierStatus.error){
                  showErrorBar(context, next.message ?? "Error");
                }
              });
              var _widget = LargeButton(
                  title: transfer.substring(0, 8),
                  onPressed: () {
                    buildShowModalBottomSheet(
                        context,
                        TransactionPinContainer(
                          isData: false,
                          isCard: false,
                          isFundCard: false,
                          isTransfer: true,
                          doTransfer: () {
                            pushTo(
                                context,
                                TransferSuccess(
                                    text: "bank",
                                    isRequest: false,
                                    typeOfTransfer: "localBank",
                                    amount: amount,
                                    accNo: accNo,
                                    transferName: transferName,
                                    beneficiary: beneficiary));
                            // ref
                            //     .read(localBankTransferProvider.notifier)
                            //     .localBankTransfer(
                            //       accountNumber: accNo!,
                            //       bankName: transferName!,
                            //       amount: amount!,
                            //     );
                          },
                        ));
                  });
              return ref.watch(localBankTransferProvider).when(
                    done: (data) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget,
                  );
            })
          ],
        ));
  }
}

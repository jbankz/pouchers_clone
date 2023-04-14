import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/ui_models_class.dart';
import 'package:pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';

class BuyVouchers extends ConsumerStatefulWidget {
  static const String routeName = "buyVouchers";

  const BuyVouchers({Key? key}) : super(key: key);

  @override
  ConsumerState<BuyVouchers> createState() => _BuyVouchersState();
}

class _BuyVouchersState extends ConsumerState<BuyVouchers> {
  int currentIndex = -1;
  TextEditingController amountController = TextEditingController();
  String? lastInputValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: buyVoucher,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: kRegularPadding,
              ),
              Text(
                selectAmount,
                style: textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: kRegularPadding,
              ),
              Container(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: SizeConfig.blockSizeHorizontal! / 2.5,
                  children: List.generate(
                    buyVoucherList.length,
                    (index) => inkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          amountController.text = buyVoucherList[index];
                        });
                        amountController.selection = TextSelection.fromPosition(
                            TextPosition(offset: amountController.text.length));
                      },
                      child: Stack(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: currentIndex == index
                                        ? kPrimaryColor
                                        : kLightPurple),
                                borderRadius:
                                    BorderRadius.circular(kSmallPadding),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: "₦",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: currentIndex == index
                                                ? kPrimaryColor
                                                : kSecondaryTextColor,
                                            fontSize: 18,
                                          ),
                                          children: [
                                        TextSpan(
                                          text: buyVoucherList[index],
                                          style: textTheme.bodyText1!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: currentIndex == index
                                                ? kPrimaryColor
                                                : kSecondaryTextColor,
                                          ),
                                        )
                                      ])),
                                  // SizedBox(
                                  //   height: kPadding,
                                  // ),
                                ],
                              )),
                          currentIndex == index
                              ? Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          right: kPadding, bottom: kPadding),
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: kPurpleColor,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.check,
                                        color: kPrimaryWhite,
                                        size: 12,
                                      )),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: kMicroPadding,
              ),
              TextInputNoIcon(
                textTheme: textTheme,
                text: amountText,
                hintText: enterAmount,
                controller: amountController,
                inputType: TextInputType.number,
                onChanged: (inputValue) {
                  if (inputValue!.isNotEmpty) {
                    if (lastInputValue != inputValue) {
                      lastInputValue = inputValue;
                      setState(() {
                        currentIndex = -1;
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: kLargePadding,
              ),
              Consumer(builder: (context, ref, _) {
                ref.listen(buyVoucherProvider,
                    (previous, NotifierState<String> next) {
                  if (next.status == NotifierStatus.done) {
                    ref.read(getWalletProvider.notifier).getWalletDetails();
                    pushReplacementTo(
                      context,
                      VoucherSuccessful(
                        amount: amountController.text,
                        voucherCode: next.data!,
                        message: voucherSuccess,
                      ),
                    );
                  } else if (next.status == NotifierStatus.error) {
                    showErrorBar(context, next.message ?? "");
                  }
                });
                var _widget = LargeButton(
                  title: buyVoucher1,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (amountController.text.isEmpty && currentIndex == -1) {
                      showErrorBar(context, "Please Input an amount");
                    } else {
                      print(amountController.text);
                      var result = await buildShowModalBottomSheet(
                          context,
                          TransactionPinContainer(
                            isData: false,
                            isCard: false,
                            isFundCard: false,
                            isBuyVoucher: true,
                          ));
                      if (result != null) {
                        ref.read(buyVoucherProvider.notifier).buyVoucher(
                            amount: amountController.text,
                            transactionPin: result);
                      }
                    }
                  },
                );
                return ref.watch(buyVoucherProvider).when(
                    done: (done) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget);
              })
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class BuyVouchers extends StatefulWidget {
  static const String routeName = "buyVouchers";

  const BuyVouchers({Key? key}) : super(key: key);

  @override
  State<BuyVouchers> createState() => _BuyVouchersState();
}

class _BuyVouchersState extends State<BuyVouchers> {
  int currentIndex = -1;
  TextEditingController amountController = TextEditingController();

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
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: currentIndex == index
                                    ? kPrimaryColor
                                    : kLightPurple),
                            borderRadius: BorderRadius.circular(kSmallPadding),
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
                              SizedBox(
                                height: kPadding,
                              ),
                              currentIndex == index
                                  ? Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                          margin:
                                              EdgeInsets.only(right: kPadding),
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: kPurpleColor,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                            Icons.check,
                                            color: kPrimaryWhite,
                                            size: 10,
                                          )),
                                    )
                                  : SizedBox()
                            ],
                          )),
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
              ),
              SizedBox(
                height: kLargePadding,
              ),
              LargeButton(
                title: buyVoucher1,
                onPressed: () {
                  if (amountController.text.isEmpty && currentIndex == -1) {
                    showErrorBar(context, "Please Input an amount");
                  } else {
                    buildShowModalBottomSheet(
                        context,
                        TransactionPinContainer(
                          isData: false,
                          isCard: false,
                          isFundCard: false,
                          isBuyVoucher: true,
                        ));
                  }
                },
              )
            ],
          ),
        ));
  }
}

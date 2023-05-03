import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:Pouchers/app/common/credentials.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/common/model.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/constant/ui_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

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
        title: buyVoucher,
        child: ListenerPage(
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
                        if (
                        ref.watch(biometricProvider).isPaymentBiometricActive == null || !ref.watch(biometricProvider).isPaymentBiometricActive!
                        ) {
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
                        } else {
                          if(cred?.transactionPin == null || cred?.transactionPin == ""){
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
                          }else
                          checkBiometric(context);
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
      ref.read(buyVoucherProvider.notifier).buyVoucher(
          amount: amountController.text, transactionPin: cred!.transactionPin!);
    }
  }
}

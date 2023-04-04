import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/account/screens/two_factor_auth/copy_code.dart';
import 'package:pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:pouchers/modules/onboarding/screens/welcome_guest.dart';
import 'package:pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class PayWithUssd extends ConsumerStatefulWidget {
  static const String routeName = "payWithUssd";
  final String? cardNumber,
      subCat,
      category,
      amount,
      name,
      email,
      providerId,
      merchantService,
      serviceId;
  final bool? isUtility;

  PayWithUssd(
      {Key? key,
      this.cardNumber,
      this.category,
      this.subCat,
      this.amount,
      this.name,
      this.email,
      this.isUtility = false,
      this.providerId,
      this.merchantService,
      this.serviceId})
      : super(key: key);

  @override
  ConsumerState<PayWithUssd> createState() => _PayWithUssdState();
}

class _PayWithUssdState extends ConsumerState<PayWithUssd> {
  String? selectedBank;

  // List<String> banks = ["Access", "UBA", "Sterling"];
  GetAllBanksResponseData? _selectedBank;
  List<GetAllBanksResponseData> banks = [];
  String? referenceNo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getAllBanksProvider.notifier).getAllBanks();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: payWithUssd,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: kSmallPadding,
                ),
                Image.asset(
                  AssetPaths.ussdImage,
                  height: kSupremePadding,
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                Consumer(builder: (context, ref, _) {
                  ref.listen(getAllBanksProvider,
                      (previous, NotifierState<GetAllBanksResponse> next) {
                    if (next.status == NotifierStatus.error) {
                      showErrorBar(context, next.message ?? "");
                    }
                  });
                  var _widget = Container(
                    padding: EdgeInsets.symmetric(horizontal: kSmallPadding),
                    height: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kSmallPadding),
                        color: kBackgroundColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectBankText,
                          style: textTheme.subtitle1!
                              .copyWith(color: kPrimaryTextColor),
                        ),
                        SpinKitDemo(
                          size: kMicroPadding,
                        )
                      ],
                    ),
                  );
                  return ref.watch(getAllBanksProvider).when(
                        done: (data) {
                          if (data != null) {
                            data.data.forEach((element) {
                              banks.add(element);
                            });
                            var seen = Set<String>();
                            List<GetAllBanksResponseData> uniquelist = banks
                                .where((bank) => seen.add(bank.name))
                                .toList();
                            return FormDropdown<GetAllBanksResponseData>(
                                hint: selectBankText,
                                value: _selectedBank,
                                onChanged: (GetAllBanksResponseData? val) {
                                  setState(() => _selectedBank = val);
                                  print("selected bank$_selectedBank");
                                  print(widget.isUtility);
                                  widget.isUtility!
                                      ? ref
                                          .read(
                                              guestUtilityUssdProvider.notifier)
                                          .guestUtilityUssd(
                                              subCategory: widget.subCat!,
                                              amount:
                                                  double.parse(widget.amount!),
                                              name: widget.name,
                                              email: widget.email,
                                              category: widget.category!,
                                              merchantAccount:
                                                  widget.providerId!,
                                              merchantService: [
                                                widget.merchantService!
                                              ],
                                              merchantReferenceNumber:
                                                  widget.cardNumber!,
                                              bank: _selectedBank!.name,
                                              error: (val) =>
                                                  showErrorBar(context, val))
                                      : ref
                                          .read(guestUssdProvider.notifier)
                                          .guestUssd(
                                            subCategory: widget.subCat!,
                                            amount: widget.amount!,
                                            name: widget.name,
                                            email: widget.email,
                                            category: widget.category!,
                                            mobileOperatorServiceId:
                                                widget.serviceId,
                                            bank: _selectedBank!.name,
                                            destinationPhoneNumber:
                                                widget.cardNumber!,
                                            mobileOperatorPublicId:
                                                widget.providerId!,
                                            isAirtime: widget.category!
                                                    .contains("airtime")
                                                ? true
                                                : false,
                                          );
                                },
                                items: uniquelist
                                    .map((e) => DropdownMenuItem<
                                            GetAllBanksResponseData>(
                                          child: Text(e.name),
                                          value: e,
                                        ))
                                    .toList());
                          } else {
                            return _widget;
                          }
                        },
                        loading: () => _widget,
                        error: (val) => FormDropdown<GetAllBanksResponseData>(
                          hint: selectBankText,
                          value: _selectedBank,
                          onChanged: null,
                          items: const [],
                        ),
                      );
                }),
                SizedBox(
                  height: kLargePadding,
                ),
                _selectedBank == null
                    ? SizedBox()
                    : widget.isUtility!
                        ? ref.watch(guestUtilityUssdProvider).when(
                            done: (done) {
                              if (done != null) {
                                referenceNo = done.data!.referenceNumber;
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kMicroPadding,
                                          vertical: kRegularPadding),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(300),
                                          color: kBackgroundColor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: kSecondaryPurple,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${done.data!.paymentMethods![0].properties!.ussdShortCode}",
                                              style: textTheme.headline2!
                                                  .copyWith(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: kSecondaryPurple),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: kRegularPadding,
                                    ),
                                    inkWell(
                                      onTap: () {
                                        _makePhoneCall(
                                            "${done.data!.paymentMethods![0].properties!.ussdShortCode}");
                                      },
                                      child: Text(
                                        tapCode,
                                        style: textTheme.headline4!,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                            loading: ()  {
                              print("loading");
                              return SpinKitDemo();},
                            error: (val) => SizedBox())
                        : ref.watch(guestUssdProvider).when(
                            done: (done) {
                              if (done != null) {
                                referenceNo = done.data!.referenceNumber;
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kMicroPadding,
                                          vertical: kRegularPadding),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(300),
                                          color: kBackgroundColor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: kSecondaryPurple,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${done.data!.paymentMethods![0].properties!.ussdShortCode}",
                                              style: textTheme.headline2!
                                                  .copyWith(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: kSecondaryPurple),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: kRegularPadding,
                                    ),
                                    inkWell(
                                      onTap: () {
                                        _makePhoneCall(
                                            "${done.data!.paymentMethods![0].properties!.ussdShortCode}");
                                      },
                                      child: Text(
                                        tapCode,
                                        style: textTheme.headline4!,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                            loading: () => SpinKitDemo(),
                            error: (val) => SizedBox()),
                SizedBox(
                  height: _selectedBank == null ? kSmallPadding : kFullPadding,
                ),
                CopyCodeRow(
                  textTheme: textTheme,
                  text: dialCode,
                  color: kIconGrey,
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                CopyCodeRow(
                  textTheme: textTheme,
                  text: dialCode2,
                  color: kIconGrey,
                ),
              ],
            ),
          ),
          Consumer(builder: (context, ref, _) {
            var _widget = LargeButton(
                title: continueText,
                disableColor:
                    referenceNo == null ? kPurpleColor100 : kPrimaryColor,
                onPressed: referenceNo == null
                    ? () {
                        showErrorBar(context, "Please select a bank");
                      }
                    : () {
                        ref
                            .read(checkStatusProvider.notifier)
                            .checkPaymentStatus(
                                reference: referenceNo!,
                                then: (val) {
                                  val == "1"
                                      ? showErrorBar(
                                          context, "Payment is Pending")
                                      : val == "-1"
                                          ? showErrorBar(
                                              context, "Payment Failed")
                                          : SuccessMessage(
                                              text: rechargeSuccessful,
                                              subText: rechargeSuccessfulSub,
                                              onTap: () {
                                                Navigator.popUntil(
                                                    context,
                                                    (route) =>
                                                        route.settings.name ==
                                                        WelcomeGuest.routeName);
                                              });
                                });
                      });
            return ref.watch(checkStatusProvider).when(
                done: (done) => _widget,
                loading: () => SpinKitDemo(),
                error: (val) => _widget);
          })
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}

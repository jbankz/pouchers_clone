import 'dart:async';

import 'package:Pouchers/modules/utilities/model/betting_summary.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/modules/account/models/buy_cable_class.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/onboarding/screens/guest_widget.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/constant/ui_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

import '../../../utils/utils.dart';

class Betting extends ConsumerStatefulWidget {
  static const String routeName = "betting";
  final bool? isGuest;

  const Betting({Key? key, this.isGuest}) : super(key: key);

  @override
  ConsumerState<Betting> createState() => _BettingState();
}

class _BettingState extends ConsumerState<Betting> {
  bool _saveBeneficiary = false;
  TextEditingController contactController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String _amount = "";
  GetUtilitiesData? utilitiesData;
  int currentIndex = -1;
  String? lastInputValue;
  List<GetUtilitiesData> utilities = [];
  List<Service> utilitiesType = [];
  String? threshold;
  Service? paymentType;

  String error = "";

  Timer? _debounce;

  _onChangeHandler(value) {
    if (value!.isEmpty) {
      setState(() => contactController.text = "");
    } else {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        search(value);
      });
    }
  }

  search(value) {
    if (utilitiesData != null && contactController.text.isNotEmpty) {
      ref.read(validateUtilitiesProvider.notifier).validateUtilities(
          merchantAccount: utilitiesData!.operatorpublicid!,
          merchantReferenceNumber: contactController.text,
          merchantProductCode: utilitiesData!.categoryid ?? "",
          category: utilitiesData!.category!);
    } else {
      showErrorBar(context, "Please choose a provider or account ID");
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getUtilitiesProvider.notifier).getUtilities(utility: "betting");
      ref.read(getDiscountProvider.notifier).getDiscount(utility: "betting");
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: betting,
      child: widget.isGuest!
          ? bettingColumn(context, textTheme)
          : ListenerPage(
              child: bettingColumn(context, textTheme),
            ),
    );
  }

  Column bettingColumn(BuildContext context, TextTheme textTheme) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inkWell(
                  onTap: () async {
                    final result = await buildShowModalBottomSheet(
                        context, UtilityModal(utilities: utilities));
                    if (result != null) {
                      setState(() {
                        utilitiesData = result;
                      });
                      // search("");
                      ref
                          .read(getUtilitiesTypeProvider.notifier)
                          .getUtilitiesType(
                              merchantServiceId:
                                  utilitiesData!.operatorpublicid!,
                              categoeyName: utilitiesData!.category!);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: kRegularPadding),
                    decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(kSmallPadding)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: kMediumPadding),
                          child: Text(
                              utilitiesData == null
                                  ? selectProvider
                                  : utilitiesData!.name!,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: utilitiesData == null
                                  ? textTheme.bodyText1!.copyWith(
                                      color:
                                          kSecondaryTextColor.withOpacity(0.7),
                                      fontWeight: FontWeight.w300,
                                    )
                                  : textTheme.subtitle1),
                        )),
                        Consumer(builder: (context, ref, _) {
                          var _widget = Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: kSecondaryTextColor,
                          );
                          return ref.watch(getUtilitiesProvider).when(
                                done: (data) {
                                  if (data != null) {
                                    utilities = data.data!;
                                  }
                                  return _widget;
                                },
                                loading: () => SpinKitDemo(
                                  size: 25,
                                ),
                                error: (val) => _widget,
                              );
                        })
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: kMicroPadding,
                ),
                // Text(
                //   "Account type",
                //   style: textTheme.headline6,
                // ),
                // SizedBox(
                //   height: kSmallPadding,
                // ),
                // InkWell(
                //   onTap: (utilitiesData == null)
                //       ? null
                //       : () async {
                //     final result = await buildShowModalBottomSheet(
                //         context,
                //         SubscriptionModal(
                //             paymentItem: utilitiesType,
                //             // discountValue: discountValue ?? "0",
                //             threshold: threshold??"0"));
                //     if (result != null) {
                //       setState(() => paymentType = result);
                //       // search("");
                //     }
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: kRegularPadding),
                //     decoration: BoxDecoration(
                //         color: kBackgroundColor,
                //         borderRadius: BorderRadius.circular(kSmallPadding)),
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Padding(
                //             padding:
                //             EdgeInsets.symmetric(vertical: kMediumPadding),
                //             child: Row(
                //               children: [
                //                 Expanded(
                //                   child: Text(
                //                       paymentType == null
                //                           ? type
                //                           : paymentType!.name!,
                //                       overflow: TextOverflow.ellipsis,
                //                       softWrap: true,
                //                       style: paymentType == null
                //                           ? textTheme.bodyText1!.copyWith(
                //                         color: kSecondaryTextColor
                //                             .withOpacity(0.7),
                //                         fontWeight: FontWeight.w300,
                //                       )
                //                           : textTheme.subtitle1),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //         Consumer(builder: (context, ref, _) {
                //           var _widget = Row(
                //             children: [
                //               paymentType == null
                //                   ? SizedBox()
                //                   : RichText(
                //                 text: TextSpan(
                //                   text: "₦",
                //                   style: TextStyle(
                //                     color: kPrimaryTextColor,
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: 18,
                //                   ),
                //                   children: [
                //                     TextSpan(
                //                         text: kPriceFormatter(paymentType!
                //                             .price!
                //                             .toDouble())
                //                             .replaceAll(".00", ""),
                //                         style: textTheme.subtitle1)
                //                   ],
                //                 ),
                //               ),
                //               Icon(
                //                 Icons.keyboard_arrow_down,
                //                 size: 30,
                //                 color: kSecondaryTextColor,
                //               ),
                //             ],
                //           );
                //           return ref.watch(getUtilitiesTypeProvider).when(
                //             done: (data) {
                //               if (data != null) {
                //                 utilitiesType = data.data!.services!;
                //               }
                //               return _widget;
                //             },
                //             loading: () {
                //               return SpinKitDemo(
                //                 size: 25,
                //               );
                //             },
                //             error: (val) => _widget,
                //           );
                //         }),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: kMicroPadding,
                // ),
                TextInputNoIcon(
                  textTheme: textTheme,
                  text: accountId,
                  controller: contactController,
                  hintText: "Enter $accountId",
                  inputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: _onChangeHandler,
                  icon: inkWell(
                    onTap: () async {
                      final PhoneContact contact =
                          await FlutterContactPicker.pickPhoneContact();
                      setState(() {
                        contactController.text = contact.phoneNumber!.number!;
                      });
                      contactController.selection = TextSelection.fromPosition(
                          TextPosition(offset: contactController.text.length));
                    },
                    child: SvgPicture.asset(
                      AssetPaths.contactBook,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                ref.watch(validateUtilitiesProvider).when(done: (done) {
                  if (done != null) {
                    error = "";
                    return Row(
                      children: [
                        Text(
                          done,
                          style: textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    );
                  } else
                    return SizedBox();
                }, loading: () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SpinKitThreeBounce(
                        color: kPrimaryColor,
                        size: 15.0,
                      ),
                    ],
                  );
                }, error: (val) {
                  error = val ?? "";
                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                          val ?? "",
                          style: textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: kColorRed),
                        ),
                      )
                    ],
                  );
                }),
                ref.watch(getDiscountProvider).when(
                    loading: () {
                      return SpinKitDemo();
                    },
                    error: (val) => SizedBox(),
                    done: (done) {
                      if (done != null) {
                        threshold = done.data!.threshold ?? "0";
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              topDeal,
                              style: textTheme.headline3,
                            ),
                            SizedBox(
                              height: kSmallPadding,
                            ),
                            GridView.count(
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              childAspectRatio:
                                  SizeConfig.blockSizeHorizontal! / 3.4,
                              children: List.generate(
                                guestList.length,
                                (index) => Column(
                                  children: [
                                    inkWell(
                                      onTap: () {
                                        widget.isGuest!
                                            ? buildShowModalBottomSheet(
                                                context, GuestDiscountModal())
                                            : setState(() {
                                                currentIndex = index;
                                                amountController.text =
                                                    guestList[index].icon;
                                                _amount = guestList[index].icon;
                                              });
                                        amountController.selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: amountController
                                                        .text.length));
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: kLightPurple),
                                              color: currentIndex == index
                                                  ? kLightPurple
                                                  : kTransparent,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kSmallPadding)),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.all(kPadding),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        kSmallPadding),
                                                    topLeft: Radius.circular(
                                                        kSmallPadding),
                                                  ),
                                                  color: kPurpleColor,
                                                ),
                                                child:
                                                    done.data!.threshold == null
                                                        ? Text(
                                                            "0% cashback",
                                                            style: textTheme
                                                                .headline4!
                                                                .copyWith(
                                                              color:
                                                                  kLightPurple,
                                                            ),
                                                          )
                                                        : Text(
                                                            double.parse(done
                                                                        .data!
                                                                        .threshold!) <=
                                                                    double.parse(
                                                                        guestList[index]
                                                                            .icon)
                                                                ? "${done.data!.discountValue}% cashback"
                                                                : "0% cashback",
                                                            style: textTheme
                                                                .headline4!
                                                                .copyWith(
                                                              color:
                                                                  kLightPurple,
                                                            ),
                                                          ),
                                              ),
                                              SizedBox(
                                                height: kSmallPadding,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: "₦",
                                                  style: TextStyle(
                                                    color: kPrimaryTextColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          guestList[index].icon,
                                                      style: textTheme
                                                          .subtitle1!
                                                          .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: kRegularPadding,
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
                SizedBox(
                  height: kSmallPadding,
                ),
                Text(
                  amountText,
                  style: textTheme.headline6,
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
                    cursorColor: kPrimaryColor,
                    controller: amountController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val != null || val!.isNotEmpty) if (val
                          .startsWith("0")) {
                        return "Amount cannot start with zero";
                      } else
                        return null;
                    },
                    onChanged: (val) {
                      if (val.isNotEmpty) {
                        if (lastInputValue != val) {
                          lastInputValue = val;
                          setState(() {
                            currentIndex = -1;
                          });
                        }
                      }
                      setState(() {
                        _amount = val;
                        amountController.text = val;
                      });
                      amountController.selection = TextSelection.fromPosition(
                        TextPosition(offset: amountController.text.length),
                      );
                    },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      hintText: enterAmount,
                      hintStyle: textTheme.headline6!.copyWith(
                          color: kSecondaryTextColor.withOpacity(0.7),
                          fontSize: 18),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: kSmallPadding),
                        child: Align(
                          widthFactor: 0,
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "₦  ",
                              style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      fillColor: kBackgroundColor,
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(kSmallPadding),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(kSmallPadding),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kSmallPadding),
                        borderSide: BorderSide(color: kColorRed),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kSmallPadding),
                        borderSide: BorderSide(color: kColorRed),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: kLargePadding,
        ),
        LargeButton(
          title: continueText,
          disableColor: (amountController.text.isEmpty ||
                  _amount.isEmpty ||
                  utilitiesData == null ||
                  contactController.text.isEmpty ||
                  _amount.startsWith("0")
              // || error.isNotEmpty
              )
              ? kPurpleColor100
              : kPrimaryColor,
          outlineButton: false,
          onPressed: amountController.text.isEmpty ||
                  _amount.isEmpty ||
                  utilitiesData == null ||
                  contactController.text.isEmpty ||
                  // error.isNotEmpty ||

                  _amount.startsWith("0")
              ? () {}
              : () {
                  if (double.parse(amountController.text) > 10000 &&
                      widget.isGuest!) {
                    buildShowModalBottomSheet(
                        context, GuestMaximumAmountModal());
                  } else {
                    buildShowModalBottomSheet(
                        context,
                        widget.isGuest!
                            ? GuestRechargeSummary(
                                textTheme: textTheme,
                                purchaseDelivered: true,
                              )
                            : BettingSummary(
                                textTheme: textTheme,
                                amount: amountController.text,
                                recipientNo: contactController.text,
                                billerName: utilitiesData!.name!,
                                billerId: utilitiesData!.operatorpublicid!,
                                billerCode: utilitiesType[0].code,
                                category: "betting-purchase",
                                utility: true,
                                billerLogo: "",
                                threshold: threshold,
                              ));
                  }
                },
        )
      ],
    );
  }
}

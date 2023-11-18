import 'dart:async';

import 'package:Pouchers/modules/utilities/model/education_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/buy_cable_class.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/onboarding/screens/guest_widget.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';

import '../providers/utilities_provider.dart';

class BuyEducation extends ConsumerStatefulWidget {
  static const String routeName = "buyEducation";
  final bool? isGuest;
  final String? name, email;

  const BuyEducation({Key? key, this.isGuest, this.name, this.email})
      : super(key: key);

  @override
  ConsumerState<BuyEducation> createState() => _BuyElectricityState();
}

class _BuyElectricityState extends ConsumerState<BuyEducation> {
  bool _saveBeneficiary = false;
  TextEditingController acctController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  GetUtilitiesData? utilitiesData;
  List<GetUtilitiesData> utilities = [];
  String _amount = "";
  String amoutString = "";
  List<Service> utilitiesType = [];
  Service? paymentType;
  String? threshold;
  String? discountValue;

  Timer? searchOnStoppedTyping;
  String error = "";

  // _onChangeHandler(value) {
  //   if (value!.isEmpty) {
  //     setState(() => _acctNo = "");
  //   } else {
  //     setState(() {
  //       _acctNo = value;
  //     });
  //     const duration = Duration(
  //         seconds:
  //             1); // set the duration that you want call search() after that.
  //     if (searchOnStoppedTyping != null) {
  //       setState(() => searchOnStoppedTyping!.cancel()); // clear timer
  //     }
  //     setState(() => searchOnStoppedTyping = new Timer(duration, () {
  //           FocusScope.of(context).unfocus();
  //           search(value);
  //         }));
  //   }
  // }
  //
  // search(value) {
  //   if (utilitiesData != null && paymentType != null) {
  //     ref.read(validateUtilitiesProvider.notifier).validateUtilities(
  //         merchantAccount: utilitiesData!.operatorpublicid!,
  //         merchantReferenceNumber: "yyuu",
  //         merchantProductCode: paymentType!.code!,
  //         category: utilitiesData!.category!);
  //   } else {
  //     showErrorBar(context, "Please choose a provider, type or meter number");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // amountController.text = paymentType?.price != null? paymentType!.price.toString() :"";
      ref
          .read(getUtilitiesProvider.notifier)
          .getUtilities(utility: "education");
      ref.read(getDiscountProvider.notifier).getDiscount(utility: "education");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: education,
      child: widget.isGuest!
          ? educationColumn(context, textTheme)
          : ListenerPage(child: educationColumn(context, textTheme)),
    );
  }

  Column educationColumn(BuildContext context, TextTheme textTheme) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              //selsct a provider
              inkWell(
                onTap: () async {
                  //selsct a provider endpoint
                  final result = await buildShowModalBottomSheet(
                      context, UtilityModal(utilities: utilities));
                  if (result != null) {
                    setState(() {
                      utilitiesData = result;
                      paymentType = null;
                    });
                    // search("");
                    ref
                        .read(getUtilitiesTypeProvider.notifier)
                        .getUtilitiesType(
                            merchantServiceId: utilitiesData!.operatorpublicid!,
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
                        ),
                      ),
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
              ref.watch(getDiscountProvider).when(done: (done) {
                if (done != null) {
                  threshold = done.data!.threshold ?? "0";
                  discountValue = done.data!.discountValue ?? "0";
                  return SizedBox();
                } else {
                  return SizedBox();
                }
              }),
              Text(
                subscriptionType,
                style: textTheme.headline6,
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              inkWell(
                //subscription endpoint
                onTap: (utilitiesData == null)
                    ? null
                    : () async {
                        final result = await buildShowModalBottomSheet(
                            context,
                            SubscriptionModal(
                              paymentItem: utilitiesType,
                              threshold: threshold,
                              discountValue: discountValue,
                            ));
                        if (result != null) {
                          setState(() => paymentType = result);
                          amountController.text = paymentType?.price != null
                              ? paymentType!.price.toString()
                              : "";
                          // search("");
                        }
                      },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: kRegularPadding),
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(kSmallPadding)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: kMediumPadding),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                    paymentType == null
                                        ? type
                                        : paymentType!.name!,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: paymentType == null
                                        ? textTheme.bodyText1!.copyWith(
                                            color: kSecondaryTextColor
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w300,
                                          )
                                        : textTheme.subtitle1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Consumer(builder: (context, ref, _) {
                        var _widget = Row(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                              color: kSecondaryTextColor,
                            ),
                          ],
                        );
                        return ref.watch(getUtilitiesTypeProvider).when(
                              done: (data) {
                                if (data != null) {
                                  utilitiesType = data.data!.services!;
                                }
                                return _widget;
                              },
                              loading: () {
                                return SpinKitDemo(
                                  size: 25,
                                );
                              },
                              error: (val) => _widget,
                            );
                      }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: kMicroPadding,
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
                  cursorColor: kPrimaryColor,
                  controller: amountController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (val) {
                  //   if (val != null || val!.isNotEmpty) if (val
                  //       .startsWith("0")) {
                  //     return "Amount cannot start with zero";
                  //   } else
                  //     return null;
                  // },
                  // onChanged: (val) {
                  //   if (val.isEmpty) {
                  //     setState(() => paymentType!.price);
                  //   } else {
                  //     setState(() {
                  //       paymentType!.price = val.toString();
                  //     });
                  //   }
                  //   ;
                  // },
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
              SizedBox(
                height: kSmallPadding,
              ),
            ],
          ),
        ),
        SizedBox(
          height: kRegularPadding,
        ),
        // widget.isGuest! ? SizedBox() : SizedBox(),
        //  SizedBox(
        //    height: kLargePadding,
        //  ),
        Consumer(builder: (context, ref, _) {
          ref.listen(buyUtilitiesProvider,
              (previous, NotifierState<String> next) {
            if (next.status == NotifierStatus.done) {
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
                    }),
              );
            } else if (next.status == NotifierStatus.error) {
              showErrorBar(context, next.data ?? next.message!);
            }
          });
          var _widget = LargeButton(
            title: continueText,
            disableColor: (paymentType == null ||
                    utilitiesData == null ||
                    error.isNotEmpty)
                ? kBackgroundColor
                : kPrimaryColor,
            onPressed: (paymentType == null ||
                    utilitiesData == null ||
                    error.isNotEmpty)
                ? () {}
                : () {
                    FocusScope.of(context).unfocus();
                    if (paymentType!.price! > 10000 && widget.isGuest!) {
                      buildShowModalBottomSheet(
                          context, GuestMaximumAmountModal());
                    } else {
                      buildShowModalBottomSheet(
                        context,
                        EducationSummary(
                          billerName: utilitiesData!.displayName!,
                          billerId: utilitiesData!.operatorpublicid!,
                          utility: true,
                          isGuest: widget.isGuest!,
                          email: widget.email,
                          name: widget.name,
                          threshold: threshold,
                          category: "education-purchase",
                          amount: "${paymentType!.price!}",
                          billerLogo: "",
                          billerCode: paymentType!.code,
                          recipientNo: paymentType!.name!,
                          textTheme: textTheme,
                        ),
                      );
                    }
                    ;
                  },
          );
          return ref.watch(buyUtilitiesProvider).when(
                done: (data) => _widget,
                loading: () => SpinKitDemo(),
                error: (val) => _widget,
              );
        }),
      ],
    );
  }
}

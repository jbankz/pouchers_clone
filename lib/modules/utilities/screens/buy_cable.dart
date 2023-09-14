import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/buy_cable_class.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:Pouchers/modules/schedule_purchase/screens/schedule_cable_topup.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';

class BuyCable extends ConsumerStatefulWidget {
  static const String routeName = "buyCable";
  final bool? isGuest;
  final String? name, email;

  const BuyCable({Key? key, this.isGuest, this.name, this.email})
      : super(key: key);

  @override
  ConsumerState<BuyCable> createState() => _BuyCableState();
}

class _BuyCableState extends ConsumerState<BuyCable> {
  TextEditingController contactController = TextEditingController();
  bool _saveBeneficiary = false;
  GetUtilitiesData? utilitiesData;
  List<GetUtilitiesData> utilities = [];
  List<Service> utilitiesType = [];
  Service? paymentType;
  String cardNo = "";
  String? threshold;
  String? discountValue;
  String error = "";

  Timer? searchOnStoppedTyping;

  _onChangeHandler(value) {
    if (value!.isEmpty) {
      setState(() => cardNo = "");
    } else {
      setState(() {
        cardNo = value;
      });
      const duration = Duration(seconds: 1);
      if (searchOnStoppedTyping != null) {
        setState(() => searchOnStoppedTyping!.cancel()); // clear timer
      }
      setState(() => searchOnStoppedTyping = new Timer(duration, () {
            FocusScope.of(context).unfocus();
            search(value);
          }));
    }
  }

  search(value) {
    if (utilitiesData != null && cardNo.isNotEmpty && paymentType != null) {
      ref.read(validateUtilitiesProvider.notifier).validateUtilities(
          merchantAccount: utilitiesData!.operatorpublicid!,
          merchantReferenceNumber: cardNo,
          merchantProductCode: paymentType!.code!,
      category: utilitiesData!.category!);
    } else {
      showErrorBar(context, "Please choose a provider, type or card number");
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getUtilitiesProvider.notifier).getUtilities(utility: "cable");
      ref.read(getDiscountProvider.notifier).getDiscount(utility: "cable");
    });
  }

  @override
  Widget build(BuildContext context) {
    print(threshold);
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: cable,
      child: widget.isGuest!
          ? cableColumn(context, textTheme)
          : ListenerPage(child: cableColumn(context, textTheme)),
    );
  }

  Column cableColumn(BuildContext context, TextTheme textTheme) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              inkWell(
                onTap: () async {
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: kMediumPadding),
                        child: Row(
                          children: [
                            Text(
                                utilitiesData == null
                                    ? selectProvider
                                    : utilitiesData!.displayName!,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: utilitiesData == null
                                    ? textTheme.bodyText1!.copyWith(
                                        color: kSecondaryTextColor
                                            .withOpacity(0.7),
                                        fontWeight: FontWeight.w300,
                                      )
                                    : textTheme.subtitle1),
                          ],
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
                height: kMediumPadding,
              ),

              Text(
                subType,
                style: textTheme.headline6,
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              ref.watch(getDiscountProvider).when(done: (done) {
                if (done != null) {
                  threshold = (done.data!.threshold == null || done.data == null) ? "0" : done.data!.threshold;
                  discountValue = (done.data!.discountValue == null || done.data == null) ? "0" : done.data!.discountValue;
                  return SizedBox();
                } else {
                  return SizedBox();
                }
              }),
              InkWell(
                onTap: (utilitiesData == null)
                    ? null
                    : () async {
                        final result = await buildShowModalBottomSheet(
                            context,
                            SubscriptionModal(
                                paymentItem: utilitiesType,
                                discountValue: discountValue ?? "0",
                                threshold: threshold??"0"));
                        if (result != null) {
                          setState(() => paymentType = result);
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
                            paymentType == null
                                ? SizedBox()
                                : RichText(
                                    text: TextSpan(
                                      text: "₦",
                                      style: TextStyle(
                                        color: kPrimaryTextColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: kPriceFormatter(paymentType!
                                                    .price!
                                                    .toDouble())
                                                .replaceAll(".00", ""),
                                            style: textTheme.subtitle1)
                                      ],
                                    ),
                                  ),
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
              TextInputNoIcon(
                textTheme: textTheme,
                addSpace: false,
                text: cardNumber,
                read: (utilitiesData == null || paymentType == null),
                controller: contactController,
                inputType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onEditingComplete: () {
                  _onChangeHandler(contactController.text);
                },
                //onChanged: _onChangeHandler,
                icon:  inkWell(
                  onTap: utilitiesData == null && paymentType == null ? null :  () async {
                    final PhoneContact contact =
                    await FlutterContactPicker.pickPhoneContact();
                    setState(() {
                      contactController.text = contact.phoneNumber!.number!;
                    });
                  },
                  child: SvgPicture.asset(
                    AssetPaths.contactBook,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                height: kPadding,
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
                height: kMicroPadding,
              ),
              widget.isGuest!
                  ? SizedBox()
                  : Scheduling(
                      text: scheduleCable,
                      subtext: scheduleCableSub,
                      onTap: () => pushTo(
                          context,
                          ScheduleCableTopUp(
                            utility: utilitiesData,
                            paymentType: paymentType,
                            cardNo: contactController.text,
                          ),
                          settings: RouteSettings(
                              name: ScheduleCableTopUp.routeName)),
                    ),
            ],
          ),
        ),
        SizedBox(
          height: kRegularPadding,
        ),
        widget.isGuest!
            ? SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    saveBeneficiary,
                    style: textTheme.headline2!.copyWith(
                      color: kIconGrey,
                    ),
                  ),
                  FlutterSwitchClass(
                    saveBeneficiary: _saveBeneficiary,
                    onToggle: (val) {
                      setState(() {
                        _saveBeneficiary = val;
                      });
                    },
                  )
                ],
              ),
        SizedBox(
          height: kLargePadding,
        ),
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
                    cardNo == "" ||
                    utilitiesData == null ||
                    error.isNotEmpty)
                ? kBackgroundColor
                : kPrimaryColor,
            onPressed: (paymentType == null ||
                    cardNo == "" ||
                    utilitiesData == null ||
                    error.isNotEmpty)
                ? () {}
                : () {
                    buildShowModalBottomSheet(
                      context,
                      RechargeSummary(
                        billerName: utilitiesData!.displayName!,
                        billerId: utilitiesData!.operatorpublicid!,
                        utility: true,
                        amount: "${paymentType!.price!}",
                        billerLogo: "",
                        threshold: threshold,
                        name: widget.name,
                        email: widget.email,
                        category: "cable-purchase",
                        billerCode: paymentType!.code,
                        recipientNo: contactController.text,
                        textTheme: textTheme,
                        isGuest: widget.isGuest!,
                      ),
                    );
                  },
          );
          return ref.watch(buyUtilitiesProvider).when(
                done: (data) => _widget,
                loading: () => SpinKitDemo(),
                error: (val) => _widget,
              );
        })
      ],
    );
  }
}

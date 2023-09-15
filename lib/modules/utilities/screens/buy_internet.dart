import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/modules/account/models/buy_cable_class.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';

import '../providers/utilities_provider.dart';

class BuyInternet extends ConsumerStatefulWidget {
  static const String routeName = "buyInternet";
  final bool? isGuest;
  final String? name, email;

  const BuyInternet({Key? key, this.isGuest, this.name, this.email}) : super(key: key);

  @override
  ConsumerState<BuyInternet> createState() => _BuyInternetState();
}

class _BuyInternetState extends ConsumerState<BuyInternet> {
  TextEditingController contactController = TextEditingController();
  bool _saveBeneficiary = false;
  GetUtilitiesData? utilitiesData;

  List<GetUtilitiesData> utilities = [];
  List<Service> utilitiesType = [];
  Service? paymentType;
  String accId = "";
  String? threshold;
  String? discountValue;

  String error = "";

  Timer? _debounce;

  _onChangeHandler(value) {
    if (value!.isEmpty) {
      setState(() => accId = "");
    } else {
      setState(() {
        accId = value;
      });

      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        search(value);
      });
    }
  }

  search(value) {
    if (utilitiesData != null && accId.isNotEmpty && paymentType != null) {
      ref.read(validateUtilitiesProvider.notifier).validateUtilities(
          merchantAccount: utilitiesData!.operatorpublicid!,
          merchantReferenceNumber: accId, merchantProductCode: paymentType!.code!,
          category: utilitiesData!.category!);
    } else {
      showErrorBar(context, "Please choose a provider, type or account ID");
    }
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getUtilitiesProvider.notifier).getUtilities(utility: "internet");
      ref.read(getDiscountProvider.notifier).getDiscount(utility: "internet");
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
      title: internet,
      child: widget.isGuest! ? internetColumn(context, textTheme) : ListenerPage(child: internetColumn(context, textTheme)),
    );
  }

  Column internetColumn(BuildContext context, TextTheme textTheme) {
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
                                utilitiesData!.operatorpublicid!, categoeyName: utilitiesData!.category!);
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
                height: kMediumPadding,
              ),

              ref.watch(getDiscountProvider).when( done: (done){
                if(done != null){
                  threshold = done.data!.threshold ?? "0";
                  discountValue = done.data!.discountValue ?? "0";
                  return SizedBox();
                }else{
                  return SizedBox();
                }
              }),
              Text(
                subType,
                style: textTheme.headline6,
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              inkWell(
                onTap: (utilitiesData == null)
                    ? null
                    : () async {
                        final result = await buildShowModalBottomSheet(
                            context,
                            SubscriptionModal(paymentItem: utilitiesType, threshold: threshold, discountValue: discountValue,));
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
                            paymentType?.price == null || paymentType?.price == 0
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
                height: kMediumPadding,
              ),
              TextInputNoIcon(
                textTheme: textTheme,
                addSpace: false,
                text: accountId,
                read: (utilitiesData == null || paymentType == null),
                controller: contactController,
                hintText: "Enter $accountId",
                inputType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
               onChanged: _onChangeHandler,
                icon: inkWell(
                  onTap: utilitiesData == null && paymentType == null ? null : () async {
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
                            color: done == "Account not found" ? kColorRed : null
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
          var _widget = LargeButton(
            title: continueText,
            disableColor:
                (paymentType == null || accId == "" || utilitiesData == null || error.isNotEmpty)
                    ? kBackgroundColor
                    : kPrimaryColor,
            onPressed:
                (paymentType == null || accId == "" || utilitiesData == null || error.isNotEmpty)
                    ? () {}
                    : () {
                        FocusScope.of(context).unfocus();
                        buildShowModalBottomSheet(
                          context,
                          RechargeSummary(
                                  billerName: utilitiesData!.displayName!,
                                  billerId: utilitiesData!.operatorpublicid!,
                                  utility: true,
                                  isGuest: widget.isGuest!,
                                  name: widget.name,
                                  email: widget.email,
                                  threshold: threshold,
                                  category: "internet-purchase",
                                  amount: "${paymentType!.price!}",
                                  billerLogo: "",
                                  billerCode: paymentType!.code,
                                  recipientNo: contactController.text,
                                  textTheme: textTheme,
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

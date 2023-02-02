import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/buy_cable_class.dart';
import 'package:pouchers/modules/account/models/ui_models_class.dart';
import 'package:pouchers/modules/onboarding/screens/guest_widget.dart';
import 'package:pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:pouchers/modules/schedule_purchase/screens/schedule_cable_topup.dart';
import 'package:pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';

class BuyCable extends ConsumerStatefulWidget {
  static const String routeName = "buyCable";
  final bool? isGuest;

  const BuyCable({Key? key, this.isGuest}) : super(key: key);

  @override
  ConsumerState<BuyCable> createState() => _BuyCableState();
}

class _BuyCableState extends ConsumerState<BuyCable> {
  TextEditingController contactController = TextEditingController();
  bool _saveBeneficiary = false;
  GetUtilitiesData? utilitiesData;

  List<GetUtilitiesData> utilities = [];
  List<PaymentItem> utilitiesType = [];
  PaymentItem? paymentType;
  String cardNo = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getUtilitiesProvider.notifier).getUtilities(utility: "cable");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: cable,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
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
                            utilitiesData == null
                                ? SizedBox()
                                : Container(
                                    height: 40,
                                    width: 40,
                                    color: kIconGrey,
                                    margin: EdgeInsets.only(
                                      right: kRegularPadding,
                                    ),
                                  ),
                            Text(
                                utilitiesData == null
                                    ? selectProvider
                                    : utilitiesData!.billername!,
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
                        var _widget = inkWell(
                            onTap: () async {
                              final result = await buildShowModalBottomSheet(
                                  context, UtilityModal(utilities: utilities));
                              if (result != null) {
                                setState(() {
                                  utilitiesData = result;
                                  paymentType = null;
                                });
                                ref
                                    .read(getUtilitiesTypeProvider.notifier)
                                    .getUtilitiesType(
                                        categoryId: int.parse(
                                            utilitiesData!.billerid!));
                              }
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                              color: kSecondaryTextColor,
                            ));
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
                SizedBox(
                  height: kMediumPadding,
                ),
                TextInputNoIcon(
                  textTheme: textTheme,
                  text: cardNumber,
                  controller: contactController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (val) {
                    if (val!.isEmpty) {
                      setState(() => cardNo = "");
                    } else {
                      setState(() {
                        cardNo = val;
                      });
                    }
                    ;
                  },
                  icon: inkWell(
                    onTap: () async {
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
                  height: kSmallPadding,
                ),
                Text(
                  subType,
                  style: textTheme.headline6,
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                Container(
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
                                        : paymentType!.paymentitemname!,
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
                        var _widget = inkWell(
                            onTap: (utilitiesData == null)
                                ? null
                                : () async {
                                    final result =
                                        await buildShowModalBottomSheet(
                                            context,
                                            SubscriptionModal(
                                                paymentItem: utilitiesType));
                                    if (result != null) {
                                      setState(() => paymentType = result);
                                    }
                                  },
                            child: Row(
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
                                                text: kPriceFormatter(
                                                        double.parse(
                                                                paymentType!
                                                                    .amount!) /
                                                            100)
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
                            ));
                        return ref.watch(getUtilitiesTypeProvider).when(
                              done: (data) {
                                if (data != null) {
                                  utilitiesType = data.data!.paymentitems!;
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
                SizedBox(
                  height: kMicroPadding,
                ),
                widget.isGuest!
                    ? SizedBox()
                    : Scheduling(
                        text: scheduleCable,
                        subtext: scheduleCableSub,
                        onTap: () => pushTo(context, ScheduleCableTopUp(),
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
              }else if(next.status == NotifierStatus.error) {
                showErrorBar(context, next.data ?? next.message!);
              }
            });
            var _widget = LargeButton(
              title: continueText,
              disableColor:
                  (paymentType == null || cardNo == "" || utilitiesData == null)
                      ? kBackgroundColor
                      : kPrimaryColor,
              onPressed: (paymentType == null ||
                      cardNo == "" ||
                      utilitiesData == null)
                  ? () {}
                  : () {
                      buildShowModalBottomSheet(
                        context,
                        widget.isGuest!
                            ? GuestRechargeSummary(
                                textTheme: textTheme,
                                purchaseDelivered: true,
                              )
                            : RechargeSummary(
                                billerName: utilitiesData!.billername!,
                                amount:
                                    "${double.parse(paymentType!.amount!) / 100}",
                                billerLogo: "",
                                recipientNo: contactController.text,
                                textTheme: textTheme,
                              ),
                      ).then((value) async {
                        final result = await buildShowModalBottomSheet(
                            context,
                            TransactionPinContainer(
                              isData: false,
                              isCable: false,
                              isCard: false,
                              isFundCard: false,
                            ));
                        if (result != null) {
                          ref.read(buyUtilitiesProvider.notifier).buyUtilities(
                                paymentCode: paymentType!.paymentCode!,
                                amount:
                                    "${double.parse(paymentType!.amount!) / 100}",
                                customerId: contactController.text,
                                transactionPin: result,
                                subCategory: utilitiesData!.billername!,
                                category: "cable-purchase",
                              );
                        }
                      });
                    },
            );
            return ref.watch(buyUtilitiesProvider).when(
                  done: (data) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget,
                );
          })
        ],
      ),
    );
  }
}

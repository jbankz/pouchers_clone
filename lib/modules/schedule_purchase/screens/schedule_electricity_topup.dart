import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/buy_cable_class.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/account/screens/account_settings/schedule_payments.dart';
import 'package:Pouchers/modules/account/screens/disable_account/disable_modal.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/schedule_purchase/provider/schedule_provider.dart';
import 'package:Pouchers/modules/schedule_purchase/schedule_modal.dart';
import 'package:Pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class ScheduleElectricity extends ConsumerStatefulWidget {
  static const String routeName = "scheduleElectricity";
  final String? text, cardNo, amount, frequency, id;
  final GetUtilitiesData? utility;
  final Service? paymentType;

  const ScheduleElectricity(
      {Key? key,
      this.text,
      this.utility,
      this.amount,
      this.paymentType,
      this.frequency,
      this.id,
      this.cardNo})
      : super(key: key);

  @override
  ConsumerState<ScheduleElectricity> createState() =>
      _ScheduleElectricityState();
}

class _ScheduleElectricityState extends ConsumerState<ScheduleElectricity> {
  bool _saveBeneficiary = false;
  TextEditingController contactController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String _meterType = prepaid;
  String frequency = "";
  List<GetUtilitiesData> utilities = [];
  List<Service> utilitiesType = [];
  GetUtilitiesData? utilitiesData;
  Service? paymentType;
  String topUpDate = "";

  Widget prefixIcon = Padding(
    padding: EdgeInsets.symmetric(vertical: kMediumPadding),
    child: Text(selectProvider,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: kSecondaryTextColor.withOpacity(0.7),
          fontFamily: "DMSans",
          fontSize: 18,
        )),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(getUtilitiesProvider.notifier)
          .getUtilities(utility: "electricity");
    });

    widget.cardNo != null
        ? contactController = TextEditingController(text: widget.cardNo)
        : contactController = TextEditingController();

    widget.amount != null
        ? amountController = TextEditingController(text: widget.amount)
        : amountController = TextEditingController();

    if (widget.frequency != null) {
      frequency = widget.frequency!.startsWith(RegExp("[0-9:\s]"))
          ? ordinal_suffix_of(int.parse(widget.frequency!))
          : widget.frequency!;
      topUpDate = "Next top-up date is the next $frequency";
    }

    if (widget.utility != null) {
      utilitiesData = widget.utility;
    }
    if (widget.paymentType != null) {
      paymentType = widget.paymentType;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: scheduleElectricity,
      child: ListenerPage(
        child: Column(
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
                        ref
                            .read(getUtilitiesTypeProvider.notifier)
                            .getUtilitiesType(
                                merchantServiceId:
                                    utilitiesData!.operatorpublicid!);
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
                                          color: kSecondaryTextColor
                                              .withOpacity(0.7),
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
                  Text(
                    meterType,
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
                                SubscriptionModal(
                                  paymentItem: utilitiesType,
                                ));
                            if (result != null) {
                              setState(() => paymentType = result);
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
                  TextInputNoIcon(
                    textTheme: textTheme,
                    text: meterNo,
                    controller: contactController,
                    hintText: enterMeterNo,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
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
                    amountText,
                    style: textTheme.headline6,
                  ),
                  SizedBox(
                    height: kSmallPadding,
                  ),
                  TextFormField(
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
                  SizedBox(
                    height: kMicroPadding,
                  ),
                  inkWell(
                    onTap: () async {
                      final result = await buildShowModalBottomSheet(
                          context, ScheduleModal());
                      if (result != null) {
                        setState(() {
                          frequency = result;
                          topUpDate = "Next top-up date is the next $frequency";
                        });
                      }
                    },
                    child: SelectFrequencyWidget(
                      textTheme: textTheme,
                      frequency: frequency,
                    ),
                  ),
                  SizedBox(
                    height: kRegularPadding,
                  ),
                  frequency == ""
                      ? SizedBox()
                      : NextUpdateContainer(
                          textTheme: textTheme,
                          text: topUpDate,
                        ),
                ],
              ),
            ),
            SizedBox(
              height: kMicroPadding,
            ),
            widget.text == "viewSchedule"
                ? Consumer(builder: (context, ref, _) {
                    var _widget = LargeButton(
                        title: save,
                        onPressed: () async {
                          if (frequency == "") {
                            showErrorBar(context, "Please pick your frequency");
                          } else {
                            final result = await buildShowModalBottomSheet(
                              context,
                              TransactionPinContainer(
                                isSchedule: true,
                                isData: false,
                                isCard: false,
                                isFundCard: false,
                                doSchedule: () {
                                  showSuccessBar(context,
                                      "Auto top-up successfully created");
                                },
                              ),
                            );
                            if (result != null) {
                              ref
                                  .read(editScheduleProvider.notifier)
                                  .editSchedule(
                                    scheduleId: widget.id!,
                                    status: "active",
                                    frequency:
                                        frequency.startsWith(RegExp("[0-9:\s]"))
                                            ? frequency.replaceAll(
                                                RegExp("[a-zA-Z:\s]"), "")
                                            : frequency,
                                    transactionPin: result,
                                    error: (val) => showErrorBar(context, val),
                                    then: () => pushTo(
                                      context,
                                      SuccessMessage(
                                        text: dataSuccess,
                                        subText: billUpdateSuccess,
                                        onTap: () {
                                          Navigator.popUntil(
                                            context,
                                            (route) =>
                                                route.settings.name ==
                                                SchedulePayments.routeName,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                            }
                          }
                        });
                    return ref.watch(editScheduleProvider).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget);
                  })
                : Consumer(builder: (context, ref, _) {
                    var _widget = LargeButton(
                        title: confirm,
                        onPressed: frequency == "" ||
                                contactController.text.isEmpty ||
                                paymentType == null ||
                                utilitiesData == null
                            ? () {
                                showErrorBar(context, "Please fill all fields");
                              }
                            : () async {
                                final result = await buildShowModalBottomSheet(
                                  context,
                                  TransactionPinContainer(
                                    isSchedule: true,
                                    isData: false,
                                    isCard: false,
                                    isFundCard: false,
                                    doSchedule: () {
                                      showSuccessBar(context,
                                          "Auto top-up successfully created");
                                    },
                                  ),
                                );
                                if (result != null) {
                                  ref
                                      .read(buyUtilitiesProvider.notifier)
                                      .buyUtilities(
                                          amount: paymentType!.price!.toDouble(),
                                          isSchedule: true,
                                          merchantAccount:
                                              utilitiesData!.operatorpublicid!,
                                          merchantReferenceNumber:
                                              contactController.text,
                                          merchantService: [paymentType!.code!],
                                          subCategory:
                                              utilitiesData!.displayName!,
                                          transactionPin: result,
                                          frequency: frequency,
                                          category: "electricity-purchase",
                                          then: () {
                                            ref
                                                .read(getWalletProvider.notifier)
                                                .getWalletDetails();
                                            pushTo(
                                              context,
                                              SuccessMessage(
                                                text: dataSuccess,
                                                subText: billScheduleSuccess,
                                                onTap: () {
                                                  pushToAndClearStack(
                                                    context,
                                                    TabLayout(
                                                      gottenIndex: 0,
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          error: (val) =>
                                              showErrorBar(context, val));
                                }
                              });
                    return ref.watch(buyUtilitiesProvider).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget);
                  }),
            SizedBox(
              height: kMicroPadding,
            ),
            widget.text == "viewSchedule"
                ? DeleteScheduleText(
                    textTheme: textTheme,
                    onTap: () async {
                      final result = await buildShowModalBottomSheet(
                        context,
                        CommonModal(
                            textTheme: textTheme,
                            buttonText: yesDelete,
                            title: deleteTopUp,
                            subTitle: deleteTopUpSub,
                            color: kLightOrange),
                      );
                      if (result != null) {
                        if (result == "yes") {
                          final result = await buildShowModalBottomSheet(
                            context,
                            TransactionPinContainer(
                              isSchedule: true,
                              isData: false,
                              isCard: false,
                              isFundCard: false,
                              doSchedule: () {
                                showSuccessBar(
                                    context, "Auto top-up successfully created");
                              },
                            ),
                          );
                          if (result != null) {
                            ref.read(deleteScheduleProvider.notifier).deleteSchedule(
                                  scheduleId: widget.id!,
                                  transactionPin: result,
                                  error: (val) => showErrorBar(context, val),
                                  then: () => pushTo(
                                    context,
                                    SuccessMessage(
                                      text: dataSuccess,
                                      subText: billDeleteSuccess,
                                      onTap: () {
                                        Navigator.popUntil(
                                          context,
                                          (route) =>
                                              route.settings.name ==
                                              SchedulePayments.routeName,
                                        );
                                      },
                                    ),
                                  ),
                                );
                          }
                        }
                      }
                    },
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

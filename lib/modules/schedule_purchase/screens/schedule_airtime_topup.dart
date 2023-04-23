import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/account/screens/account_settings/schedule_payments.dart';
import 'package:Pouchers/modules/account/screens/disable_account/disable_modal.dart';
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
import 'package:collection/collection.dart';

class ScheduleAirtimeTopUp extends ConsumerStatefulWidget {
  static const String routeName = "scheduleTopUp";
  final String? text, contactNumber, amount, frequency, id;
  final GetUtilitiesData? billerData;

  ScheduleAirtimeTopUp(
      {Key? key,
      this.text,
      this.frequency,
      this.contactNumber,
      this.amount,
      this.id,
      this.billerData})
      : super(key: key);

  @override
  ConsumerState<ScheduleAirtimeTopUp> createState() => _ScheduleTopUpState();
}

class _ScheduleTopUpState extends ConsumerState<ScheduleAirtimeTopUp> {
  late TextEditingController contactController;
  late TextEditingController amountController;
  GetUtilitiesData? billerData;

  String frequency = "";
  int currentIndex = -1;
  String topUpDate = "";

  @override
  void initState() {
    super.initState();
    widget.contactNumber != null
        ? contactController = TextEditingController(text: widget.contactNumber)
        : contactController = TextEditingController();

    widget.amount != null
        ? amountController = TextEditingController(text: widget.amount)
        : amountController = TextEditingController();

    if (widget.billerData != null) {
      currentIndex = getIndex(widget.billerData!.displayName!);
      billerData = widget.billerData;
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.frequency != null) {
        frequency = widget.frequency!.startsWith(RegExp("[0-9:\s]"))
            ? ordinal_suffix_of(int.parse(widget.frequency!))
            : widget.frequency!;
        topUpDate = "Next top-up date is the next $frequency";
      }
      widget.text == "viewSchedule"
          ? ref
              .read(getUtilitiesProvider.notifier)
              .getUtilities(utility: "airtime")
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: scheduleAirtime,
      child: ListenerPage(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TextInputNoIcon(
                    textTheme: textTheme,
                    text: mobileNumber,
                    controller: contactController,
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
                    height: kPadding,
                  ),
                  Text(
                    selectProvider,
                    style: textTheme.headline3,
                  ),
                  SizedBox(
                    height: kSmallPadding,
                  ),
                  ref.watch(getUtilitiesProvider).when(
                        done: (provider) {
                          if (provider != null) {
                            return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: provider.data!
                                    .mapIndexed(
                                      (index, element) => inkWell(
                                        onTap: () {
                                          setState(() {
                                            currentIndex = index;
                                            billerData = element;
                                          });
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.all(kRegularPadding),
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: currentIndex == index
                                                      ? kLightPurple
                                                      : kContainerColor,
                                                  shape: BoxShape.circle),
                                              child: SvgPicture.asset(icon(
                                                  provider.data![index]
                                                      .displayName!)),
                                            ),
                                            currentIndex == index
                                                ? Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        decoration: BoxDecoration(
                                                            color: kPurpleColor,
                                                            shape:
                                                                BoxShape.circle),
                                                        child: Icon(
                                                          Icons.check,
                                                          color: kPrimaryWhite,
                                                          size: 15,
                                                        )),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList());
                          } else {
                            return SizedBox();
                          }
                        },
                        loading: () => SpinKitDemo(),
                        error: (val) => Text(
                          "No Provider for now",
                          style: textTheme.subtitle2,
                        ),
                      ),
                  SizedBox(
                    height: kMicroPadding,
                  ),
                  Text(
                    enterAmount,
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
                      prefix: RichText(
                        text: TextSpan(
                          text: "₦  ",
                          style: TextStyle(
                            color: kPrimaryTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
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
                  Text(
                    choosePeriod,
                    style: textTheme.headline6,
                  ),
                  SizedBox(
                    height: kSmallPadding,
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
                  SizedBox(
                    height: kMicroPadding,
                  )
                ],
              ),
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
                                amountController.text.isEmpty ||
                                billerData == null
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
                                      .read(scheduleUtilityProvider.notifier)
                                      .scheduleUtility(
                                          category: "airtime-purchase",
                                          subCategory: billerData!.name!,
                                          frequency: frequency
                                                  .startsWith(RegExp("[0-9:\s]"))
                                              ? frequency.replaceAll(
                                                  RegExp("[a-zA-Z:\s]"), "")
                                              : frequency,
                                          customerId: contactController.text,
                                          amount: amountController.text,
                                          paymentCode:
                                              billerData!.operatorpublicid!,
                                          transactionPin: result,
                                          serviceId:
                                              billerData!.operatorpublicid!,
                                          then: () => pushTo(
                                                context,
                                                SuccessMessage(
                                                  text: dataSuccess,
                                                  subText: billScheduleSuccess,
                                                  onTap: () {
                                                    pushToAndClearStack(
                                                        context,
                                                        TabLayout(
                                                          gottenIndex: 0,
                                                        ));
                                                  },
                                                ),
                                              ),
                                          error: (val) =>
                                              showErrorBar(context, val));
                                }
                              });
                    return ref.watch(scheduleUtilityProvider).when(
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
                        print(result);
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
                                      subText:  billDeleteSuccess ,
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

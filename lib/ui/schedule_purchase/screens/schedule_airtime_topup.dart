import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/ui/schedule_purchase/provider/schedule_provider.dart';
import 'package:pouchers/ui/schedule_purchase/schedule_modal.dart';
import 'package:pouchers/ui/schedule_purchase/schedule_widget_constants.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class ScheduleAirtimeTopUp extends ConsumerStatefulWidget {
  static const String routeName = "scheduleTopUp";

  ScheduleAirtimeTopUp({Key? key}) : super(key: key);

  @override
  ConsumerState<ScheduleAirtimeTopUp> createState() => _ScheduleTopUpState();
}

class _ScheduleTopUpState extends ConsumerState<ScheduleAirtimeTopUp> {
  TextEditingController contactController = TextEditingController();

  TextEditingController amountController = TextEditingController();
  String frequency = "";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: scheduleTopUp,
      bottomSheet: ref.watch(scheduleProvider)
          ? ScheduleBottomWidget(
              onTap: () {
                ref.read(scheduleProvider.notifier).state = false;
              },
            )
          : SizedBox(),
      child: ref.watch(scheduleProvider)
          ? ScheduleList(scheduleDummy: scheduleDummy, textTheme: textTheme)
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      TextInputNoIcon(
                        textTheme: textTheme,
                        text: mobileNumber,
                        read: true,
                        controller: contactController,
                        icon: SvgPicture.asset(
                          AssetPaths.contactBook,
                          fit: BoxFit.scaleDown,
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
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: provider
                              .mapIndexed(
                                (index, element) => Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(kRegularPadding),
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: kContainerColor,
                                          shape: BoxShape.circle),
                                      child: SvgPicture.asset(
                                        provider[index].icon,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList()),
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
                        style:
                            textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
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
                      TextInputNoIcon(
                        textTheme: textTheme,
                        text: choosePeriod,
                        hintText: selectFrequency,
                        read: true,
                        suffixIcon: frequency == ""
                            ? SizedBox()
                            : Container(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Every $frequency",
                                      style: textTheme.headline2!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kSecondaryTextColor,
                                    )
                                  ],
                                ),
                              ),
                        onTap: () async {
                          final result = await buildShowModalBottomSheet(
                              context, ScheduleModal());
                          setState(() => frequency = result);
                        },
                      ),
                      SizedBox(
                        height: kMicroPadding,
                      )
                    ],
                  ),
                ),
                LargeButton(
                    title: confirm,
                    onPressed: frequency == ""
                        ? () {}
                        : () {
                            buildShowModalBottomSheet(
                              context,
                              TransactionPinContainer(
                                isSchedule: true,
                                isData: false,
                                isCard: false,
                                isFundCard: false,
                                doSchedule: () {
                                  showSuccessBar(context,
                                      "Auto top-up successfully created");
                                  ref.read(scheduleProvider.notifier).state =
                                      true;
                                },
                              ),
                            );
                          })
              ],
            ),
    );
  }
}

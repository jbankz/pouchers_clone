import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:pouchers/ui/account/disable_account/disable_modal.dart';
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
  final String? text;

  ScheduleAirtimeTopUp({Key? key, this.text }) : super(key: key);

  @override
  ConsumerState<ScheduleAirtimeTopUp> createState() => _ScheduleTopUpState();
}

class _ScheduleTopUpState extends ConsumerState<ScheduleAirtimeTopUp> {
  TextEditingController contactController = TextEditingController();

  TextEditingController amountController = TextEditingController();
  String frequency = "";
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: scheduleTopUp,
      child:  Column(
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
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: provider
                              .mapIndexed(
                                (index, element) => inkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(kRegularPadding),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: currentIndex == index
                                            ? kLightPurple
                                            : kContainerColor,
                                        shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                      provider[index].icon,
                                    ),
                                  ),
                                  currentIndex == index
                                      ? Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: kPurpleColor,
                                            shape: BoxShape.circle),
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
                     widget.text == "viewSchedule" ? NextUpdateContainer(
                        textTheme: textTheme,
                        text: "Next top-up date is 12:00pm, Dec 5, 2022 ",
                      ) : SizedBox(),
                      SizedBox(
                        height: kMicroPadding,
                      )
                    ],
                  ),
                ),
                LargeButton(
                    title: widget.text == "viewSchedule" ? save : confirm,
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
                                },
                              ),
                            );
                          }),
                SizedBox(
                  height: kMicroPadding,
                ),
                widget.text == "viewSchedule"
                    ? DeleteScheduleText(textTheme: textTheme, onTap: (){
                  buildShowModalBottomSheet(
                    context,
                    DisableModal(
                        textTheme: textTheme,
                        buttonText: yesDelete,
                        title: deleteTopUp,
                        subTitle: deleteTopUpSub,
                        color: kLightOrange),
                  );
                },)
                    : SizedBox()
              ],
            ),
    );
  }
}

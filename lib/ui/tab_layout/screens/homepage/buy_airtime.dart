import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/ui/onboarding/screens/guest_widget.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class BuyAirtime extends ConsumerStatefulWidget {
  static const String routeName = "buyAirtime";
  final bool? isGuest;

  const BuyAirtime({Key? key, this.isGuest}) : super(key: key);

  @override
  ConsumerState<BuyAirtime> createState() => _BuyAirtimeState();
}

class _BuyAirtimeState extends ConsumerState<BuyAirtime> {
  TextEditingController contactController = TextEditingController();
  int currentIndex = -1;
  TextEditingController amountController = TextEditingController();
  String _amount = "";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: airtime,
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
                  childAspectRatio: SizeConfig.blockSizeHorizontal! / 3.3,
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
                                    amountController.text =
                                        guestList[index].icon;
                                    _amount = guestList[index].icon;
                                  });
                            amountController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: amountController.text.length));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kLightPurple),
                                  borderRadius:
                                      BorderRadius.circular(kSmallPadding)),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(kPadding),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(kSmallPadding),
                                        topLeft: Radius.circular(kSmallPadding),
                                      ),
                                      color: kPurpleColor,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "₦",
                                        style: TextStyle(
                                          color: kPrimaryWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: guestList[index].title,
                                            style:
                                                textTheme.headline4!.copyWith(
                                              color: kLightPurple,
                                            ),
                                          )
                                        ],
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
                                          text: guestList[index].icon,
                                          style: textTheme.subtitle1!.copyWith(
                                            fontWeight: FontWeight.w500,
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
                SizedBox(
                  height: kSmallPadding,
                ),
                Text(
                  enterAmount,
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
                ),
                SizedBox(
                  height: kMicroPadding,
                )
              ],
            ),
          ),
          LargeButton(
            title: continueText,
            disableColor: (amountController.text.isEmpty ||
                    _amount.isEmpty ||
                    _amount.startsWith("0"))
                ? kPurpleColor100
                : kPrimaryColor,
            outlineButton: false,
            onPressed: amountController.text.isEmpty ||
                    _amount.isEmpty ||
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
                                )
                              : RechargeSummary(
                                  textTheme: textTheme,
                                  isData: false,
                                ));
                    }
                  },
          )
        ],
      ),
    );
  }
}

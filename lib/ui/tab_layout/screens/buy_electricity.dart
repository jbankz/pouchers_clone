import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:pouchers/ui/tab_layout/models/buy_electricity_class.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class BuyElectricity extends StatefulWidget {
  const BuyElectricity({Key? key}) : super(key: key);

  @override
  State<BuyElectricity> createState() => _BuyElectricityState();
}

class _BuyElectricityState extends State<BuyElectricity> {
  bool _saveBeneficiary = false;
  TextEditingController contactController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String _meterType = prepaid;

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
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: electricity,
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
                      prefixIcon,
                      inkWell(
                          onTap: () async {
                            final result = await buildShowModalBottomSheet(
                                context, ElectricityModal());
                            if (result != SizedBox()) {
                              setState(() => prefixIcon = result);
                            }
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: kSecondaryTextColor,
                          )),
                    ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    inkWell(
                      onTap: (){
                        setState(()=> _meterType = prepaid);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kMediumPadding,
                            vertical: kRegularPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kSmallPadding),
                          border: Border.all(
                            color: _meterType == prepaid ? kPrimaryColor : kLightPurple,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: _meterType == prepaid ? kPrimaryColor : kPurpleColor400,
                                  width: 1.5,
                                ),
                              ),
                              child: _meterType == prepaid ? Container(
                                height: kSmallPadding,
                                width: kSmallPadding,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:  kPrimaryColor,
                                ),
                              ) : SizedBox(height: kSmallPadding, width: kSmallPadding,),
                            ),
                            SizedBox(
                              width: kMediumPadding,
                            ),
                            Text(
                              prepaid,
                              style: textTheme.subtitle1!
                                  .copyWith(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    inkWell(
                      onTap: (){
                        setState(()=> _meterType = postpaid);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kMediumPadding,
                            vertical: kRegularPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kSmallPadding),
                          border: Border.all(
                            color: _meterType == postpaid ? kPrimaryColor : kLightPurple,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: _meterType == postpaid ? kPrimaryColor : kLightPurple,
                                  width: 1.5,
                                ),
                              ),
                              child: _meterType == postpaid ? Container(
                                height: kSmallPadding,
                                width: kSmallPadding,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kPrimaryColor,
                                ),
                              ) : SizedBox(height: kSmallPadding,width: kSmallPadding,),
                            ),
                            SizedBox(
                              width: kMediumPadding,
                            ),
                            Text(
                              postpaid,
                              style: textTheme.subtitle1!
                                  .copyWith(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
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
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      hintText: enterAmount,
                      hintStyle: textTheme.headline6!.copyWith(
                          color: kSecondaryTextColor.withOpacity(0.7), fontSize: 18),
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
          SizedBox(
            height: kRegularPadding,
          ),
          Row(
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
          LargeButton(
            title: continueText,
            onPressed: () {
              buildShowModalBottomSheet(
                context,
                RechargeSummary(
                  isData: false,
                  isCable: true,
                  textTheme: textTheme,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

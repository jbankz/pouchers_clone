import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:pouchers/modules/onboarding/screens/guest_widget.dart';
import 'package:pouchers/modules/tab_layout/models/buy_cable_class.dart';
import 'package:pouchers/modules/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class BuyInternet extends StatefulWidget {
  static const String routeName = "buyInternet";
  final bool? isGuest;

  const BuyInternet({Key? key, this.isGuest}) : super(key: key);

  @override
  State<BuyInternet> createState() => _BuyInternetState();
}

class _BuyInternetState extends State<BuyInternet> {
  TextEditingController contactController = TextEditingController();
  bool _saveBeneficiary = false;
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

  Widget prefixTypeIcon = Padding(
    padding: EdgeInsets.symmetric(vertical: kMediumPadding),
    child: Text(type,
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
      title: internet,
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
                                context, CableModal());
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
                  height: kMediumPadding,
                ),
                TextInputNoIcon(
                  textTheme: textTheme,
                  text: accountId,
                  controller: contactController,
                  hintText: "Enter $accountId",
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
                      Expanded(child: prefixTypeIcon),
                      inkWell(
                        onTap: () async {
                          final result = await buildShowModalBottomSheet(
                              context, SubscriptionModal());
                          if (result != null) {
                            if (result != SizedBox()) {
                              setState(() => prefixTypeIcon = result);
                            }
                          }
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: kSecondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: kRegularPadding,
          ),
        widget.isGuest! ? SizedBox() :  Row(
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
                widget.isGuest!
                    ? GuestRechargeSummary(
                  textTheme: textTheme,
                  purchaseDelivered: true,
                )
                    :
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

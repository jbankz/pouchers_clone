import 'package:flutter/material.dart';
import 'package:pouchers/modules/account/screens/two_factor_auth/copy_code.dart';
import 'package:pouchers/modules/onboarding/screens/guest_widget.dart';
import 'package:pouchers/modules/onboarding/screens/welcome_guest.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class PayWithUssd extends StatelessWidget {
  static const String routeName = "payWithUssd";

  PayWithUssd({Key? key}) : super(key: key);

  String? selectedBank;
  List<String> banks = ["Access", "UBA", "Sterling"];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: payWithUssd,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.asset(
                  AssetPaths.ussdImage,
                  height: kSupremePadding,
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                FormDropdown(
                    hint: selectBankText,
                    value: selectedBank,
                    onChanged: (String? val) {
                      selectedBank = val;
                    },
                    items: banks
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList()),
                SizedBox(
                  height: kLargePadding,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kMicroPadding, vertical: kRegularPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      color: kBackgroundColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: kSecondaryPurple,
                      ),
                      Expanded(
                        child: Text(
                          "*901*000*340749339035#",
                          style: textTheme.headline2!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kSecondaryPurple),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                inkWell(
                  onTap: (){
                    _makePhoneCall("*901*000*340749339035#");
                  },
                  child: Text(
                    tapCode,
                    style: textTheme.headline4!,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: kFullPadding,
                ),
                CopyCodeRow(
                  textTheme: textTheme,
                  text: dialCode,
                  color: kIconGrey,
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                CopyCodeRow(
                  textTheme: textTheme,
                  text: dialCode2,
                  color: kIconGrey,
                ),
              ],
            ),
          ),
          PayWithAmount(onTap: () {
            Navigator.popUntil(
                context,
                    (route) =>
                route.settings.name == WelcomeGuest.routeName);
          }, text: "$havePaid ", amount: "4,000"),

        ],
      ),
    );
  }
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}

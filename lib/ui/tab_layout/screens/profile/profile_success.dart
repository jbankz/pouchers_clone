import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/login/screens/login.dart';
import 'package:pouchers/ui/tab_layout/screens/account/account_settings.dart';
import 'package:pouchers/ui/tab_layout/screens/profile/profile_account_verification.dart';
import 'package:pouchers/ui/tab_layout/screens/profile/profile_bvn.dart';
import 'package:pouchers/ui/tab_layout/screens/profile/profile_kyc.dart';
import 'package:pouchers/ui/tab_layout/screens/profile/profile_page.dart';
import 'package:pouchers/ui/tab_layout/screens/profile/profile_tier_list.dart';
import 'package:pouchers/ui/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ProfileSuccessful extends StatelessWidget {
  static const String routeName = "profileSuccessful";
final String? from;
  final String? message;

  const ProfileSuccessful({
    Key? key,
    this.message,
    this.from
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        onTap: () {
          if(from == "homepage"){
            pushToAndClearStack(context, TabLayout());
          } else{
            Navigator.popUntil(
              context,
                  (route) {
                if(route.settings.name != ProfileKYC.routeName){
                  return route.settings.name == PouchersTierList.routeName;
                }else {
                  return route.settings.name == ProfileKYC.routeName;
                }
              },
            );
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AssetPaths.success, height: 200, width: 200),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Text(
                    dataSuccess,
                    style: textTheme.headline1,
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyText1!
                        .copyWith(fontWeight: FontWeight.normal, height: 1.6),
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                ],
              ),
            ),
            LargeButton(
              title: continueText,
              onPressed: () {
                if(from == "homepage"){
                  pushToAndClearStack(context, TabLayout());
                } else{
                  Navigator.popUntil(
                    context,
                        (route) {
                      if(route.settings.name != ProfileKYC.routeName){
                        return route.settings.name == PouchersTierList.routeName;
                      }else {
                        return route.settings.name == ProfileKYC.routeName;
                      }
                    },
                  );
                }
              },
            )
          ],
        ));
  }
}

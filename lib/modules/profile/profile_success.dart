import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/profile/profile_kyc.dart';
import 'package:Pouchers/modules/profile/profile_tier_list.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class ProfileSuccessful extends StatelessWidget {
  static const String routeName = "profileSuccessful";
  final String? from;
  final String? message;

  const ProfileSuccessful({Key? key, this.message, this.from})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        onTap: () {
          if (from == "homepage") {
            pushToAndClearStack(context, TabLayout());
          } else {
            Navigator.popUntil(
              context,
              (route) {
                if (route.settings.name != ProfileKYC.routeName) {
                  return route.settings.name == PouchersTierList.routeName;
                } else {
                  return route.settings.name == ProfileKYC.routeName;
                }
              },
            );
          }
        },
        child: ListenerPage(
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
                  if (from == "homepage") {
                    pushToAndClearStack(context, TabLayout());
                  } else {
                    Navigator.popUntil(
                      context,
                      (route) {
                        if (route.settings.name != ProfileKYC.routeName) {
                          return route.settings.name ==
                              PouchersTierList.routeName;
                        } else {
                          return route.settings.name == ProfileKYC.routeName;
                        }
                      },
                    );
                  }
                },
              )
            ],
          ),
        ));
  }
}

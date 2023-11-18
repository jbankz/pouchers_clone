import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/modules/account/screens/account_settings/account_settings.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class SuccessAuthPage extends StatelessWidget {
  static const String routeName = "successAuthPage";

  const SuccessAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: factorAuth,
        onTap: () {
          Navigator.popUntil(context,
              (route) => route.settings.name == AccountSettings.routeName);
          // pushToAndClearUntil(
          //   context,
          //   TabLayout(
          //     gottenIndex: 3,
          //   ),
          //   routeName: TabLayout.routeName,
          // );
        },
        child: ListenerPage(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetPaths.authSuccessIcon,
                    ),
                    SizedBox(
                      height: kFullPadding,
                    ),
                    Text(
                      authSuccess,
                      style: textTheme.headline2!.copyWith(
                        color: kIconGrey,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              LargeButton(
                title: dataSuccess,
                onPressed: () {
                  Navigator.popUntil(
                      context,
                      (route) =>
                          route.settings.name == AccountSettings.routeName);
                },
              )
            ],
          ),
        ));
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/security_modal.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class TwoFactorDisable extends StatelessWidget {
  static const String routeName = "twoFactorDisable";

  const TwoFactorDisable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: factorAuth,
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
                      height: kMacroPadding,
                    ),
                    Text(
                      authEnabled,
                      style: textTheme.headline2!.copyWith(
                        color: kIconGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: kMicroPadding,
                    ),
                    Divider(
                      color: kLightPurple,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: kRegularPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          factorAuthentication,
                          style: textTheme.subtitle1
                        ),
                        FlutterSwitchClass(
                          saveBeneficiary: true,
                          onToggle: (val) {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return  Container(
                                      color: Color.fromRGBO(6, 6, 40, 0.7),
                                      child: SecurityModal(
                                        textTheme: Theme.of(context).textTheme,
                                        title: urgent,
                                        message: urgentSub,
                                        button: urgentButton,
                                        color: kLightOrange,
                                      ),
                                  );
                                });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

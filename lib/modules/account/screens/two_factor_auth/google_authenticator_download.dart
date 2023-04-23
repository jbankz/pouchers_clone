import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/copy_code.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/two_factor.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleAuthenticatorDownload extends ConsumerStatefulWidget {
  static const String routeName = "googleAuthenticatorDownload";

  const GoogleAuthenticatorDownload({Key? key}) : super(key: key);

  @override
  ConsumerState<GoogleAuthenticatorDownload> createState() => _GoogleAuthenticatorDownloadState();
}

class _GoogleAuthenticatorDownloadState extends ConsumerState<GoogleAuthenticatorDownload> {

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getQuestionHive();
    });
  }

  getQuestionHive() async {
    Hive.box(k2FACodeBox).put(kSetQuestion, 2);
    ref.read(calculateQuestionProvider.notifier).state = 2;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, (route) => route.settings.name == TwoFactor.routeName);
        return true;
      } ,
      child: InitialPage(
          title: factorAuth,
          onTap: () {
            Navigator.popUntil(context, (route) => route.settings.name == TwoFactor.routeName);
          },
          child: ListenerPage(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(kMediumPadding),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(224, 224, 255, 0.3),
                    ),
                    child: SvgPicture.asset(AssetPaths.googleAuthIcon),
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Text(
                    setAuthenticator,
                    style: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: kSmallPadding,
                  ),
                  Text(
                    setAuthenticatorSub,
                    style: textTheme.headline3!.copyWith(
                      color: kIconGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: kFullPadding,
                  ),
                  LargeButton(
                    title: downloadAuthenticator,
                    onPressed: () {
                      if (Platform.isAndroid) {
                        urlLauncher(
                            "https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2");
                      } else {
                        urlLauncher(
                            "https://apps.apple.com/us/app/google-authenticator/id388497605");
                      }
                    },
                  ),
                  SizedBox(
                    height: kRegularPadding,
                  ),
                  LargeButton(
                    title: downloadedAuthenticator,
                    outlineButton: true,
                    whiteButton: true,
                    download: true,
                    onPressed: () {
                      pushTo(context, CopyCode(),
                          settings: const RouteSettings(name: CopyCode.routeName));
                    },
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  urlLauncher(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      if (Platform.isAndroid) {
        await launchUrl(Uri.parse(url),
            mode: LaunchMode.externalNonBrowserApplication);
      } else {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      }
    } else {
      print('Could not launch $url');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/login/models/login_response.dart';
import 'package:pouchers/ui/tab_layout/providers/account_provider.dart';
import 'package:pouchers/ui/tab_layout/screens/account/two_factor_auth/confirm_auth_pin.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';


class CopyCode extends ConsumerStatefulWidget {
  static const String routeName = "copyCode";

  CopyCode({Key? key}) : super(key: key);

  @override
  ConsumerState<CopyCode> createState() => _CopyCodeState();
}

class _CopyCodeState extends ConsumerState<CopyCode> {
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(generate2FAProvider.notifier).generate2FA();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    SizeConfig().init(context);
    return InitialPage(
      title: factorAuth,
      child: ref.watch(generate2FAProvider).when(
            loading: () => SpinKitDemo(),
            done: (done) => done != null
                ? Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: kLargePadding,
                                  vertical: kSmallPadding),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(300),
                                  color: kBackgroundColor),
                              child: Text(
                                done,
                                style: textTheme.subtitle1!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: kSecondaryPurple,
                                  fontSize: 20,
                                ),
                                softWrap: true,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: kRegularPadding,
                            ),
                            inkWell(
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: done));
                                showSuccessBar(context, "Copied");
                              },
                              child: Text(
                                tapCopy,
                                style: textTheme.headline4!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: kIconGrey,
                                  fontFamily: "DMSans",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: kLargePadding,
                            ),
                            CopyCodeRow(
                              textTheme: textTheme,
                              text: copyPaste,
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 3,
                            ),
                            CopyCodeRow(
                              textTheme: textTheme,
                              text: tapComplete,
                            ),
                          ],
                        ),
                      ),
                      LargeButton(
                        title: dataSuccess,
                        onPressed: () {
                          pushTo(context, ConfirmAuthPin(),
                              settings: const RouteSettings(
                                  name: ConfirmAuthPin.routeName));
                        },
                      )
                    ],
                  )
                : SizedBox(),
          ),
    );
  }
}

class CopyCodeRow extends StatelessWidget {
  final String text;
  final Color? color;

  const CopyCodeRow(
      {Key? key, required this.textTheme, this.color, required this.text})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AssetPaths.faIcon),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal! * 4,
        ),
        Expanded(
          child: Text(
            text,
            style: textTheme.headline3!.copyWith(color: color ?? kIconGrey),
            softWrap: true,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/account/screens/account_settings/biometric_settings.dart';
import 'package:pouchers/modules/account/screens/account_settings/change_pin.dart';
import 'package:pouchers/modules/account/screens/change_password/change_password.dart';
import 'package:pouchers/modules/account/screens/delete_account/delete_account.dart';
import 'package:pouchers/modules/account/screens/disable_account/disable_account.dart';
import 'package:pouchers/modules/account/screens/two_factor_auth/two_factor.dart';
import 'package:pouchers/modules/account/screens/two_factor_auth/two_factor_disable.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class AccountSettings extends ConsumerStatefulWidget {
  static const String routeName = "accountSettings";

  const AccountSettings({Key? key}) : super(key: key);

  @override
  ConsumerState<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends ConsumerState<AccountSettings> {
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  var isAuthDisabled;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkFactor();
    });
  }

  checkFactor() async {
    await Hive.openBox(k2FACodeBox);
    if(Hive.box(k2FACodeBox).get(k2FACode) == null){
      ref.read(authFactorProvider.notifier).state = userProfile.is2faActive!;
    }else{
      isAuthDisabled = Hive.box(k2FACodeBox).get(k2FACode);
      isAuthDisabled == true
          ? ref.read(authFactorProvider.notifier).state = true
          : ref.read(authFactorProvider.notifier).state = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InitialPage(
      title: settings,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical! / 6,
                ),
                AccountSettingsClass(
                  text: changePassword,
                  text2: changePasswordSub,
                  page: ChangePassword(
                    changePhone: false,
                  ),
                  routeName: ChangePassword.routeName,
                ),
                AccountSettingsClass(
                  text: changePin,
                  text2: changePinSub,
                  page: ChangeTransactionPin(),
                  routeName: ChangeTransactionPin.routeName,
                ),
                AccountSettingsClass(
                  text: biometricAuthentication,
                  text2: biometricAuthenticationSub,
                  page: BiometricSettings(),
                  routeName: BiometricSettings.routeName,
                ),
                AccountSettingsClass(
                    text: factorAuthentication,
                    text2: factorAuthenticationAub,
                    page: ref.watch(authFactorProvider)
                        ? TwoFactorDisable()
                        : TwoFactor(),
                    routeName: ref.watch(authFactorProvider)
                        ? TwoFactorDisable.routeName
                        : TwoFactor.routeName),
                SizedBox(
                  height: kSmallPadding,
                ),
                AccountSettingsClass(
                  text: disableAccount,
                  text2: "",
                  page: DisableAccount(),
                  routeName: DisableAccount.routeName,
                ),
                AccountSettingsClass(
                  text: deleteAccount,
                  text2: "",
                  page: DeleteAccount(),
                  routeName: DeleteAccount.routeName,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountSettingsClass extends StatelessWidget {
  final String text, text2, routeName;
  final Widget page;

  const AccountSettingsClass(
      {Key? key,
      required this.text,
      required this.text2,
      required this.page,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return inkWell(
      onTap: () {
        pushTo(
          context,
          page,
          settings: RouteSettings(name: routeName),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: textTheme.subtitle1!.copyWith(
                          fontSize: 20,
                          color:
                              text2 == "" ? kLightOrange : kPrimaryTextColor),
                    ),
                    SizedBox(
                      height: kPadding,
                    ),
                    text2 == ""
                        ? SizedBox()
                        : Text(
                            text2,
                            style: textTheme.headline6,
                          ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: kIconGrey,
                size: 18,
              )
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Divider(
            thickness: 1,
            color: kLightPurple,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 3,
          ),
        ],
      ),
    );
  }
}

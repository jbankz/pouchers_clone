import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/virtual_keypad.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'widgets/account_setting_tile.dart';

class AccountSettingsView extends ConsumerWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => ValueListenableBuilder<
          Box>(
      valueListenable: userDao.getListenable(),
      builder: (_, box, __) {
        final user = userDao.returnUser(box);
        return Scaffold(
          appBar: AppBar(title: Text(AppString.accountSettings)),
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Expanded(
                  child: ListView(children: [
                    AccountSettingsTile(
                      title: AppString.changePassword,
                      desc: AppString.changePasswordInstruction,
                      tapped: () => PageRouter.pushNamed(
                          Routes.verifyChangeOfPasswordView),
                    ),
                    const Gap(height: 11),
                    const Divider(),
                    const Gap(height: 20),
                    AccountSettingsTile(
                      title: AppString.changeTransactionPin,
                      desc: AppString.changeTransactionPinInstruction,
                      tapped: () =>
                          PageRouter.pushNamed(Routes.passwordConfirmationView),
                    ),
                    const Gap(height: 11),
                    const Divider(),
                    const Gap(height: 20),
                    AccountSettingsTile(
                      title: AppString.biometricAuth,
                      desc: AppString.biometricAuthInstruction,
                      tapped: () {},
                    ),
                    const Gap(height: 11),
                    const Divider(),
                    const Gap(height: 40),
                    AccountSettingsTile(
                      color: AppColors.kLightOrange,
                      title: AppString.disableAccount,
                      tapped: () {},
                    ),
                    const Gap(height: 11),
                    const Divider(),
                    const Gap(height: 20),
                    AccountSettingsTile(
                      color: AppColors.kLightOrange,
                      title: AppString.deleteAccount,
                      tapped: () {},
                    ),
                    const Gap(height: 11),
                    const Divider(),
                  ]),
                ),
                ElevatedButtonWidget(title: AppString.logOut, onPressed: () {})
              ],
            ),
          ),
        );
      });
}

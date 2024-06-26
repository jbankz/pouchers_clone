import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../profile/presentation/notifier/user_notifier.dart';
import 'widgets/account_setting_tile.dart';

class AccountSettingsView extends ConsumerWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
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
                      tapped: () {
                        ref.read(paramModule).setChangePassword(true);
                        PageRouter.pushNamed(Routes.verifyChangeOfPasswordView);
                      }),
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
                      tapped: () =>
                          PageRouter.pushNamed(Routes.biometricSetupView)),
                  const Gap(height: 11),
                  const Divider(),
                  const Gap(height: 20),
                  AccountSettingsTile(
                      title: AppString.twoFactorAuth,
                      desc: AppString.twoFactorAuthInstr,
                      tapped: () => PageRouter.pushNamed(Routes.twoFaAuthView)),
                  const Gap(height: 11),
                  const Divider(),
                  const Gap(height: 40),
                  AccountSettingsTile(
                      color: AppColors.kLightOrange,
                      title: AppString.disableAccount,
                      tapped: () => PageRouter.pushNamed(Routes.disableView)),
                  const Gap(height: 11),
                  const Divider(),
                  const Gap(height: 20),
                  AccountSettingsTile(
                      color: AppColors.kLightOrange,
                      title: AppString.deleteAccount,
                      tapped: () => PageRouter.pushNamed(Routes.deleteView)),
                  const Gap(height: 11),
                  const Divider(),
                ]),
              ),
              ElevatedButtonWidget(
                  title: AppString.logOut,
                  onPressed: ref.read(userNotifierProvider.notifier).logOut)
            ],
          ),
        ),
      );
}

import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../app/app.router.dart';
import '../../../../../../app/core/router/page_router.dart';
import '../pin/sheet/pin_confirmation_sheet.dart';
import 'sheets/take_note_sheets.dart';

class TwoFaAuthView extends ConsumerWidget {
  const TwoFaAuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ValueListenableBuilder<Box>(
          valueListenable: userDao.getListenable(),
          builder: (_, box, __) {
            final user = userDao.returnUser(box);
            final bool is2faActive = ((user.is2faActive ?? false));
            return Scaffold(
              appBar: AppBar(title: Text(AppString.authentication)),
              body: SafeArea(
                minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      children: [
                        const Gap(height: 172.65),
                        SvgPicture.asset(
                            is2faActive
                                ? AppImage.authenticatorEnabled
                                : AppImage.authenticator,
                            fit: BoxFit.scaleDown),
                        const Gap(height: 63.65),
                        if (!is2faActive)
                          Text(
                            AppString.factorAuth,
                            style: context.headlineMedium?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        const Gap(height: 12),
                        Text(
                          is2faActive
                              ? AppString.successFactorAuth
                              : AppString.unSuccessFactorAuth,
                          style: context.headlineMedium?.copyWith(
                              fontSize: 14,
                              color: AppColors.kIconGrey,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                        if (is2faActive)
                          Column(
                            children: [
                              const Gap(height: 31),
                              const Divider(),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(AppString.twoFactorAuth,
                                          style: context.headlineMedium
                                              ?.copyWith(fontSize: 16))),
                                  Transform.scale(
                                      scale: .7,
                                      child: Switch.adaptive(
                                          activeColor: AppColors.kPrimaryColor,
                                          value: is2faActive,
                                          onChanged: (value) async {
                                            if (!value) {
                                              final response = await BottomSheets
                                                      .showAlertDialog(
                                                          child: TakeNoteSheets(
                                                              turnOff:
                                                                  is2faActive))
                                                  as bool?;

                                              if (response ?? false) {
                                                // PageRouter.pushNamed(Routes
                                                //     .securityQuestionView);
                                              }
                                            }
                                          }))
                                ],
                              )
                            ],
                          ),
                      ],
                    )),
                    if (!is2faActive)
                      ElevatedButtonWidget(
                          loading: ref.watch(authNotifierProvider).isBusy,
                          title: is2faActive
                              ? AppString.complete
                              : AppString.setupFactorAuth,
                          onPressed: () async {
                            final pin = await BottomSheets.showSheet(
                                isDismissible: false,
                                child: const PinConfirmationSheet(
                                    validatePinHere: true)) as String?;
                            if (pin != null) {
                              PageRouter.pushNamed(
                                  Routes.firstSecurityQuestionView);
                            }
                          })
                  ],
                ),
              ),
            );
          });
}

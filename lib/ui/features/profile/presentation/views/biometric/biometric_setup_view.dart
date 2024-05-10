import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/features/authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import 'package:pouchers/ui/features/profile/presentation/views/biometric/dao/biometric_dao.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../../../../common/app_strings.dart';
import '../../../../../widgets/dialog/bottom_sheet.dart';
import 'notifier/module.dart';

class BiometricSetupView extends ConsumerWidget {
  const BiometricSetupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(title: Text(AppString.biometric)),
        body: ValueListenableBuilder<Box>(
            valueListenable: biometricDao.getListenable(),
            builder: (_, __, ___) => ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  children: [
                    _buildTile(
                        title: AppString.loginWithBiometric,
                        value: biometricDao.login,
                        onChanged: (value) => _handleLoginToggle(ref, value)),
                    _buildTile(
                        title: AppString.payWithBiometric,
                        value: biometricDao.pay,
                        onChanged: (value) => _handlePayToggle(ref, value)),
                    // _buildTile(
                    //     title: 'Unlock with biometrics',
                    //     value: biometricDao.unlock,
                    //     onChanged: (value) => biometricDao.unlock = value),
                  ],
                )),
      );

  Column _buildTile(
          {required String title,
          required bool value,
          required void Function(bool)? onChanged}) =>
      Column(
        children: [
          const Gap(height: 7),
          Row(
            children: [
              SvgPicture.asset(AppImage.faceId),
              const Gap(width: 8),
              Expanded(
                  child: Text(
                title,
                style: PageRouter.globalContext.headlineMedium
                    ?.copyWith(fontSize: 16),
              )),
              const Gap(width: 16),
              Transform.scale(
                  scale: .7,
                  child: Switch.adaptive(
                      activeColor: AppColors.kPrimaryColor,
                      value: value,
                      onChanged: onChanged))
            ],
          ),
          const Gap(height: 7),
          const Divider()
        ],
      );

  void _handleLoginToggle(WidgetRef ref, bool value) {
    if (value) {
      ref.read(biometricNotifier.notifier).authenticateUser(
          callbackAction: () {},
          failure: () {
            biometricDao.login = false;
            return;
          });
    }
    biometricDao.login = value;
  }

  Future<void> _handlePayToggle(WidgetRef ref, bool value) async {
    if (value) {
      final pin = await BottomSheets.showSheet(
          child: const PinConfirmationSheet(validatePinHere: true)) as String?;
      if (pin != null) {
        await ref.read(biometricNotifier.notifier).secureTransactionPin(pin);
      } else {
        biometricDao.pay = false;
        return;
      }
    }
    biometricDao.pay = value;
  }
}

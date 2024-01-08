import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dao/biometric_dao.dart';
import 'notifier/module.dart';

class BiometricVerification extends ConsumerWidget {
  const BiometricVerification(
      {super.key,
      this.isNotAffordable = false,
      this.popScreenWhenVerificationCompletes = true,
      required this.callback});

  final bool isNotAffordable;
  final bool popScreenWhenVerificationCompletes;
  final Function(String pin) callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasBiometricPay = biometricDao.pay;
    return ValueListenableBuilder<Box>(
      valueListenable: biometricDao.getListenable(),
      builder: (_, box, __) => !hasBiometricPay
          ? const SizedBox.shrink()
          : CupertinoButton(
              onPressed: isNotAffordable
                  ? null
                  : () async {
                      await HapticFeedback.selectionClick();

                      ref.read(biometricNotifier.notifier).authenticateUser(
                        callbackAction: () async {
                          final pin = await ref
                              .read(biometricNotifier.notifier)
                              .retrieveTransactionPin();
                          callback(pin);
                          if (popScreenWhenVerificationCompletes) {
                            PageRouter.pop();
                          }
                        },
                        failure: () {
                          biometricDao.login = false;
                          return;
                        },
                      );
                    },
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  SvgPicture.asset(AppImage.mingcuteFaceid,
                      color: isNotAffordable
                          ? AppColors.kPurple100.withOpacity(.2)
                          : null),
                  const Gap(height: 20),
                ],
              ),
            ),
    );
  }
}

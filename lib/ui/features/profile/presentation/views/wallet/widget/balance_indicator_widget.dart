import 'package:Pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../widgets/gap.dart';

class BalanceIndicatorWidget extends HookConsumerWidget {
  const BalanceIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletNotifierProvider);
    return ValueListenableBuilder<Box>(
        valueListenable: walletDao.getListenable(),
        builder: (_, box, __) {
          final wallet = walletDao.retrieve(box);
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.kLightPurple),
                  child: SvgPicture.asset(AppImage.walletIcon,
                      fit: BoxFit.scaleDown)),
              const Gap(width: 5),
              AnimatedSize(
                duration: const Duration(milliseconds: 350),
                reverseDuration: const Duration(milliseconds: 350),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: walletState.isBusy
                      ? const CupertinoActivityIndicator()
                      : Text(
                          'Balance - ${num.parse((wallet.balance) ?? '0').toNaira}',
                          style: context.titleLarge?.copyWith(
                              color: AppColors.kPrimaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                ),
              ),
            ],
          );
        });
  }
}

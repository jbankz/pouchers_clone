import 'package:Pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:Pouchers/ui/features/profile/domain/model/wallet.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:Pouchers/ui/features/profile/presentation/state/wallet_state.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../app/app.router.dart';
import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/gap.dart';

class BalanceIndicatorWidget extends HookConsumerWidget {
  const BalanceIndicatorWidget(
      {super.key,
      required this.amount,
      this.balanceColor = AppColors.kPrimaryTextColor});

  final num amount;
  final Color balanceColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletNotifierProvider);
    return ValueListenableBuilder<Box>(
        valueListenable: walletDao.getListenable(),
        builder: (_, box, __) {
          final wallet = walletDao.retrieve(box);

          if (num.parse(wallet.balance ?? '0') < amount) {
            return _buildInsufficientIndicator(
                walletState, wallet, context, ref);
          }

          return _buildAvailableBalanceIndicator(walletState, wallet, context);
        });
  }

  Column _buildInsufficientIndicator(WalletState<dynamic> walletState,
          Wallet wallet, BuildContext context, WidgetRef ref) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAvailableBalanceIndicator(walletState, wallet, context),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(8.r),
                onTap: () async {
                  await PageRouter.pushNamed(Routes.fundWalletView);
                  ref.read(walletNotifierProvider.notifier).getWalletBalance();
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      color: AppColors.kPurpleColor,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Text(
                    AppString.fundWallet,
                    style: context.titleLarge?.copyWith(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
          const Gap(height: 9),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(AppString.insufficientFund,
                  style: context.titleLarge
                      ?.copyWith(color: AppColors.kColorOrange, fontSize: 12)))
        ],
      );

  Row _buildAvailableBalanceIndicator(WalletState<dynamic> walletState,
          Wallet wallet, BuildContext context) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 32.h,
              width: 32.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.kLightPurple),
              child:
                  SvgPicture.asset(AppImage.walletIcon, fit: BoxFit.scaleDown)),
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
                          color: balanceColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
            ),
          ),
        ],
      );
}

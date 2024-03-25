import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/dashboard/views/home/views/sheet/request_options.dart';
import 'package:pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../../notification/presentation/notifier/notification_notifier.dart';
import '../../../../../transfer/presentation/sheets/transfer_money_sheet.dart';
import 'build_action_button.dart';

class BalanceWidget extends HookConsumerWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationState = ref.watch(notificationNotifierProvider);
    final int totalUnreadMessages =
        notificationState.unreadPaymentModel?.unreadPaymentRequestCount ?? 0;
    return ValueListenableBuilder<Box>(
        valueListenable: walletDao.getListenable(),
        builder: (_, box, __) {
          final wallet = walletDao.retrieve(box);
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.kPrimaryColor),
            child: Column(
              children: [
                Text(
                  AppString.totalBalance,
                  style: context.headlineLarge?.copyWith(
                      color: AppColors.kPurpleLight,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp),
                ),
                const Gap(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                          walletDao.balanceVisibilty
                              ? num.parse(wallet.balance ?? '0').toNaira
                              : '*****',
                          style: context.headlineLarge?.copyWith(
                              fontSize: _returnFontSize(
                                      num.parse(wallet.balance ?? '0').toNaira)
                                  .sp,
                              fontWeight: FontWeight.w700)),
                    ),
                    const Gap(width: 6),
                    GestureDetector(
                        onTap: () => walletDao.toggleBalanceVisibility(),
                        child: walletDao.balanceVisibilty
                            ? const Icon(Icons.visibility_off_outlined,
                                color: AppColors.kSecondaryTextColor)
                            : const Icon(Icons.visibility_outlined,
                                color: AppColors.kSecondaryTextColor))
                  ],
                ),
                const Gap(height: 29),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: BuildActionButton(
                        icon: AppImage.walletOne,
                        title: AppString.fundWallet,
                        checkUsersLevel: false,
                        onTap: () =>
                            PageRouter.pushNamed(Routes.fundWalletView),
                      ),
                    ),
                    Flexible(
                      child: BuildActionButton(
                          icon: AppImage.swap,
                          title: AppString.transfer,
                          onTap: () => BottomSheets.showSheet(
                              wrap: false, child: const TransferMoneySheet())),
                    ),
                    Flexible(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          BuildActionButton(
                              icon: AppImage.bag,
                              title: AppString.request,
                              onTap: () => BottomSheets.showSheet(
                                  child: const RequestOptionSheet())),
                          if (totalUnreadMessages > 0)
                            Positioned(
                              left: 25.w,
                              top: -10,
                              child: Container(
                                height: 20.h,
                                width: 20.w,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.kColorRed),
                                child: Text('$totalUnreadMessages',
                                    style: context.bodyMedium?.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  num _returnFontSize(String balance) {
    if (balance.length <= 9) {
      return 28;
    } else if (balance.length <= 11.9) {
      return 25;
    } else if (balance.length <= 15.9) {
      return 23;
    } else if (balance.length <= 19.9) {
      return 20;
    } else if (balance.length <= 23.9) {
      return 18;
    } else {
      return 16;
    }
  }
}

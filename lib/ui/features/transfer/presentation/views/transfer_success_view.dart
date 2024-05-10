import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/transfer/presentation/notifier/transfer_notifier.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/app_colors.dart';

class TransferSuccessState extends HookConsumerWidget {
  const TransferSuccessState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transfer = ref.watch(transferNotifierProvider);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AppImage.success, height: 140.71.h, width: 157.w),
                const Gap(height: 28),
                Text('Transfer completed',
                    style: context.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColors.kPrimaryTextColor)),
                const Gap(height: 8),
                Text('Your money has been successfully delivered!',
                    style: context.headlineMedium
                        ?.copyWith(color: AppColors.kSecondaryTextColor),
                    textAlign: TextAlign.center)
              ],
            )),
            Row(
              children: [
                _buildactionButton(
                    context: context,
                    image: AppImage.recycle,
                    title: AppString.schedule,
                    onTap: () => PageRouter.pushNamed(
                        Routes.scheduleTransferMoneyView,
                        args: ScheduleTransferMoneyViewArguments(
                            transfer: transfer.transfer))),
                const Gap(width: 23),
                _buildactionButton(
                    context: context,
                    image: AppImage.uploadOutlineIcon,
                    title: AppString.shareReceipt,
                    onTap: () => PageRouter.pushNamed(Routes.transferReceipt,
                        args: TransferReceiptArguments(
                            transfer: transfer.transfer)))
              ],
            ),
            const Gap(height: 33),
            ElevatedButtonWidget(
                onPressed: () => PageRouter.popToRoot(Routes.dashboardView),
                title: AppString.proceed)
          ],
        ),
      ),
    );
  }

  Expanded _buildactionButton(
          {required BuildContext context,
          required String image,
          required String title,
          required Function() onTap}) =>
      Expanded(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 14.h),
            decoration: BoxDecoration(
                color: AppColors.kContainerColor,
                borderRadius: BorderRadius.circular(8.r)),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(image),
                  const Gap(width: 10),
                  Flexible(
                    child: Text(
                      title,
                      style: context.headlineMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

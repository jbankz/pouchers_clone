import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/voucher/presentation/notifier/vouchers_notifier.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/outline_button_widget.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../widgets/ticket_widget.dart';

class VoucherSuccessView extends HookConsumerWidget {
  const VoucherSuccessView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final voucher = ref.watch(vouchersNotifierProvider).buyVoucher;

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                        height: 150.h,
                        child: TicketWidget(
                            code: voucher?.voucherCode ?? '',
                            amount: (voucher?.amount ?? 0).toNaira,
                            date: DateTime.now())),
                    const Gap(height: 57),
                    Text(AppString.complete,
                        style: context.titleMedium?.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    const Gap(height: 8),
                    Text(AppString.completedBuyingVoucherPurchase,
                        style: context.titleMedium?.copyWith(
                            fontSize: 16,
                            color: AppColors.kSecondaryTextColor,
                            fontWeight: FontWeight.w400)),
                    const Gap(height: 42),
                    OutlineButtonWidget(
                        title: AppString.shareVoucher,
                        onPressed: () =>
                            AppHelper.share(voucher?.voucherCode ?? ''))
                  ]),
                ),
              ),
            ),
            ElevatedButtonWidget(
                title: AppString.proceed,
                onPressed: () => PageRouter.popToRoot(Routes.voucherView))
          ],
        ),
      ),
    );
  }
}

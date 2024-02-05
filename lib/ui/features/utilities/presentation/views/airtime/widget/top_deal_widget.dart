import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/discounts.dart';
import 'package:Pouchers/ui/features/utilities/presentation/notifier/billers_notifier.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/bottom_sheet.dart';
import '../../../../../../widgets/dialog/guest_modal_sheet.dart';

class TopDealsWidget extends HookConsumerWidget {
  const TopDealsWidget({required this.callback, super.key});

  final Function(num) callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billerState = ref.watch(billersNotifierProvider);

    final Discounts? discounts = billerState.discounts;
    final List<num> topDeals = discounts?.topDeals ?? [];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, animation) =>
          SizeTransition(sizeFactor: animation, child: child),
      child: discounts == null
          ? const SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(height: 24),
                Text(AppString.topDeals,
                    style: context.titleLarge?.copyWith(fontSize: 12.sp)),
                const Gap(height: 12),
                GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: topDeals.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 14.w,
                        crossAxisSpacing: 16.h,
                        childAspectRatio: 1.5,
                        crossAxisCount: 3),
                    itemBuilder: (_, index) {
                      final deal = topDeals[index];
                      return CupertinoButton(
                        onPressed: () {
                          if (billerState.isGuest) {
                            Sheets.showDialog(
                                child: const GuestDiscountSheet());
                            return;
                          }
                          callback(deal);
                        },
                        padding: EdgeInsets.zero,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  width: 1.w, color: AppColors.kLightPurple)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10.r)),
                                    color: AppColors.kPrimaryColor),
                                child: Text(
                                  '${discounts.discountValue.toNaira.removeDoubleZeros} cashback',
                                  style: context.titleLarge?.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.kLightPurple),
                                ),
                              ),
                              const Gap(height: 12),
                              Text(
                                deal.toNaira.replaceAll('.00', ''),
                                style: context.titleLarge?.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.kPrimaryTextColor),
                              ),
                              const Gap(height: 12),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
    );
  }
}

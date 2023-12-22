import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/utilities/presentation/notifier/billers_notifier.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/model/airtime_top_deals.dart';

class TopDealsWidget extends HookConsumerWidget {
  const TopDealsWidget({required this.callback, super.key});

  final Function(AirtimeTopDeals) callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topDeals = ref.watch(billersNotifierProvider).airtimeTopDeals;
    return GridView.builder(
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
              callback(deal);

              /// Sheets.showDialog(child: const GuestDiscountSheet())
            },
            padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border:
                      Border.all(width: 1.w, color: AppColors.kLightPurple)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10.r)),
                        color: AppColors.kPrimaryColor),
                    child: Text(
                      '${deal.cashBack.toNaira.replaceAll('.00', '')} cashback',
                      style: context.titleLarge?.copyWith(
                          fontSize: 12.sp, color: AppColors.kLightPurple),
                    ),
                  ),
                  const Gap(height: 12),
                  Text(
                    deal.amount.toNaira.replaceAll('.00', ''),
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
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../domain/enum/billers_category.dart';
import '../../../../../widgets/bottom_sheet.dart';
import '../../../../../widgets/dialog/guest_modal_sheet.dart';
import '../../../../../widgets/gap.dart';
import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/features/utilities/presentation/notifier/billers_notifier.dart';
import 'package:Pouchers/utils/extension.dart';

import '../../../domain/model/top_deals_model.dart';

class TopDealsWidget extends HookConsumerWidget {
  const TopDealsWidget({
    required this.callback,
    required this.filteredServices,
    required this.category,
    super.key,
  });

  final BillersCategory category;
  final Function(TopDeals) callback;
  final List<TopDeals> filteredServices;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billerState = ref.watch(billersNotifierProvider);
    final discount = billerState.discounts?.discount;

    return Skeleton(
      isLoading: billerState.isGettingDiscount,
      skeleton: _buildTopDealSkeleton(context),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) =>
            SizeTransition(sizeFactor: animation, child: child),
        child: filteredServices.isEmpty
            ? const SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(height: 24),
                  Text(
                    AppString.topDeals,
                    style: context.titleLarge?.copyWith(fontSize: 12.sp),
                  ),
                  const Gap(height: 12),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredServices.take(6).length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 14.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: _returnChildAspectRatio(),
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (_, index) {
                      final deal = filteredServices[index];
                      return InkWell(
                        onTap: () {
                          if (billerState.isGuest) {
                            Sheets.showDialog(
                              child: const GuestDiscountSheet(),
                            );
                          } else {
                            callback(deal);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              width: 1.w,
                              color: AppColors.kLightPurple,
                            ),
                          ),
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10.r),
                                    ),
                                    color: AppColors.kPrimaryColor,
                                  ),
                                  child: Text(
                                    '${discount?.discountValue.toNaira} cashback',
                                    style: context.titleLarge?.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.kLightPurple,
                                    ),
                                  ),
                                ),
                                const Gap(height: 12),
                                _returnWidget(deal, context),
                                const Gap(height: 12),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }

  Column _buildCableValues(TopDeals deal, BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            deal.name ?? '',
            style: context.titleLarge?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kPrimaryTextColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          const Gap(height: 4),
          Flexible(
            child: Text(
              deal.price.toNaira,
              style: context.titleLarge?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.kPrimaryTextColor,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        ],
      );

  Text _buildAirtimeValues(TopDeals deal, BuildContext context) => Text(
        deal.price.toNaira,
        style: context.titleLarge?.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.kPrimaryTextColor,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
      );

  Column _buildDataValues(TopDeals deal, BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            deal.dataValue ?? '',
            style: context.titleLarge?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kPrimaryTextColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          const Gap(height: 4),
          Text(
            deal.validityPeriod ?? '',
            style: context.titleLarge?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.kPrimaryTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(height: 4),
          Text(
            (deal.price ?? 0).toNaira,
            style: context.titleLarge?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.kPrimaryTextColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ],
      );

  Column _buildTopDealSkeleton(BuildContext context) => Column(
        children: [
          const Gap(height: 24),
          Container(
            height: 10.h,
            margin: EdgeInsets.only(right: context.width * .7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          const Gap(height: 12),
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 14.w,
              crossAxisSpacing: 16.h,
              childAspectRatio: 1.5,
              crossAxisCount: 3,
            ),
            itemBuilder: (_, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
            ),
          ),
        ],
      );

  double _returnChildAspectRatio() {
    switch (category) {
      case BillersCategory.airtime:
        return 1.6.h;
      case BillersCategory.data:
        return 1.0.h;
      case BillersCategory.cable:
        return 1.3.h;
      default:
        return 1.6.h;
    }
  }

  Widget _returnWidget(TopDeals deal, BuildContext context) {
    switch (category) {
      case BillersCategory.airtime:
        return _buildAirtimeValues(deal, context);
      case BillersCategory.data:
        return _buildDataValues(deal, context);
      case BillersCategory.cable:
        return _buildCableValues(deal, context);
      default:
        return const SizedBox.shrink();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../domain/enum/billers_category.dart';
import '../../../../../widgets/bottom_sheet.dart';
import '../../../../../widgets/dialog/guest_modal_sheet.dart';
import '../../../../../widgets/gap.dart';
import 'package:pouchers/ui/features/utilities/presentation/notifier/billers_notifier.dart';
import 'package:pouchers/utils/extension.dart';

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

    return AnimatedSwitcher(
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
                      borderRadius: BorderRadius.circular(10.r),
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
                          physics: const NeverScrollableScrollPhysics(),
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
                                  style: context.headlineLarge?.copyWith(
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
    );
  }

  Column _buildEducationValues(TopDeals deal, BuildContext context) => Column(
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
          Text(
            deal.price.toNaira,
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
        style: context.headlineLarge?.copyWith(
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
            deal.price.toNaira,
            style: context.headlineLarge?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.kPrimaryTextColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
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
      case BillersCategory.education:
        return 1.2.h;
      default:
        return 1.6.h;
    }
  }

  Widget _returnWidget(TopDeals deal, BuildContext context) {
    switch (category) {
      case BillersCategory.airtime:
      case BillersCategory.betting:
        return _buildAirtimeValues(deal, context);
      case BillersCategory.data:
        return _buildDataValues(deal, context);
      case BillersCategory.education:
        return _buildEducationValues(deal, context);
      case BillersCategory.cable:
        return _buildCableValues(deal, context);
      default:
        return const SizedBox.shrink();
    }
  }
}

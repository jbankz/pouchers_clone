import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../profile/presentation/views/wallet/widget/balance_indicator_widget.dart';
import '../../../domain/dto/summary_dto.dart';
import '../widget/utility_icon.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key, required this.summaryDto});

  final SummaryDto summaryDto;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20.w),
        child: Wrap(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UtitlityIcon(image: summaryDto.imageUrl),
                const Gap(height: 5),
                Text(summaryDto.title ?? '',
                    style: context.titleLarge
                        ?.copyWith(color: AppColors.kPrimaryTextColor),
                    textAlign: TextAlign.center),
                const Gap(height: 70),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                  // margin: EdgeInsets.symmetric(horizontal: 16.5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                    color: AppColors.kContainerColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text('Recipient',
                                  style: context.titleLarge
                                      ?.copyWith(color: AppColors.kIconGrey),
                                  textAlign: TextAlign.left)),
                          Expanded(
                              child: Text(summaryDto.recipient ?? '',
                                  style: context.titleLarge?.copyWith(
                                      color: AppColors.kPrimaryColor,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.right)),
                        ],
                      ),
                      const Gap(height: 22),
                      Row(
                        children: [
                          Expanded(
                              child: Text('Amount',
                                  style: context.titleLarge
                                      ?.copyWith(color: AppColors.kIconGrey),
                                  textAlign: TextAlign.left)),
                          Expanded(
                              child: Text(summaryDto.amount?.toNaira ?? '',
                                  style: context.titleLarge?.copyWith(
                                      color: AppColors.kPrimaryTextColor,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.right)),
                        ],
                      ),
                      const Gap(height: 22),
                      Row(
                        children: [
                          Expanded(
                              child: Text('Fee',
                                  style: context.titleLarge
                                      ?.copyWith(color: AppColors.kIconGrey),
                                  textAlign: TextAlign.left)),
                          Expanded(
                              child: Text(summaryDto.fee?.toNaira ?? '',
                                  style: context.titleLarge?.copyWith(
                                      color: AppColors.kPrimaryTextColor),
                                  textAlign: TextAlign.right)),
                        ],
                      ),
                      const Gap(height: 22),
                      Row(
                        children: [
                          Expanded(
                              child: Text('Cashback',
                                  style: context.titleLarge
                                      ?.copyWith(color: AppColors.kIconGrey),
                                  textAlign: TextAlign.left)),
                          Expanded(
                              child: Text(summaryDto.cashBack?.toNaira ?? '',
                                  style: context.titleLarge?.copyWith(
                                      color: AppColors.kPrimaryTextColor),
                                  textAlign: TextAlign.right)),
                        ],
                      )
                    ],
                  ),
                ),
                const Gap(height: 35),
                BalanceIndicatorWidget(amount: summaryDto.amount ?? 0),

                const Gap(height: 35),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     AppString.paymentOption,
                //     style: context.headlineMedium?.copyWith(
                //         color: AppColors.kIconGrey,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 16.sp),
                //     textAlign: TextAlign.left,
                //   ),
                // ),
                // const Gap(height: 20),
                // ListView.separated(
                //     physics: const NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemBuilder: (_, index) {
                //       final element =
                //           [AppString.payWithCard, AppString.payWithUssd][index];
                //       return Container(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: 23.w, vertical: 17.5.h),
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(9.r),
                //             border: Border.all(color: AppColors.kPrimaryColor)),
                //         child: Row(
                //           children: [
                //             const Icon(Icons.radio_button_off_outlined,
                //                 color: AppColors.kPurpleColor400),
                //             const Gap(width: 10),
                //             Flexible(
                //               child: Text(element,
                //                   style: context.headlineMedium?.copyWith(
                //                       color: AppColors.kPrimaryTextColor,
                //                       fontSize: 16.sp,
                //                       fontWeight: FontWeight.w500)),
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //     separatorBuilder: (_, __) => const Gap(height: 18),
                //     itemCount: 2),

                // const Gap(height: 50),
                ElevatedButtonWidget(
                    title: 'Pay ${summaryDto.amount?.toNaira}',
                    onPressed: () => PageRouter.pop(true))
              ],
            )
          ],
        ),
      );
}

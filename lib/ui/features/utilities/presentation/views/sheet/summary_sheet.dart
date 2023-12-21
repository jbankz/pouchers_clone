import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../profile/presentation/views/wallet/widget/balance_indicator_widget.dart';
import '../../../domain/dto/summary_dto.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key, required this.summaryDto});

  final SummaryDto summaryDto;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: walletDao.getListenable(),
      builder: (_, box, __) {
        final bool isAffordable = (summaryDto.amount ?? 0) >
            num.parse(walletDao.retrieve(box).balance ?? '0');

        return SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20.w),
          child: Wrap(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.paleLavenderGray),
                      child: CachedNetworkImage(
                          height: 70.h,
                          width: 70.w,
                          imageUrl: summaryDto.imageUrl ?? '',
                          fit: BoxFit.fill,
                          errorWidget: (_, __, ___) =>
                              const SizedBox.shrink())),
                  const Gap(height: 5),
                  Text(summaryDto.title ?? '',
                      style: context.titleLarge
                          ?.copyWith(color: AppColors.kPrimaryTextColor),
                      textAlign: TextAlign.center),
                  const Gap(height: 70),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
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
                                child: summaryDto.recipientWidget ??
                                    Text(summaryDto.recipient ?? '',
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
                  ElevatedButtonWidget(
                      title: 'Pay ${summaryDto.amount?.toNaira}',
                      onPressed:
                          isAffordable ? null : () => PageRouter.pop(true))
                ],
              )
            ],
          ),
        );
      });
}

import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../common/app_colors.dart';
import '../common/app_images.dart';
import 'gap.dart';

class TicketWidget extends StatelessWidget {
  final String code;
  final String amount;
  final DateTime? date;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const TicketWidget(
      {super.key,
      required this.code,
      required this.amount,
      required this.date,
      this.height,
      this.margin});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          SvgPicture.asset(AppImage.ticket,
              fit: BoxFit.fill, width: double.infinity, height: height?.h),
          Container(
            padding: EdgeInsets.only(right: 23.w, top: 16.h, bottom: 16.h),
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: margin ?? EdgeInsets.only(left: 150.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: SvgPicture.asset(AppImage.miniPoucherLogo)),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Value',
                                style: context.headlineMedium?.copyWith(
                                    fontSize: 6,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.kLightPurple)),
                            const Gap(height: 4),
                            Text(amount,
                                style: context.headlineMedium?.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Gap(height: 40),
                Container(
                  margin: margin ?? EdgeInsets.only(left: 150.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Code',
                                style: context.headlineMedium?.copyWith(
                                    fontSize: 6,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.kLightPurple)),
                            const Gap(height: 4),
                            Text(code,
                                style: context.headlineMedium?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white)),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Expiry',
                                style: context.headlineMedium?.copyWith(
                                    fontSize: 6,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.kLightPurple)),
                            const Gap(height: 4),
                            Text(date?.dateWithSlashes ?? '',
                                style: context.headlineMedium?.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white)),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
}

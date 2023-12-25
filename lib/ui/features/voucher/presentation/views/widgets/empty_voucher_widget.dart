import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';

class EmptyVoucherView extends StatelessWidget {
  const EmptyVoucherView({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 81.h,
            width: 81.w,
            padding: EdgeInsets.all(20.w),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.paleLavenderGray),
            child: SvgPicture.asset(AppImage.voucherIcon,
                color: AppColors.kIconGrey),
          ),
          const Gap(height: 14),
          Text(AppString.emptyVoucher,
              style: context.headlineMedium?.copyWith(
                  color: AppColors.kIconGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14)),
          const Gap(height: 56),
        ],
      );
}

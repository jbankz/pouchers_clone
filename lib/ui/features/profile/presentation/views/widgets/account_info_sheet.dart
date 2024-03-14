import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/core/router/page_router.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../widgets/gap.dart';

class Config {
  final String? title;
  final String? content;
  final String? buttonText;
  final Color? buttonTextColor;

  Config(
      {this.title,
      this.content,
      this.buttonText,
      this.buttonTextColor = AppColors.kPurpleColor});
}

class AccountInfoWindow extends StatelessWidget {
  const AccountInfoWindow({super.key, this.config});

  final Config? config;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 34.h),
            margin: EdgeInsets.symmetric(horizontal: 11.w),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(config?.title ?? '',
                    style: context.titleMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                const Gap(height: 9),
                Text(config?.content ?? '',
                    style: context.titleLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.kIconGrey,
                        fontSize: 16,
                        height: 1.6)),
                const Gap(height: 45),
                Center(
                  child: GestureDetector(
                    onTap: () => PageRouter.pop(true),
                    child: Text(config?.buttonText ?? '',
                        style: context.titleMedium?.copyWith(
                            fontSize: 18,
                            color: config?.buttonTextColor,
                            fontWeight: FontWeight.w700)),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

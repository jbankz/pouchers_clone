import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant/theme_color_constants.dart';
import '../../../utils/strings.dart';
import '../elevated_button_widget.dart';

class GuestMaximumSheet extends StatelessWidget {
  const GuestMaximumSheet({super.key});

  @override
  Widget build(BuildContext context) => Align(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: context.cardColor,
              borderRadius: BorderRadius.circular(kMediumPadding)),
          margin: EdgeInsets.symmetric(horizontal: 11.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kMediumPadding)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(height: 32),
                Text(AppString.joinPouchers,
                    style: context.headlineMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                const Gap(height: 10),
                RichText(
                  text: TextSpan(
                      text: 'The maximum amount for a guest is limited to ',
                      style: context.titleLarge?.copyWith(
                          color: AppColors.kIconGrey,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                            text: '${10000.toNaira.replaceAll('.00', '')}.\n\n',
                            style: context.titleLarge?.copyWith(
                                color: AppColors.kPrimaryTextColor,
                                fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: 'Sign up',
                            style: context.titleLarge?.copyWith(
                                color: AppColors.kPrimaryTextColor,
                                fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: ' or ',
                            style: context.titleLarge?.copyWith(
                                color: AppColors.kIconGrey,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: 'Login',
                            style: context.titleLarge?.copyWith(
                                color: AppColors.kPrimaryTextColor,
                                fontWeight: FontWeight.w700)),
                        TextSpan(
                            text:
                                ' to remove this limit and get amazing cash backs on bill purchases and many other exciting offers.',
                            style: context.titleLarge?.copyWith(
                                color: AppColors.kIconGrey,
                                fontWeight: FontWeight.w400)),
                      ]),
                ),
                const Gap(height: 40),
                ElevatedButtonWidget(
                    title: AppString.createAccountText,
                    onPressed: () => PageRouter.pushNamed(Routes.signUpView)),
                const Gap(height: 16),
                Center(
                  child: GestureDetector(
                      onTap: () => PageRouter.pop(),
                      child: Text(
                        cancel,
                        style: context.displayMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      )),
                )
              ],
            ),
          ),
        ),
      );
}

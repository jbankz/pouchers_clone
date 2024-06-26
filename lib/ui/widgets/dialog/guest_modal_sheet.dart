import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant/theme_color_constants.dart';
import '../elevated_button_widget.dart';

class GuestDiscountSheet extends StatelessWidget {
  const GuestDiscountSheet({super.key});

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
                Container(
                  height: 170.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImage.speaker),
                          fit: BoxFit.contain)),
                ),
                const Gap(height: 25),
                Text(AppString.joinPouchers,
                    style: context.headlineMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: kSmallPadding,
                ),
                RichText(
                  text: TextSpan(
                      text: AppString.joinPouchers1,
                      style: context.titleLarge?.copyWith(
                          color: AppColors.kIconGrey,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                            text: AppString.joinPouchers2,
                            style: context.titleLarge?.copyWith(
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                          text: AppString.joinPouchers3,
                          style: context.titleLarge?.copyWith(
                              color: AppColors.kIconGrey,
                              fontWeight: FontWeight.w400),
                        )
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
                        AppString.cancel,
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

import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../common/app_colors.dart';

class SuccessState extends StatelessWidget {
  final Widget? statusImage;
  final String title;
  final String message;
  final String btnTitle;
  final Function()? tap;

  const SuccessState(
      {super.key,
      this.statusImage,
      this.title = '',
      this.message = '',
      this.btnTitle = '',
      this.tap});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  statusImage ??
                      Lottie.asset(AppImage.success,
                          height: 140.71.h, width: 157.w),
                  const Gap(height: 28),
                  Text(title,
                      style: context.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: AppColors.kPrimaryTextColor)),
                  const Gap(height: 8),
                  Text(message,
                      style: context.headlineMedium
                          ?.copyWith(color: AppColors.kSecondaryTextColor),
                      textAlign: TextAlign.center)
                ],
              )),
              ElevatedButtonWidget(onPressed: tap, title: btnTitle)
            ],
          ),
        ),
      );
}

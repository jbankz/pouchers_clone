import 'dart:io';

import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/app_colors.dart';
import 'notifier/module.dart';

class BiometricView extends ConsumerWidget {
  const BiometricView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 212.h,
                    width: 212.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kBackgroundColor),
                    child: Center(
                      child: Container(
                        height: 164.h,
                        width: 164.w,
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kSecondaryPurple.withOpacity(0.2)),
                        child: SvgPicture.asset(
                            Platform.isAndroid
                                ? AppImage.fingerprint
                                : AppImage.faceId,
                            color: AppColors.kSecondaryPurple),
                      ),
                    ),
                  ),
                  const Gap(height: 28),
                  Text(AppString.enableBiometric,
                      style: context.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: AppColors.kPrimaryTextColor)),
                  const Gap(height: 8),
                  Text(AppString.enableBiometricInstruction,
                      style: context.headlineMedium
                          ?.copyWith(color: AppColors.kSecondaryTextColor),
                      textAlign: TextAlign.center)
                ],
              )),
              ElevatedButtonWidget(
                  onPressed: () =>
                      ref.read(biometricNotifier.notifier).authenticateUser(),
                  title: AppString.proceed),
              const Gap(height: 20),
              InkWell(
                onTap: ref.read(biometricNotifier.notifier).skip,
                child: Text(AppString.skip,
                    style: context.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.kPrimaryTextColor),
                    textAlign: TextAlign.center),
              ),
              const Gap(height: 47),
            ],
          ),
        ),
      );
}

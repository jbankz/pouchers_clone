import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../common/app_colors.dart';
import '../../../../../../../common/app_images.dart';
import '../../../../../../../widgets/gap.dart';
import '../../../domain/enum/currency.dart';
import '../../notifier/card_notifier.dart';
import '../../notifier/module/module.dart';

class BackCardViewWidget extends HookConsumerWidget {
  const BackCardViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(cardNotifierProvider);

    final cardDetail = appState.virtualCardDetails;

    final bool isNairaCurrency =
        ref.watch(paramModule).cardDetail?.currency == Currency.ngn;

    return Container(
        height: 206.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: isNairaCurrency
                ? AppColors.kGreen100Color
                : AppColors.kPurple400,
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
                image: AssetImage(AppImage.ellipses), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(height: 20),
            Container(height: 40.h, color: AppColors.kDeepPurple),
            const Gap(height: 20),
            Container(
                margin: EdgeInsets.only(right: 40.w),
                color: AppColors.silver,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Transform(
                  transform: Matrix4.skewX(0.5),
                  child: Text(cardDetail?.cvv2 ?? '',
                      style: context.headlineMedium
                          ?.copyWith(fontStyle: FontStyle.italic, fontSize: 18),
                      textAlign: TextAlign.left),
                )),
          ],
        ));
  }
}

import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/app_colors.dart';
import '../../../../../../../common/app_images.dart';
import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/elevated_button_widget.dart';
import '../../../../../../../widgets/gap.dart';
import '../../../../../../../widgets/hint_widget.dart';
import 'card_type.dart';

class CardEmptyState extends StatelessWidget {
  const CardEmptyState({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.59.w),
                  child:
                      Image.asset(AppImage.virtualCards, fit: BoxFit.contain)),
              Text(AppString.creationFeeApplies,
                  style: context.titleLarge?.copyWith(
                      fontSize: 12,
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.w700)),
              const Gap(height: 72),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HintWidget(
                      hint: 'Make payments anywhere online',
                      textColor: AppColors.kPrimaryTextColor,
                      widget: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: 'Instantly create a ',
                              style: context.titleLarge?.copyWith(
                                  color: AppColors.kPrimaryTextColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                    text: 'Naira',
                                    style: context.titleLarge?.copyWith(
                                        color: AppColors.kColorGreen,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                TextSpan(
                                    text: " or ",
                                    style: context.titleLarge?.copyWith(
                                        color: AppColors.kPrimaryTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: 'Dollar',
                                    style: context.titleLarge?.copyWith(
                                        color: AppColors.kSecondaryPurple,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                TextSpan(
                                    text: " virtual card",
                                    style: context.titleLarge?.copyWith(
                                        color: AppColors.kPrimaryTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                              ])),
                    ),
                    const Gap(height: 12),
                    HintWidget(
                        hint: AppString.paymentAnyWhere,
                        textColor: AppColors.kPrimaryTextColor),
                    const Gap(height: 12),
                    HintWidget(
                        hint: AppString.manageCards,
                        textColor: AppColors.kPrimaryTextColor),
                  ],
                ),
              ),
              const Gap(height: 77),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ElevatedButtonWidget(
                    title: AppString.createVirtualCard,
                    onPressed: () =>
                        BottomSheets.showSheet(child: const CardTypeWidget())),
              )
            ],
          ),
        ),
      );
}

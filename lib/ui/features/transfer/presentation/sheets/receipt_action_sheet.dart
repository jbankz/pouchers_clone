import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/app_colors.dart';
import '../../../../widgets/gap.dart';

class ReceiptActionSheet extends StatelessWidget {
  final Function() image;
  final Function() pdf;

  const ReceiptActionSheet({super.key, required this.image, required this.pdf});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: context.bottomBackgroundColor),
        child: SafeArea(
          minimum: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16.w,
              right: 16.w),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(height: 8),
                Container(
                  width: 24.w,
                  height: 1.53.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: context.dragHandleColor),
                ),
                const Gap(height: 45),
                InkWell(
                  onTap: () async {
                    await HapticFeedback.selectionClick();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.kContainerColor),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImage.copyIcon),
                        const Gap(width: 10),
                        Flexible(
                            child: Text(
                          'Share Receipt',
                          style: context.headlineMedium?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kPrimaryColor),
                        ))
                      ],
                    ),
                  ),
                ),
                const Gap(height: 22),
              ],
            ),
          ),
        ),
      );

  SingleChildScrollView _buildTempModal(BuildContext context) =>
      SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const Gap(height: 8),
            Container(
              width: 24.w,
              height: 1.53.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: context.dragHandleColor),
            ),
            const Gap(height: 17),
            Text(AppString.share,
                style: context.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 15)),
            const Gap(height: 31),
            Row(
              children: [
                _buildActionButton(
                    context: context,
                    image: AppImage.gallery,
                    title: AppString.image,
                    onTap: image),
                const Gap(width: 23),
                _buildActionButton(
                    context: context,
                    image: AppImage.pdfIcon,
                    title: AppString.pdf,
                    onTap: pdf)
              ],
            )
          ],
        ),
      );

  Expanded _buildActionButton(
          {required BuildContext context,
          required String image,
          required String title,
          required Function() onTap}) =>
      Expanded(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColors.kPrimaryColor),
                borderRadius: BorderRadius.circular(8.r)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(image, height: 18, width: 18),
                const Gap(width: 10),
                Flexible(
                  child: Text(
                    title,
                    style: context.headlineMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kPrimaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

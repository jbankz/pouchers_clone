import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/enum/receipt_type.dart';

class ShareReceiptSheets extends ConsumerStatefulWidget {
  const ShareReceiptSheets({super.key});

  @override
  ConsumerState<ShareReceiptSheets> createState() => _ShareReceiptSheetsState();
}

class _ShareReceiptSheetsState extends ConsumerState<ShareReceiptSheets> {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Wrap(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Align(
                      child: Text(AppString.shareReceipt,
                          style: context.titleMedium?.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w700))),
                  const Gap(height: 21),
                  _buildOptions(
                      title: AppString.downloadPdf,
                      image: AppImage.pdf,
                      context: context,
                      pressed: () => PageRouter.pop(ReceiptType.pdf)),
                  _buildOptions(
                      title: AppString.downloadImage,
                      image: AppImage.image,
                      context: context,
                      pressed: () => PageRouter.pop(ReceiptType.image)),
                  _buildOptions(
                      title: AppString.share,
                      image: AppImage.share,
                      context: context,
                      pressed: () => PageRouter.pop(ReceiptType.share)),
                ],
              ),
            )
          ],
        ),
      );

  InkWell _buildOptions(
          {required String title,
          required String image,
          required BuildContext context,
          required Function() pressed}) =>
      InkWell(
        onTap: () async {
          await HapticFeedback.selectionClick();
          pressed();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
          child: Row(
            children: [
              Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.paleLavenderGray),
                  child: SvgPicture.asset(image, fit: BoxFit.none)),
              const Gap(width: 10),
              Expanded(
                  child: Text(title,
                      style: context.titleMedium?.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400)))
            ],
          ),
        ),
      );
}

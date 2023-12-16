import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_colors.dart';

class UtitlityIcon extends StatelessWidget {
  const UtitlityIcon(
      {super.key,
      this.height = 70,
      this.width = 70,
      this.image,
      this.isSelected = false,
      this.onTap});

  final double? height;
  final double? width;
  final String? image;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height?.h ?? 0)),
        child: Stack(
          children: [
            Container(
              height: height?.h,
              width: width?.w,
              decoration: const BoxDecoration(
                  color: AppColors.kContainerColor, shape: BoxShape.circle),
              child: Center(
                  child: image == null
                      ? const SizedBox.shrink()
                      : CachedNetworkImage(
                          height: 34.h,
                          width: 34.w,
                          imageUrl: image ?? '',
                          fit: BoxFit.fill)),
            ),
            if (isSelected)
              Positioned(
                  top: 50.h,
                  left: 50.w,
                  child: Container(
                    height: 15.h,
                    width: 15.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.kPurpleColor),
                    child:
                        Icon(Icons.check, color: AppColors.white, size: 8.94.w),
                  )),
          ],
        ),
      );
}

import 'package:Pouchers/ui/common/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(
      {super.key,
      required this.image,
      this.initials = '',
      this.onTap,
      this.pickImage});

  final String image;
  final String initials;
  final void Function()? onTap;
  final void Function()? pickImage;
  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: CachedNetworkImage(
              imageUrl: initials,
              imageBuilder: (context, imageProvider) => Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
              placeholder: (context, url) => _buildPlaceHolder(context),
              errorWidget: (context, url, error) => _buildPlaceHolder(context),
            ),
          ),
          if (pickImage != null)
            Positioned(
                bottom: 0,
                left: 60.w,
                child: Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: const BoxDecoration(
                        color: AppColors.kPrimaryColor, shape: BoxShape.circle),
                    child: Icon(Icons.add, color: AppColors.white, size: 16.w)))
        ],
      );

  Container _buildPlaceHolder(BuildContext context) => Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
            border: Border.all(width: 8.w, color: AppColors.kPurple300)),
        padding: EdgeInsets.all(4.w),
        child: Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kPrimaryTextColor.withOpacity(0.05)),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child:
                SvgPicture.asset(AppImage.profile, height: 54.h, width: 54.w),
          ),
        ),
      );
}

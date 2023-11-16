import 'package:Pouchers/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.image, this.initials = ''});

  final String image;
  final String initials;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: initials,
        imageBuilder: (context, imageProvider) => Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => _buildPlaceHolder(context),
        errorWidget: (context, url, error) => _buildPlaceHolder(context),
      );

  Container _buildPlaceHolder(BuildContext context) => Container(
        width: 80.w,
        height: 80.h,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.kPrimaryColor),
        child: Center(
          child: Text(
            initials,
            style: context.headlineMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
          ),
        ),
      );
}

import 'package:Pouchers/ui/common/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
      this.pickImage,
      this.loading = false,
      this.width = 80,
      this.height = 80,
      this.shape = BoxShape.circle,
      this.tag});

  final String image;
  final String initials;
  final void Function()? onTap;
  final void Function()? pickImage;
  final bool loading;
  final double? height;
  final double? width;
  final BoxShape shape;
  final String? tag;

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          Hero(
            tag: tag ?? image,
            child: Material(
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onTap,
                customBorder: const CircleBorder(),
                child: CachedNetworkImage(
                  imageUrl: image,
                  imageBuilder: (context, imageProvider) => Container(
                    width: width?.w,
                    height: height?.h,
                    decoration: BoxDecoration(
                        shape: shape,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  ),
                  placeholder: (context, url) => _buildPlaceHolder(context),
                  errorWidget: (context, url, error) =>
                      _buildPlaceHolder(context),
                ),
              ),
            ),
          ),
          if (pickImage != null)
            Positioned(
              bottom: 0,
              left: 60.w,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: loading
                    ? const CupertinoActivityIndicator()
                    : GestureDetector(
                        onTap: pickImage,
                        child: Container(
                            height: 24.h,
                            width: 24.w,
                            decoration: const BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                shape: BoxShape.circle),
                            child: Icon(Icons.add,
                                color: AppColors.white, size: 16.w)),
                      ),
              ),
            )
        ],
      );

  Container _buildPlaceHolder(BuildContext context) => Container(
        width: width?.w,
        height: height?.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
            border: Border.all(
                width: ((width ?? 0) / 10).w, color: AppColors.kPurple300)),
        padding: EdgeInsets.all(((width ?? 0) / 20).w),
        child: Container(
          width: width?.w,
          height: height?.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 11, 11, 181).withOpacity(0.05)),
          child: Padding(
            padding: EdgeInsets.all(((width ?? 0) / 10).w),
            child:
                SvgPicture.asset(AppImage.profile, height: 54.h, width: 54.w),
          ),
        ),
      );
}

import 'package:pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../widgets/gap.dart';

class FirstSlideWidget extends StatelessWidget {
  final num amount;
  final String title;
  final AlignmentGeometry alignmentGeometry;

  const FirstSlideWidget(
      {super.key,
      this.amount = 0,
      this.title = '',
      this.alignmentGeometry = Alignment.centerLeft});

  @override
  Widget build(BuildContext context) => Container(
        alignment: alignmentGeometry,
        margin: EdgeInsets.only(left: 30.w),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10.w, 5.h, 30.h, 5.w),
              decoration: BoxDecoration(
                  color: context.theme.canvasColor,
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kPrimaryColor.withOpacity(.2),
                      blurRadius: 11.r,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 4), // changes position of shadow
                    )
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(amount.toNaira,
                      style: context.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimaryColor,
                          fontSize: 14.sp)),
                  const Gap(height: 4),
                  Text(title,
                      style: context.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w400),
                      maxLines: 1),
                ],
              ),
            ),
            Positioned(
              top: 25.h,
              left: -35.w,
              child: Container(
                height: 50.h,
                width: 50.w,
                padding: EdgeInsets.all(2.22.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,

                        color: AppColors.kPrimaryColor.withOpacity(.2),
                        blurRadius: 11.r,
                        offset:
                            const Offset(0, 8), // changes position of shadow
                      )
                    ]),
                child: CircleAvatar(
                  backgroundColor: AppColors.paleLavenderGray,
                  child: SvgPicture.asset(AppImage.send),
                ),
              ),
            ),
            Positioned(
                right: -6.w,
                top: 15.h,
                child: Icon(CupertinoIcons.check_mark_circled_solid,
                    color: AppColors.limeGreen, size: 12.sp))
          ],
        ),
      );
}

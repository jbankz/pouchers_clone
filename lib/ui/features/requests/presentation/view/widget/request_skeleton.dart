import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/core/skeleton/styling.dart';
import '../../../../../../app/core/skeleton/widgets.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../widgets/gap.dart';

class RequestSkeleton extends StatelessWidget {
  const RequestSkeleton({super.key});

  @override
  Widget build(BuildContext context) => ListView.separated(
      itemBuilder: (_, index) => Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.kLightPurple),
                borderRadius: BorderRadius.circular(7.r)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SkeletonAvatar(
                    style: SkeletonAvatarStyle(shape: BoxShape.circle)),
                const Gap(width: 15),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 20.h,
                        color: Colors.white),
                    const Gap(height: 4),
                    Container(
                        width: context.width * .3,
                        height: 8.h,
                        color: Colors.white),
                    const Gap(height: 8),
                    Container(
                        width: context.width * .5,
                        height: 6.h,
                        color: Colors.white),
                  ],
                )),
                const Gap(width: 15),
                Container(width: 15.w, height: 15.h, color: Colors.white),
              ],
            ),
          ),
      separatorBuilder: (_, __) => const Gap(height: 6),
      itemCount: context.height.floor());
}

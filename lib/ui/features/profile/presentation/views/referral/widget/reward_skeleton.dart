import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../widgets/gap.dart';

class RewardsSkeleton extends StatelessWidget {
  const RewardsSkeleton({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 84.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          ),
          const Gap(height: 24),
          Container(
            height: 16.h,
            width: context.width * .6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          ),
          const Gap(height: 16),
          Container(
            height: 8.h,
            width: context.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          ),
          const Gap(height: 8),
          Container(
            width: double.infinity,
            height: 256.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          ),
          const Gap(height: 24),
          Container(
            height: 16.h,
            width: context.width * .6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          ),
          const Gap(height: 16),
          Container(
            width: double.infinity,
            height: 84.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          ),
        ],
      );
}

import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/gap.dart';

class TierSkeleton extends StatelessWidget {
  const TierSkeleton({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: context.height * .60,
                  width: 10.w,
                  margin: EdgeInsets.only(bottom: 20.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r)),
                ),
                const Gap(width: 25),
                Flexible(
                  child: Column(
                    children: [
                      ...List.generate(
                          3,
                          (index) => Container(
                                height: 150.h,
                                margin: EdgeInsets.only(bottom: 20.h),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.r)),
                              ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 58.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          )
        ],
      );
}

import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../widgets/gap.dart';

class EducationSkeleton extends StatelessWidget {
  const EducationSkeleton({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                    height: 10.h,
                    margin: EdgeInsets.only(right: context.width * .7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r))),
                const Gap(height: 12),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r)),
                ),
                const Gap(height: 24),
                Container(
                    height: 10.h,
                    margin: EdgeInsets.only(right: context.width * .7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r))),
                const Gap(height: 12),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r)),
                ),
                const Gap(height: 24),
                Container(
                    height: 10.h,
                    margin: EdgeInsets.only(right: context.width * .7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r))),
                const Gap(height: 12),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r)),
                ),
              ],
            ),
          ),
          const Gap(height: 16),
          Container(
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
          ),
        ],
      );
}

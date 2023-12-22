import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../widgets/gap.dart';
import '../../widget/utility_icon.dart';

class BettingSkeleton extends StatelessWidget {
  const BettingSkeleton({super.key});

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
                        borderRadius: BorderRadius.circular(12.r))),
                const Gap(height: 24),
                Container(
                    height: 10.h,
                    margin: EdgeInsets.only(right: context.width * .7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r))),
                const Gap(height: 12),
                GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 14.w,
                        crossAxisSpacing: 16.h,
                        childAspectRatio: 1.5,
                        crossAxisCount: 3),
                    itemBuilder: (_, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white))),
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
          Container(
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
          ),
        ],
      );
}

import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../widgets/gap.dart';

class AnalyticsSkeleton extends StatelessWidget {
  const AnalyticsSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          Container(width: context.width, height: 100.h, color: Colors.white),
          const Gap(height: 28),
          Container(
            width: context.width,
            height: 20.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          ),
          const Gap(height: 14),
          Container(
            width: context.width,
            height: 20.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          ),
          const Gap(height: 24),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, __) => Row(
                    children: [
                      Container(
                        width: 22.w,
                        height: 22.h,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                      const Gap(width: 14),
                      Expanded(
                        child: Container(
                            width: double.infinity,
                            height: 22.h,
                            color: Colors.white),
                      ),
                      const Gap(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              width: 50.w, height: 12.h, color: Colors.white),
                          const Gap(height: 4),
                          Container(
                              width: 25.w, height: 6.h, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
              separatorBuilder: (_, __) => const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [Gap(height: 12), Divider(), Gap(height: 12)],
                  ),
              itemCount: 8)
        ],
      );
}

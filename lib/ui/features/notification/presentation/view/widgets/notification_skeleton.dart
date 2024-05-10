import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/gap.dart';

class NotificationSkeleton extends StatelessWidget {
  const NotificationSkeleton({super.key});

  @override
  Widget build(BuildContext context) => ListView.separated(
      itemBuilder: (_, __) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(backgroundColor: Colors.white, radius: 10.r),
              const Gap(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 23.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r)),
                        width: double.infinity),
                    const Gap(height: 8),
                    Container(
                        height: 8.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r)),
                        width: context.width / 3),
                  ],
                ),
              )
            ],
          ),
      separatorBuilder: (_, __) => const Column(
            children: [
              Gap(height: 15),
              Divider(),
              Gap(height: 15),
            ],
          ),
      itemCount: 100);
}

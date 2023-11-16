import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlidersWidget extends StatelessWidget {
  const SlidersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 146.h,
      child: PageView.builder(
          clipBehavior: Clip.none,
          onPageChanged: (value) {},
          controller: PageController(viewportFraction: .9),
          itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.only(right: index == 0 ? 8.w : 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.primaries[index]),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(AppImage.coin, height: 116.h)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 22.h, 40.w, 26.h),
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Special discount when\nyou recharge\ntoday!',
                                  style: context.headlineLarge?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp),
                                ),
                                const Gap(height: 8),
                                Text(
                                  'Get 50% discount for every airtime\nyou buy.',
                                  style: context.headlineLarge?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )));
}

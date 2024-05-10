import 'package:pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../widgets/gap.dart';

class SchedulingWidget extends StatelessWidget {
  final String title;
  final String description;
  final Function() tapped;

  const SchedulingWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.tapped});
  @override
  Widget build(BuildContext context) => CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: tapped,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.kLightPurple)),
          child: Row(
            children: [
              SvgPicture.asset(AppImage.sync, color: AppColors.kColorOrange100),
              const Gap(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: context.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 14)),
                    Text(description,
                        style: context.titleMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.kIconGrey)),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

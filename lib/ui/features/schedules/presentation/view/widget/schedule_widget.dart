import 'package:Pouchers/ui/features/schedules/domain/model/schedule_model.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../widgets/gap.dart';
import '../../../../../widgets/profile_image.dart';

class ScheduledWidget extends StatelessWidget {
  const ScheduledWidget({super.key, this.schedule, this.tapped});

  final Function()? tapped;
  final ScheduleModel? schedule;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: tapped,
        borderRadius: BorderRadius.circular(7.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(7.r),
              border: Border.all(color: AppColors.kLightPurple)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileImage(
                  tag: schedule?.createdAt?.toIso8601String(),
                  image: '',
                  height: 47,
                  width: 47),
              const Gap(width: 15),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                    Text(
                        schedule?.beneficiaryAccountName?.titleCase ??
                            schedule?.recipient ??
                            '',
                        style: context.headlineMedium?.copyWith(
                            color: AppColors.kPurpleColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    const Gap(height: 3),
                    Text(schedule?.category?.value.removeHyphen.titleCase ?? '',
                        style: context.headlineMedium?.copyWith(
                            fontSize: 14,
                            color: AppColors.kSecondaryTextColor,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const Gap(height: 13),
                    Text(schedule?.frequency ?? '',
                        style: context.headlineMedium?.copyWith(
                            fontSize: 14,
                            color: AppColors.kIconGrey,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis),
                  ])),
            ],
          ),
        ),
      );
}

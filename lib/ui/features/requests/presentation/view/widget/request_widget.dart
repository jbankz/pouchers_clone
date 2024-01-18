import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../widgets/gap.dart';
import '../../../../../widgets/profile_image.dart';
import '../../../domain/model/request_model.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({super.key, this.request, this.showStatus = true});

  final RequestModel? request;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    final String fullName =
        '${request?.firstName ?? ''} ${request?.lastName ?? ''}';
    return Container(
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
              image: request?.profilePicture ?? '', height: 47, width: 47),
          const Gap(width: 15),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                Text(fullName.titleCase,
                    style: context.headlineMedium
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
                const Gap(height: 3),
                Text(request?.amount.toNaira ?? '',
                    style: context.headlineMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.kPurpleColor,
                        fontWeight: FontWeight.w400)),
                if (request?.note != null) const Gap(height: 8),
                if (request?.note != null)
                  Text('Note: ${request?.note ?? ''}',
                      style: context.headlineMedium?.copyWith(
                          fontSize: 14,
                          color: AppColors.kIconGrey,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)
              ])),
          const Gap(width: 15),
          Visibility(
            visible: showStatus,
            replacement: const Icon(Icons.navigate_next_outlined,
                color: AppColors.kLightColor200),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 4.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.kLightPurple),
              child: Text('Paid',
                  style: context.headlineMedium?.copyWith(
                      fontSize: 12,
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.w400)),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/gap.dart';

class LogoutPrompt extends StatelessWidget {
  const LogoutPrompt({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 54.h),
            margin: EdgeInsets.symmetric(horizontal: 11.w),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Logout',
                    style: context.titleMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                const Gap(height: 9),
                Text(AppString.logOutPrompt,
                    style: context.titleMedium?.copyWith(
                        fontSize: 16,
                        color: AppColors.kIconGrey,
                        fontWeight: FontWeight.w400)),
                const Gap(height: 29),
                Align(
                  alignment: Alignment.bottomRight,
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 350),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => PageRouter.pop(),
                          child: Text(AppString.cancel,
                              style: context.titleMedium?.copyWith(
                                  fontSize: 16,
                                  color: AppColors.kSecondaryTextColor,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const Gap(width: 45),
                        Flexible(
                          child: GestureDetector(
                            onTap: () => PageRouter.pop(true),
                            child: Text(AppString.confirm,
                                style: context.titleMedium?.copyWith(
                                    fontSize: 16,
                                    color: AppColors.kLightOrange,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

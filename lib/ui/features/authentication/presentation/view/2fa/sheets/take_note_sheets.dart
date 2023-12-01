import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../common/app_colors.dart';
import '../../../../../../widgets/gap.dart';

class TakeNoteSheets extends StatelessWidget {
  const TakeNoteSheets({super.key, this.turnOff = false});

  final bool turnOff;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 34.h),
            margin: EdgeInsets.symmetric(horizontal: 11.w),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(turnOff ? 'Urgent!' : 'Take note!',
                    style: context.titleMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                const Gap(height: 9),
                Text(
                    turnOff
                        ? 'Turning off 2FA is not advisable. Your account could be open to unauthorized access if your PIN or password is compromised. Are you really sure about this?'
                        : 'Make sure you keep the answers to your security questions safe. You\'ll need them to make security-related changes to your account when necessary.',
                    style: context.titleLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.kIconGrey,
                        fontSize: 16,
                        height: 1.6)),
                const Gap(height: 45),
                Center(
                  child: GestureDetector(
                    onTap: () => PageRouter.pop(turnOff),
                    child: Text(
                        turnOff ? 'Yes, turn it off' : 'Ok, i understand',
                        style: context.titleMedium?.copyWith(
                            fontSize: 18,
                            color: turnOff
                                ? AppColors.kColorRed
                                : AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

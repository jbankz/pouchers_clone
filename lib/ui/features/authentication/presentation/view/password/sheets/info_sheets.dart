import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/gap.dart';
import '../enum/password_confirmation_type.dart';

class ConfirmationPasswordSheet extends StatefulWidget {
  const ConfirmationPasswordSheet(
      {super.key,
      this.passwordConfirmationType = PasswordConfirmationType.disable});

  final PasswordConfirmationType? passwordConfirmationType;

  @override
  State<ConfirmationPasswordSheet> createState() =>
      _ConfirmationPasswordSheetState();
}

class _ConfirmationPasswordSheetState extends State<ConfirmationPasswordSheet> {
  bool _isDeleteAccount = false;

  @override
  void initState() {
    super.initState();
    _isDeleteAccount =
        widget.passwordConfirmationType == PasswordConfirmationType.delete;
  }

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
                Text('Please confirm',
                    style: context.titleMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                const Gap(height: 9),
                Text(
                    _isDeleteAccount
                        ? 'Deleting your account will lock you out of the Pouchers ecosystem.\n\nTo enable your account, you have to create a new one.'
                        : 'Disabling your account will lock you out of the Pouchers ecosystem.\n\nTo re-enable your account, please contact support.',
                    style: context.titleLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.kIconGrey,
                        fontSize: 16,
                        height: 1.6)),
                const Gap(height: 45),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => PageRouter.pop(),
                        child: Text(AppString.cancel,
                            style: context.titleMedium?.copyWith(
                                fontSize: 18,
                                color: AppColors.kSecondaryTextColor,
                                fontWeight: FontWeight.w600)),
                      ),
                      const Gap(width: 45),
                      Flexible(
                        child: GestureDetector(
                          onTap: () => PageRouter.pop(true),
                          child: Text(
                              _isDeleteAccount ? 'Delete' : 'Yes, Disable',
                              style: context.titleMedium?.copyWith(
                                  fontSize: 18,
                                  color: AppColors.kDanger,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

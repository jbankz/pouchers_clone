import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_colors.dart';
import 'virtual_key_pad_controller.dart';

class AccountPinCodeField extends StatelessWidget {
  const AccountPinCodeField(
      {super.key,
      required this.virtualKeyPadController,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.hasError = false});

  final VirtualKeyPadController virtualKeyPadController;
  final bool hasError;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) => Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      children: List.generate(
          virtualKeyPadController.pinCount,
          (index) => Container(
                height: 20.h,
                width: 20.w,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            hasError ? AppColors.kDanger : Colors.transparent),
                    color: AppColors.kGreyScale,
                    shape: BoxShape.circle),
                child: Center(
                  child: Container(
                    height: 4.75.h,
                    width: 4.75.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: virtualKeyPadController.pins[index].isNotEmpty
                            ? AppColors.kPrimaryBlack
                            : AppColors.kGreyScale),
                  ),
                ),
              )));
}

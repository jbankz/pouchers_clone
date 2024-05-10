import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';

class DeleteScheduleWidget extends StatelessWidget {
  const DeleteScheduleWidget(
      {super.key, required this.onTap, this.enabled = false});

  final void Function()? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    if (!enabled) return const SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(height: 25),
        InkWell(
            onTap: onTap,
            child: Text(AppString.deleteSchedule,
                style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.kLightOrange))),
      ],
    );
  }
}

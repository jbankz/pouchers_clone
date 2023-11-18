import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/app_colors.dart';

class AccountSettingsTile extends StatelessWidget {
  final Function() tapped;
  final String title;
  final String? desc;
  final Color? color;

  const AccountSettingsTile(
      {super.key,
      required this.title,
      this.desc,
      required this.tapped,
      this.color});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: tapped,
        child: Row(
          children: [
            Expanded(
              child: desc != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: context.headlineMedium?.copyWith(
                                color: color,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        const Gap(height: 1),
                        Text(desc ?? '',
                            style: context.displaySmall?.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400))
                      ],
                    )
                  : Text(title,
                      style: context.headlineMedium?.copyWith(
                          color: color,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
            ),
            const Icon(Icons.navigate_next, color: AppColors.kIconGrey)
          ],
        ),
      );
}

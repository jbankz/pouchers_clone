import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/app_colors.dart';
import 'gap.dart';

class HintWidget extends StatelessWidget {
  const HintWidget(
      {super.key,
      required this.hint,
      this.textColor = AppColors.kIconGrey,
      this.widget,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  final String hint;
  final Color textColor;
  final Widget? widget;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          SvgPicture.asset(AppImage.comment),
          const Gap(width: 15),
          Flexible(
              child: widget ??
                  Text(hint,
                      style: context.titleLarge?.copyWith(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)))
        ],
      );
}

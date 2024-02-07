import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyRequestState extends StatelessWidget {
  const EmptyRequestState({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(height: 186),
          SvgPicture.asset(AppImage.emptyRequest),
          const Gap(height: 14),
          Text(AppString.emptyRequest,
              style: context.headlineMedium
                  ?.copyWith(color: AppColors.kIconGrey, fontSize: 16))
        ],
      );
}

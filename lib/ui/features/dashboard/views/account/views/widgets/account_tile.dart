import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../widgets/gap.dart';

class AccountTile extends StatelessWidget {
  final String title;
  final String icon;
  final String? desc;
  final Function() tapped;
  final Color? color;

  const AccountTile(
      {super.key,
      required this.title,
      required this.icon,
      this.desc,
      this.color,
      required this.tapped});

  @override
  Widget build(BuildContext context) => CupertinoButton(
        onPressed: tapped,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color?.withOpacity(.10) ?? AppColors.kBackgroundColor),
              child: SvgPicture.asset(icon, fit: BoxFit.scaleDown),
            ),
            const Gap(width: 10),
            desc != null
                ? Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: context.headlineMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: color),
                          textAlign: TextAlign.left,
                        ),
                        const Gap(height: 1),
                        Text(
                          desc ?? '',
                          style: context.titleLarge?.copyWith(fontSize: 12),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                : Text(title,
                    style: context.headlineMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: color),
                    textAlign: TextAlign.left),
          ],
        ),
      );
}

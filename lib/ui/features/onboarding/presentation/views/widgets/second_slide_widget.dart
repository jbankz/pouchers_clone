import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../widgets/gap.dart';

class SecondSlideWidget extends StatelessWidget {
  final num amount;
  final String title;
  final String asset;
  final AlignmentGeometry alignmentGeometry;
  final Color border;

  const SecondSlideWidget(
      {super.key,
      this.amount = 0,
      this.asset = '',
      this.title = '',
      this.border = Colors.transparent,
      this.alignmentGeometry = Alignment.centerLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignmentGeometry,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: context.theme.canvasColor,
            borderRadius: BorderRadius.circular(13.r),
            border: Border.all(color: border, width: .5.w)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(asset),
            const Gap(width: 10),
            Text(amount.toNaira,
                style:
                    context.titleSmall?.copyWith(fontWeight: FontWeight.w500)),
            const Gap(width: 4),
            Text(title,
                style: context.headlineSmall
                    ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
                maxLines: 1),
          ],
        ),
      ),
    );
  }
}

import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedLineWidget extends StatelessWidget {
  const DottedLineWidget(
      {super.key,
      this.height = 1,
      this.color = AppColors.kLightColor200,
      this.dashWidth = 5.0,
      this.shape = BoxShape.rectangle});

  final double height;
  final double dashWidth;
  final Color color;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashHeight = height.h;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(
                dashCount,
                (_) => SizedBox(
                      width: dashWidth,
                      height: dashHeight,
                      child: DecoratedBox(
                          decoration:
                              BoxDecoration(color: color, shape: shape)),
                    )),
          );
        },
      );
}

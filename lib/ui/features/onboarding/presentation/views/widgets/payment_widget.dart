import 'package:pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../widgets/gap.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget(
      {super.key,
      required this.animationController,
      required this.onPressed,
      required this.asset,
      required this.title});
  final void Function()? onPressed;
  final String title;
  final String asset;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: animationController,
        child: ScaleTransition(
          scale: Tween(begin: 0.75, end: 1.0).animate(CurvedAnimation(
              parent: animationController, curve: Curves.bounceInOut)),
          child: SizedBox(
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 28.r,
                    backgroundColor: AppColors.kColorBackgroundLight,
                    child: SvgPicture.asset(asset),
                  ),
                  const Gap(height: 16),
                  Text(title,
                      style: context.headlineMedium?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black))
                ],
              ),
            ),
          ),
        ),
      );
}

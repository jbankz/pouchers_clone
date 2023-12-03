import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_strings.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {super.key,
      required this.onPressed,
      this.title = '',
      this.height = 48,
      this.width = double.infinity,
      this.loading = false,
      this.padding = EdgeInsets.zero,
      this.bacgroundColor,
      this.outlinedColor});

  final double? height;
  final double? width;
  final String title;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  final bool loading;
  final Color? bacgroundColor;
  final Color? outlinedColor;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: SizedBox(
          height: height?.h,
          width: width,
          child: switch (loading) {
            true => _buildLoadingButtonState(context),
            false => _buildButtonState(context)
          },
        ),
      );

  ElevatedButton _buildButtonState(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            side: outlinedColor == null
                ? MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(color: Colors.transparent))
                : MaterialStateBorderSide.resolveWith(
                    (states) => BorderSide(color: outlinedColor!)),
            backgroundColor: bacgroundColor == null
                ? context.buttonBackgroundColor
                : MaterialStateColor.resolveWith((states) => bacgroundColor!)),
        child: Text(title),
      );

  ElevatedButton _buildLoadingButtonState(BuildContext context) =>
      ElevatedButton.icon(
        onPressed: null,
        icon: const CupertinoActivityIndicator(color: AppColors.white),
        label: Text(AppString.wait),
        style: ButtonStyle(
            side: outlinedColor == null
                ? MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(color: Colors.transparent))
                : MaterialStateBorderSide.resolveWith((states) =>
                    BorderSide(color: outlinedColor!.withOpacity(.2))),
            backgroundColor: bacgroundColor == null
                ? context.buttonBackgroundColor
                : MaterialStateColor.resolveWith(
                    (states) => bacgroundColor!.withOpacity(.2))),
      );
}

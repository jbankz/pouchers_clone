import 'package:Pouchers/ui/common/app_colors.dart';
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
      this.padding = EdgeInsets.zero});

  final double? height;
  final double? width;
  final String title;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  final bool loading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: SizedBox(
            height: height?.h,
            width: width,
            child: loading
                ? ElevatedButton.icon(
                    onPressed: null,
                    icon: const CupertinoActivityIndicator(
                        color: AppColors.white),
                    label: Text(AppString.wait))
                : ElevatedButton(onPressed: onPressed, child: Text(title))),
      );
}

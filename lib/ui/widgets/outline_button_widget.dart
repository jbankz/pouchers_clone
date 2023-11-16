import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget(
      {super.key,
      required this.onPressed,
      this.title = '',
      this.height = 48,
      this.width = double.infinity});

  final double? height;
  final double? width;
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height?.h,
      width: width,
      child: OutlinedButton(onPressed: onPressed, child: Text(title)));
}

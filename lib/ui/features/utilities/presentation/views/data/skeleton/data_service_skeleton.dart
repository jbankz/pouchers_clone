import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataServiceSkeleton extends StatelessWidget {
  const DataServiceSkeleton({super.key});

  @override
  Widget build(BuildContext context) => ListView.separated(
      itemBuilder: (_, index) => Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r), color: Colors.white)),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: 10);
}

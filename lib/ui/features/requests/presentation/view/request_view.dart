import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tabs/completed_request.dart';
import 'tabs/pending_request.dart';

class RequestView extends StatelessWidget {
  const RequestView({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.kPurpleColor800,
          appBar: AppBar(
              backgroundColor: AppColors.kPurpleColor800,
              bottom: const TabBar(tabs: [Text('Completed'), Text('Pending')]),
              title: const Text("Requests")),
          body: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: const TabBarView(
                  children: [CompletedRequestView(), PendingRequestView()])),
        ),
      );
}

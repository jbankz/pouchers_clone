import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
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
              bottom: TabBar(tabs: [
                Text(AppString.completed),
                Text(AppString.pendingOne)
              ]),
              title: Text(AppString.request)),
          body: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: const TabBarView(
                  children: [CompletedRequestView(), PendingRequestView()])),
        ),
      );
}

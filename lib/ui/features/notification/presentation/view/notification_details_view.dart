import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_strings.dart';
import '../../../../widgets/gap.dart';
import '../../domain/model/notification_model.dart';

class NotificationDetailsView extends StatelessWidget {
  const NotificationDetailsView({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppString.notification)),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView(
            children: [
              Text(notificationModel.title ?? '',
                  style: context.headlineMedium
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis),
              const Gap(height: 16),
              Text(notificationModel.body ?? '',
                  style: context.headlineMedium?.copyWith(
                      color: AppColors.kSecondaryTextColor,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      );
}

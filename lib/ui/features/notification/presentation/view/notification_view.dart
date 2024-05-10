import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/notification/data/dao/notification_dao.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../../app/core/skeleton/widgets.dart';
import '../../../../widgets/gap.dart';
import '../notifier/notification_notifier.dart';
import 'widgets/notification_skeleton.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class NotificationView extends ConsumerStatefulWidget {
  const NotificationView({super.key});

  @override
  ConsumerState<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends ConsumerState<NotificationView> {
  late NotificationNotifier _notificationNotifier;

  final CancelToken _cancelToken = CancelToken();

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _notificationNotifier = ref.read(notificationNotifierProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) => _refreshNotification());
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  Future<void> _refreshNotification() async {
    try {
      _notificationNotifier.resetPageCount();
      await _notificationNotifier.fetchNotifications(cancelToken: _cancelToken);
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  Future<void> _paginateNotification() async {
    try {
      _notificationNotifier.increamentPageCount();
      await _notificationNotifier.fetchNotifications(cancelToken: _cancelToken);
      _refreshController.loadComplete();
    } catch (e) {
      _refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final notificationState = ref.watch(notificationNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppString.notification)),
      body: ValueListenableBuilder<Box>(
          valueListenable: notificationDao.getListenable(),
          builder: (_, box, __) {
            final notifications = notificationDao.retrieve(box);
            return SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: notificationDao.unreadMessages.isNotEmpty,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            child: Text(AppString.markAllAsRead,
                                style: context.headlineMedium?.copyWith(
                                    color: AppColors.kPurpleColor,
                                    fontSize: 12)),
                            onTap: () =>
                                _notificationNotifier.readAllNotification(
                                    cancelToken: _cancelToken)),
                        const Gap(height: 20),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Skeleton(
                      isLoading: notificationState.isBusy,
                      skeleton: const NotificationSkeleton(),
                      child: SmartRefresher(
                        controller: _refreshController,
                        enablePullUp: true,
                        onRefresh: _refreshNotification,
                        onLoading: _paginateNotification,
                        child: ListView.separated(
                            itemBuilder: (_, index) {
                              final notification = notifications[index];
                              return CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  _notificationNotifier.readNotification(
                                      notification,
                                      cancelToken: _cancelToken);

                                  PageRouter.pushNamed(
                                      Routes.notificationDetailsView,
                                      args: NotificationDetailsViewArguments(
                                          notificationModel: notification));
                                },
                                color: Colors.transparent,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 10.h,
                                        width: 10.w,
                                        margin: EdgeInsets.only(top: 5.h),
                                        decoration: BoxDecoration(
                                            color: notification.isRead
                                                ? AppColors.kLightColor200
                                                : AppColors.limeGreen,
                                            shape: BoxShape.circle)),
                                    const Gap(width: 8),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(notification.title ?? '',
                                              style: context.headlineMedium
                                                  ?.copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis),
                                          const Gap(height: 8),
                                          Text(
                                              notification
                                                      .createdAt?.monthTime ??
                                                  '',
                                              style: context.headlineMedium
                                                  ?.copyWith(
                                                      color: AppColors
                                                          .kSecondaryTextColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (_, __) => const Column(
                                    children: [
                                      Gap(height: 15),
                                      Divider(),
                                      Gap(height: 15)
                                    ]),
                            itemCount: notifications.length),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

import 'package:Pouchers/ui/features/notification/domain/dto/notification_dto.dart';
import 'package:Pouchers/ui/features/notification/domain/model/notification_data_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/unread_payment_request.dart';
import '../../../domain/usecase/module/module.dart';

part 'module.g.dart';

@riverpod
Future<NotificationDataModel> notification(
        NotificationRef ref, NotificationDto notificationDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(getNotificationUseCaseModule)
        .execute(parameter: notificationDto, cancelToken: cancelToken);

@riverpod
Future<bool> readNotification(ReadNotificationRef ref, String notificationId,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(readNotificationUseCaseModule)
        .execute(parameter: notificationId, cancelToken: cancelToken);

@riverpod
Future<UnreadPaymentRequest> unreadPaymentNotification(
        UnreadPaymentNotificationRef ref,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(getUnreadPaymentNotificationUseCaseModule)
        .execute(cancelToken);

@riverpod
Future<bool> readAllNotification(ReadAllNotificationRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(readAllNotificationUseCaseModule).execute(cancelToken);

import 'package:Pouchers/ui/features/notification/domain/model/notification_data_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/module/module.dart';

part 'module.g.dart';

@riverpod
Future<NotificationDataModel> notification(NotificationRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(getNotificationUseCaseModule).execute(cancelToken);

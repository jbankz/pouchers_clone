import 'package:dio/dio.dart';

import '../../domain/model/notification_data_model.dart';

abstract class NotificationSource {
  Future<NotificationDataModel> notifications({CancelToken? cancelToken});
}

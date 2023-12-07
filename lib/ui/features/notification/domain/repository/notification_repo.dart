import 'package:dio/dio.dart';

import '../model/notification_data_model.dart';

abstract class NotificationRepo {
  Future<NotificationDataModel> notifications({CancelToken? cancelToken});
}

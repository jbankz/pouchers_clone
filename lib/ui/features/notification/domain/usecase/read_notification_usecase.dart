import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/notification_repo.dart';

class ReadNotificationUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<String, bool> {
  final NotificationRepo _notificationRepo;

  ReadNotificationUseCaseImpl(this._notificationRepo);

  @override
  Future<bool?> execute(
          {required String parameter, CancelToken? cancelToken}) async =>
      await _notificationRepo.readNotification(parameter,
          cancelToken: cancelToken);
}

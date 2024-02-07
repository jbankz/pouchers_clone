import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/notification_repo.dart';

class ReadAllNotificationUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<bool>> {
  final NotificationRepo _notificationRepo;

  ReadAllNotificationUseCaseImpl(this._notificationRepo);

  @override
  Future<bool> execute([CancelToken? cancelToken]) async =>
      await _notificationRepo.readAllNotification(cancelToken: cancelToken);
}

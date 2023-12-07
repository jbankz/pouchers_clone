import 'package:Pouchers/ui/features/notification/domain/model/notification_data_model.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/notification_repo.dart';

class NotificationUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<NotificationDataModel>> {
  final NotificationRepo _notificationRepo;

  NotificationUseCaseImpl(this._notificationRepo);

  @override
  Future<NotificationDataModel> execute([CancelToken? cancelToken]) async =>
      await _notificationRepo.notifications(cancelToken: cancelToken);
}

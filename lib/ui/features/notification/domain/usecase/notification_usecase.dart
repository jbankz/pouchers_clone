import 'package:pouchers/ui/features/notification/domain/model/notification_data_model.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../dto/notification_dto.dart';
import '../repository/notification_repo.dart';

class NotificationUseCaseImpl
    implements
        PoucherUseCaseWithRequiredParam<NotificationDto,
            NotificationDataModel> {
  final NotificationRepo _notificationRepo;

  NotificationUseCaseImpl(this._notificationRepo);

  @override
  Future<NotificationDataModel?> execute(
          {required NotificationDto parameter,
          CancelToken? cancelToken}) async =>
      await _notificationRepo.notifications(parameter,
          cancelToken: cancelToken);
}

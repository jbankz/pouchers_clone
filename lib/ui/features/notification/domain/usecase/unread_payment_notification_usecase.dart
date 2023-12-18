import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../model/unread_payment_request.dart';
import '../repository/notification_repo.dart';

class UnreadPaymentNotificationUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<UnreadPaymentRequest>> {
  final NotificationRepo _notificationRepo;

  UnreadPaymentNotificationUseCaseImpl(this._notificationRepo);

  @override
  Future<UnreadPaymentRequest> execute([CancelToken? cancelToken]) async =>
      await _notificationRepo.unReadPaymentNotification(
          cancelToken: cancelToken);
}

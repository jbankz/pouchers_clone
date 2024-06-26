import 'package:pouchers/ui/features/notification/domain/model/notification_data_model.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/network/api_path.dart';
import '../../../../../app/core/network/network_service.dart';
import '../../domain/dto/notification_dto.dart';
import '../../domain/model/unread_payment_request.dart';
import 'notification_source.dart';

class NotificationSourceImpl implements NotificationSource {
  final NetworkService networkService;

  NotificationSourceImpl({required this.networkService});

  @override
  Future<NotificationDataModel> notifications(NotificationDto notificationDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.notification,
        requestType: RequestType.get,
        queryParams: notificationDto.toQuery(),
        cancelToken: cancelToken);

    return NotificationDataModel.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<bool> readNotification(String notificationId,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.notification}/$notificationId',
        requestType: RequestType.patch,
        cancelToken: cancelToken);

    return response.statusCode == 200;
  }

  @override
  Future<UnreadPaymentRequest> unReadPaymentNotification(
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.notification}/unread-payment-request',
        requestType: RequestType.get,
        cancelToken: cancelToken);

    return UnreadPaymentRequest.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<bool> readAllNotification({CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.notification}/read-all',
        requestType: RequestType.patch,
        cancelToken: cancelToken);

    return response.statusCode == 200;
  }
}

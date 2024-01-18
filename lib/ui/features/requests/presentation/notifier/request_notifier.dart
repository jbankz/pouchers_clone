import 'package:Pouchers/ui/features/notification/data/dao/notification_dao.dart';
import 'package:Pouchers/ui/features/notification/domain/dto/notification_dto.dart';
import 'package:Pouchers/ui/features/notification/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/features/notification/presentation/view/state/notification_state.dart';
import 'package:Pouchers/ui/features/requests/data/dao/request_sent_dao.dart';
import 'package:Pouchers/ui/features/requests/domain/dto/request_dto.dart';
import 'package:Pouchers/ui/features/requests/domain/model/request_model.dart';
import 'package:Pouchers/ui/features/requests/presentation/notifier/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../data/dao/request_received_dao.dart';
import '../../domain/enum/request_type.dart';
import '../state/request_state.dart';

part 'request_notifier.g.dart';

@riverpod
class RequestNotifier extends _$RequestNotifier {
  final _logger = getLogger('RequestNotifier');

  List<RequestModel> _requests = [];

  int _page = 1;

  @override
  RequestState build() => RequestState(requests: _requests);

  void increamentPageCount() => _page++;

  void resetPageCount() => _page = 1;

  Future<void> fetchRequests(
      {required RequestType requestType,
      String? status,
      CancelToken? cancelToken}) async {
    try {
      state = state.copyWith(
          isBusy: requestType == RequestType.sent
              ? requestSentDao.box.isEmpty
              : requestReceivedDao.box.isEmpty);

      _requests = await ref.read(requestsProvider
          .call(
              RequestDto(page: _page, requestType: requestType, status: status),
              cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false, requests: _requests);
    }
  }
}

import 'package:pouchers/ui/features/requests/data/dao/request_sent_dao.dart';
import 'package:pouchers/ui/features/requests/domain/dto/request_dto.dart';
import 'package:pouchers/ui/features/requests/domain/enum/request_type.dart';
import 'package:pouchers/ui/features/requests/domain/model/request_model.dart';
import 'package:pouchers/ui/features/requests/domain/model/requested_money_model.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/request_repo.dart';
import '../dao/request_received_dao.dart';
import '../source/request_source.dart';

class RequestRepoImpl implements RequestRepo {
  final RequestSource _requestSource;

  RequestRepoImpl({required RequestSource requestSource})
      : _requestSource = requestSource;

  @override
  Future<List<RequestModel>> requests(RequestDto requestDto,
      {CancelToken? cancelToken}) async {
    final requests =
        await _requestSource.requests(requestDto, cancelToken: cancelToken);

    requestDto.requestType == RequestType.sent
        ? requestSentDao.save(requests, clear: requestDto.page == 1)
        : requestReceivedDao.save(requests, clear: requestDto.page == 1);

    return requests;
  }

  @override
  Future<RequestedMoneyModel> requestedMoney(RequestDto requestDto,
          {CancelToken? cancelToken}) async =>
      await _requestSource.requestedMoney(requestDto, cancelToken: cancelToken);
}

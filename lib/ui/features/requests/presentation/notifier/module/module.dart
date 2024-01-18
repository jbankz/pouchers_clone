import 'package:Pouchers/ui/features/requests/domain/dto/request_dto.dart';
import 'package:Pouchers/ui/features/requests/domain/model/request_model.dart';
import 'package:Pouchers/ui/features/requests/domain/model/requested_money_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/module/module.dart';

part 'module.g.dart';

@riverpod
Future<List<RequestModel>> requests(RequestsRef ref, RequestDto requestDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(requestUseCaseModule)
        .execute(parameter: requestDto, cancelToken: cancelToken);

@riverpod
Future<RequestedMoneyModel> requestedMoney(
        RequestedMoneyRef ref, RequestDto requestDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(requestedMoneyUseCaseModule)
        .execute(parameter: requestDto, cancelToken: cancelToken);

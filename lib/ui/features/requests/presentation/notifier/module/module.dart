import 'package:Pouchers/ui/features/notification/domain/dto/notification_dto.dart';
import 'package:Pouchers/ui/features/notification/domain/model/notification_data_model.dart';
import 'package:Pouchers/ui/features/requests/domain/dto/request_dto.dart';
import 'package:Pouchers/ui/features/requests/domain/model/request_model.dart';
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

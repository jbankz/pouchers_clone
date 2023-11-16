import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network_service.dart';

final _dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
      connectTimeout:
          const Duration(milliseconds: NetworkService.connectTimeout),
      receiveTimeout:
          const Duration(milliseconds: NetworkService.receiveTimeout),
      baseUrl: 'https://poucher-api.enyata.com/api'));

  dio.interceptors.add(PrettyDioLogger(
      requestHeader: kDebugMode,
      requestBody: kDebugMode,
      responseHeader: kDebugMode));

  return dio;
});

final networkServiceProvider = Provider<NetworkService>(
    (ref) => NetworkService.internal(dio: ref.watch(_dioProvider)));

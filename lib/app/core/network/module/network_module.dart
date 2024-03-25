import 'package:pouchers/app/config/app_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network_service.dart';

final baseOption = BaseOptions(
    connectTimeout: const Duration(milliseconds: NetworkService.connectTimeout),
    receiveTimeout: const Duration(milliseconds: NetworkService.receiveTimeout),
    baseUrl: AppConfig.apiUrl);

final _prettyDialog = PrettyDioLogger(
    requestHeader: kDebugMode,
    requestBody: kDebugMode,
    responseHeader: kDebugMode);

final _dioProvider =
    Provider<Dio>((ref) => Dio(baseOption)..interceptors.add(_prettyDialog));

final networkServiceProvider = Provider<NetworkService>(
    (ref) => NetworkService.internal(dio: ref.watch(_dioProvider)));

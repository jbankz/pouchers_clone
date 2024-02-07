import 'package:dio/dio.dart';

abstract class PoucherUseCaseWithOutParam<T> {
  T execute([CancelToken? cancelToken]);
}

abstract class PoucherUseCaseWithOptionalParam<TInput, TReturn> {
  Future<TReturn?> execute({TInput? parameter, CancelToken? cancelToken});
}

abstract class PoucherUseCaseWithRequiredParam<TInput, TReturn> {
  Future<TReturn?> execute(
      {required TInput parameter, CancelToken? cancelToken});
}

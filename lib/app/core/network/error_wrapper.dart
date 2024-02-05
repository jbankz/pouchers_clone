import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';

import '../../config/app_logger.dart';
import 'error/error.dart';

class ApiError {
  int? errorType = 0;
  final logger = getLogger('ApiError');
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  void _handleError(Object error) {
    if (error is DioException) {
      final DioException dioError = error;
      switch (dioError.type) {
        case DioExceptionType.cancel:
          errorDescription = AppString.requestCancelled;
        case DioExceptionType.unknown:
          errorDescription = AppString.connectionFailed;
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionTimeout:
          errorDescription = AppString.connectionTimeout;
        case DioExceptionType.badResponse:
          errorType = dioError.response?.statusCode;
          errorDescription = _handleErrorFromStatusCode(dioError.response);
        case DioExceptionType.badCertificate:
          break;
        case DioExceptionType.connectionError:
          errorDescription = AppString.internalFailure;
      }
    } else {
      errorDescription = AppString.internalFailure;
    }
  }

  @override
  String toString() => '$errorDescription';

  String? _handleErrorFromStatusCode(Response? response) {
    String message = '';
    switch (response?.statusCode) {
      case 400:
      case 401:
      case 402:
      case 403:
      case 404:
      case 409:
      case 412:
      case 422:
      case 500:
        message = getErrorData(response?.data).message?.removeUnderscore ?? '';
        if (message.contains(AppString.sessionTimedOut)) {
          PageRouter.pushReplacement(Routes.signInView);
        }
      case 429:
        message = AppString.tooManyRequest;
      case 503:
        message = AppString.serviceUnavailable;

      default:
    }
    return message;
  }
}

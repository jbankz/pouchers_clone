

import 'package:flutter_boilerplate/app/helpers/notifiers.dart';

class ServiceRequest<T> {
  late final T serviceRequest;
  final String? sessionToken;

  ServiceRequest({required this.serviceRequest, this.sessionToken});

  @override
  String toString() {
    return 'ServiceRequest{serviceRequest: $serviceRequest, sessionToken: $sessionToken}';
  }
}

class ServiceResponse<T> {
  late bool status;
  final T? data;
  final String? message;
  final bool notAuthenticated;

  ServiceResponse(
      {this.data,
      this.message,
      required this.status,
      this.notAuthenticated = false});

  NotifierState<T> toNotifierState() {
    return status
        ? notifyRight<T>(data: data, message: message)
        : notifyError<T>(
            error: message ?? "Something went wrong",
            noAuth: notAuthenticated,
          );
  }

  @override
  String toString() {
    return 'ServiceResponse{status: $status, data: $data, message: $message}';
  }
}

ServiceResponse<T> serveSuccess<T>({required T? data, String? message}) {
  return ServiceResponse<T>(
    status: true,
    message: message,
    data: data,
  );
}

ServiceResponse<T> serveError<T>(
    {required String error, T? data, bool notAuthenticated = false}) {
  return ServiceResponse<T>(
    status: false,
    message: error,
    data: data,
    notAuthenticated: notAuthenticated,
  );
}

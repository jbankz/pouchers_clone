
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/service_response.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:http/http.dart' as http;


bool noAuth(Failure error) {
  return error.code! == 401 ||
          error.code! == 403
      ? true
      : false;
}

class Failure {
  Failure({
    this.status,
    this.error,
    this.message,
    this.code,
  });

  String? status;
  String? error;
  String? message;
  int? code;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
    status: json["status"],
    error: json["error"],
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "message": message,
    "code": code,
  };
}
final phoneProvider = StateProvider<int>((ref) => 0);


ServiceResponse<T> processServiceError<T>(error, stack) {
  logger.i("$error\n$stack");
  if (error is Failure) {
    if(error.code == 401){
      return  serveError<T>(
        error: error.message!,
        notAuthenticated: true,
      );
    }else{
      print("sdfgh${error.message}");
      return serveError<T>(
        error: error.message!,
      );
    }
  }
  if (error is Exception) {
    return serveError<T>(error: Utils.handleRequestError(error));
  }
  print("sdfke,gh${error.message}");
  return serveError<T>(error: error.toString());
}


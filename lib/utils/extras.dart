bool noAuth(Failure error) {
  return error.statusCode! == 401 ||
          error.statusCode! == 403 ||
          error.errors!.first.msg!.contains("not authenticated")
      ? true
      : false;
}

class Failure {
  Failure({
    this.errors,
    this.statusCode,
  });

  List<Error>? errors;
  int? statusCode;

  factory Failure.fromJson(Map<String, dynamic> json) {
    if (json["errors"] != null) {
      return Failure(
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
        statusCode: json["status_code"],
      );
    } else if (json["message"] != null) {
      return Failure(
        errors: [Error.fromJson(json["message"])],
        statusCode: json["status_code"],
      );
    } else {
      return Failure(
        errors: [Error.fromJson(json)],
        statusCode: json["status_code"],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "errors": List<dynamic>.from(errors!.map((x) => x.toJson())),
        "status_code": statusCode,
      };

  @override
  String toString() {
    return 'Failure{errors: $errors, statusCode: $statusCode}';
  }
}

class Error {
  Error({
    this.loc,
    this.msg,
    this.type,
  });

  List<String>? loc;
  String? msg;
  String? type;

  factory Error.fromJson(dynamic json) {
    if (json is String) {
      return Error(msg: json);
    } else {
      return Error(
        loc: List<String>.from(json["loc"].map((x) => x)),
        msg: json["msg"],
        type: json["type"],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "loc": List<dynamic>.from(loc!.map((x) => x)),
        "msg": msg,
        "type": type,
      };
}

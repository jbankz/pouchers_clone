({String? status, int? code, String? message}) getErrorData(
        Map<String, dynamic> json) =>
    (
      status: json['status'] ?? '',
      code: (json['code'] as int?) ?? 400,
      message: json['message'] ?? ''
    );

import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'request_otp_model.freezed.dart';
part 'request_otp_model.g.dart';

@freezed
class RequestOtpModel with _$RequestOtpModel {
  factory RequestOtpModel({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _RequestOtpModel;

  factory RequestOtpModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOtpModelFromJson(json);
}

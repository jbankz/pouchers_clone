import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'verify_account_model.freezed.dart';
part 'verify_account_model.g.dart';

@freezed
class VerifyAccountModel with _$VerifyAccountModel {
  factory VerifyAccountModel(
      {String? status,
      String? message,
      int? code,
      Data? data}) = _VerifyAccountModel;

  factory VerifyAccountModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyAccountModelFromJson(json);
}

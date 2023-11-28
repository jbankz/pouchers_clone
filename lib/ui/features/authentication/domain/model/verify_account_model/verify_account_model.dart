import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../profile/domain/model/user.dart';

part 'verify_account_model.freezed.dart';
part 'verify_account_model.g.dart';

@freezed
class VerifyAccountModel with _$VerifyAccountModel {
  factory VerifyAccountModel(
      {String? status,
      String? message,
      int? code,
      User? data}) = _VerifyAccountModel;

  factory VerifyAccountModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyAccountModelFromJson(json);
}

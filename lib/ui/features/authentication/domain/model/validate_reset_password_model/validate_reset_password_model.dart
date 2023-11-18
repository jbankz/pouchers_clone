import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../profile/domain/model/user.dart';

part 'validate_reset_password_model.freezed.dart';
part 'validate_reset_password_model.g.dart';

@freezed
class ValidateResetPasswordModel with _$ValidateResetPasswordModel {
  factory ValidateResetPasswordModel(
      {String? status,
      String? message,
      int? code,
      User? data}) = _ValidateResetPasswordModel;

  factory ValidateResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ValidateResetPasswordModelFromJson(json);
}

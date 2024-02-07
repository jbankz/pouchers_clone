import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

@freezed
class SignUpModel with _$SignUpModel {
  factory SignUpModel(
      {String? status, String? message, int? code, Data? data}) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
}

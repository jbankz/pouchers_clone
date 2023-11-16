import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../profile/domain/model/user.dart';

part 'sign_in_model.freezed.dart';
part 'sign_in_model.g.dart';

@freezed
class SignInModel with _$SignInModel {
  @HiveType(typeId: 0, adapterName: 'SignInModelAdapter')
  factory SignInModel(
      {@HiveField(0) String? status,
      @HiveField(1) String? message,
      @HiveField(2) int? code,
      @HiveField(3) User? data}) = _SignInModel;

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
}

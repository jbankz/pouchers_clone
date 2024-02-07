import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'create_pin_model.freezed.dart';
part 'create_pin_model.g.dart';

@freezed
class CreatePinModel with _$CreatePinModel {
  factory CreatePinModel({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _CreatePinModel;

  factory CreatePinModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePinModelFromJson(json);
}

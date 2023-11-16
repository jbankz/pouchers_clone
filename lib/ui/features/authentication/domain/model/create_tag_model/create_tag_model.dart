import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'create_tag_model.freezed.dart';
part 'create_tag_model.g.dart';

@freezed
class CreateTagModel with _$CreateTagModel {
  factory CreateTagModel({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _CreateTagModel;

  factory CreateTagModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTagModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'envs.freezed.dart';
part 'envs.g.dart';

@freezed
class Envs with _$Envs {
  factory Envs(
      {String? name,
      String? value,
      @JsonKey(name: 'updated_at') DateTime? updatedAt}) = _Envs;

  factory Envs.fromJson(Map<String, dynamic> json) => _$EnvsFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../../app/core/constants/db_constants.dart';
import '../../enum/fees.dart';

part 'envs.freezed.dart';
part 'envs.g.dart';

@freezed
@HiveType(typeId: DbConstants.thirtyOne)
class Envs with _$Envs {
  factory Envs(
      {Fees? name,
      String? value,
      @JsonKey(name: 'updated_at') DateTime? updatedAt}) = _Envs;

  factory Envs.fromJson(Map<String, dynamic> json) => _$EnvsFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../app/core/constants/db_constants.dart';

part 'attributes.freezed.dart';
part 'attributes.g.dart';

@freezed
@HiveType(typeId: DbConstants.seven)
class Attributes with _$Attributes {
  factory Attributes(
      {@HiveField(0) String? nipCode,
      @HiveField(1) String? name,
      @HiveField(2) String? cbnCode}) = _Attributes;

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}

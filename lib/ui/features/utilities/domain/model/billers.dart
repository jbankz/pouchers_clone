import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../app/core/constants/db_constants.dart';

part 'billers.freezed.dart';
part 'billers.g.dart';

@freezed
@HiveType(typeId: DbConstants.twelve)
class Billers with _$Billers {
  factory Billers({
    @HiveField(0) String? name,
    @HiveField(1) @JsonKey(name: 'display_name') String? displayName,
    @HiveField(2) String? category,
    @HiveField(3) String? status,
    @HiveField(4) @JsonKey(name: 'logo_url') String? logoUrl,
    @HiveField(5) String? operatorpublicid,
    @HiveField(6) @Default(false) bool isAvailable,
  }) = _Billers;

  factory Billers.fromJson(Map<String, dynamic> json) =>
      _$BillersFromJson(json);
}

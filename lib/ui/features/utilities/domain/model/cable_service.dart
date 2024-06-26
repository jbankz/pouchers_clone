import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../app/core/constants/db_constants.dart';
import '../../../../../app/serializer/string_to_num_serializer.dart';

part 'cable_service.freezed.dart';
part 'cable_service.g.dart';

@freezed
@HiveType(typeId: DbConstants.fourteen)
class CableService with _$CableService {
  factory CableService(
      {@HiveField(0) String? name,
      @HiveField(1) String? code,
      @HiveField(2) String? category,
      @HiveField(3) String? status,
      @StringToNumSerializer() @HiveField(4) @Default(0) num price,
      @HiveField(5) String? shortCode}) = _CableService;

  factory CableService.fromJson(Map<String, dynamic> json) =>
      _$CableServiceFromJson(json);
}

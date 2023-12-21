import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'cable_service.freezed.dart';
part 'cable_service.g.dart';

@freezed
class CableService with _$CableService {
  @HiveType(typeId: 14, adapterName: 'CableServiceAdapter')
  factory CableService(
      {@HiveField(0) String? name,
      @HiveField(1) String? code,
      @HiveField(2) String? category,
      @HiveField(3) String? status,
      @HiveField(4) @Default(0) num price,
      @HiveField(5) String? shortCode}) = _CableService;

  factory CableService.fromJson(Map<String, dynamic> json) =>
      _$CableServiceFromJson(json);
}

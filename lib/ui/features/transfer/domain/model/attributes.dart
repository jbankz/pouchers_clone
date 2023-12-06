import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'attributes.freezed.dart';
part 'attributes.g.dart';

@freezed
class Attributes with _$Attributes {
  @HiveType(typeId: 7, adapterName: 'AttributesAdapter')
  factory Attributes(
      {@HiveField(0) String? nipCode,
      @HiveField(1) String? name,
      @HiveField(2) String? cbnCode}) = _Attributes;

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}

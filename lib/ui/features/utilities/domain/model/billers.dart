import 'package:freezed_annotation/freezed_annotation.dart';

part 'billers.freezed.dart';
part 'billers.g.dart';

@freezed
class Billers with _$Billers {
  factory Billers(
      {String? name,
      @JsonKey(name: 'display_name') String? displayName,
      String? category,
      String? status,
      @JsonKey(name: 'logo_url') String? logoUrl,
      String? operatorpublicid}) = _Billers;

  factory Billers.fromJson(Map<String, dynamic> json) =>
      _$BillersFromJson(json);
}

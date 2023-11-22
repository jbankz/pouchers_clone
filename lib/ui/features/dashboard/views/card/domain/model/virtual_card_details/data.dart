import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    @JsonKey(name: '_id') String? id,
    String? type,
    String? brand,
    String? number,
    String? expiryMonth,
    String? expiryYear,
    String? cvv,
    String? cvv2,
    String? defaultPin,
    String? status,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

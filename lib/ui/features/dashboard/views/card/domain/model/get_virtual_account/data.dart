import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    @JsonKey(name: '_id') String? id,
    String? business,
    String? customer,
    String? type,
    String? currency,
    String? accountName,
    String? bankCode,
    String? accountType,
    String? accountNumber,
    int? currentBalance,
    int? availableBalance,
    String? provider,
    String? providerReference,
    String? referenceCode,
    bool? isDefault,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

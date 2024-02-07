import 'package:freezed_annotation/freezed_annotation.dart';

part 'funding_source.freezed.dart';
part 'funding_source.g.dart';

@freezed
class FundingSource with _$FundingSource {
  factory FundingSource({
    @JsonKey(name: '_id') String? id,
    String? business,
    String? type,
    String? status,
    dynamic jitGateway,
    bool? isDefault,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
  }) = _FundingSource;

  factory FundingSource.fromJson(Map<String, dynamic> json) =>
      _$FundingSourceFromJson(json);
}

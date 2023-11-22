import 'package:freezed_annotation/freezed_annotation.dart';

part 'fee_detail.freezed.dart';
part 'fee_detail.g.dart';

@freezed
class FeeDetail with _$FeeDetail {
  factory FeeDetail({
    String? contract,
    String? currency,
    int? amount,
    String? description,
    @JsonKey(name: '_id') String? id,
  }) = _FeeDetail;

  factory FeeDetail.fromJson(Map<String, dynamic> json) =>
      _$FeeDetailFromJson(json);
}

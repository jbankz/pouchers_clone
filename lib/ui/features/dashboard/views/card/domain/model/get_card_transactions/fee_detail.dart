import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';

part 'fee_detail.freezed.dart';
part 'fee_detail.g.dart';

@freezed
class FeeDetail with _$FeeDetail {
  factory FeeDetail({
    String? contract,
    Currency? currency,
    @Default(0) num amount,
    String? description,
    @JsonKey(name: '_id') String? id,
  }) = _FeeDetail;

  factory FeeDetail.fromJson(Map<String, dynamic> json) =>
      _$FeeDetailFromJson(json);
}

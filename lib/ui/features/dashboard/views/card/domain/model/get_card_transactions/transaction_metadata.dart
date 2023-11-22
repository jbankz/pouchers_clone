import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_metadata.freezed.dart';
part 'transaction_metadata.g.dart';

@freezed
class TransactionMetadata with _$TransactionMetadata {
  factory TransactionMetadata({
    String? channel,
    String? type,
    String? reference,
    @JsonKey(name: '_id') String? id,
  }) = _TransactionMetadata;

  factory TransactionMetadata.fromJson(Map<String, dynamic> json) =>
      _$TransactionMetadataFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'tier.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    Tier? tier1,
    Tier? tier2,
    Tier? tier3,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

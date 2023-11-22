import 'package:freezed_annotation/freezed_annotation.dart';

import 'channels.dart';

part 'spending_controls.freezed.dart';
part 'spending_controls.g.dart';

@freezed
class SpendingControls with _$SpendingControls {
  factory SpendingControls({
    Channels? channels,
    List<dynamic>? allowedCategories,
    List<dynamic>? blockedCategories,
    List<dynamic>? spendingLimits,
    @JsonKey(name: '_id') String? id,
  }) = _SpendingControls;

  factory SpendingControls.fromJson(Map<String, dynamic> json) =>
      _$SpendingControlsFromJson(json);
}

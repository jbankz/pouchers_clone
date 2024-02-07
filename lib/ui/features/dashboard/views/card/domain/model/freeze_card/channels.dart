import 'package:freezed_annotation/freezed_annotation.dart';

part 'channels.freezed.dart';
part 'channels.g.dart';

@freezed
class Channels with _$Channels {
  factory Channels({
    bool? atm,
    bool? pos,
    bool? web,
    bool? mobile,
    @JsonKey(name: '_id') String? id,
  }) = _Channels;

  factory Channels.fromJson(Map<String, dynamic> json) =>
      _$ChannelsFromJson(json);
}

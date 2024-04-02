import 'package:freezed_annotation/freezed_annotation.dart';

part 'terminal.freezed.dart';
part 'terminal.g.dart';

@freezed
class Terminal with _$Terminal {
  factory Terminal({
    String? rrn,
    String? stan,
    String? terminalId,
    String? terminalOperatingEnvironment,
    String? terminalAttendance,
    String? terminalType,
    String? panEntryMode,
    String? pinEntryMode,
    @Default(false) bool cardHolderPresence,
    @Default(false) bool cardPresence,
    @JsonKey(name: '_id') String? id,
  }) = _Terminal;

  factory Terminal.fromJson(Map<String, dynamic> json) =>
      _$TerminalFromJson(json);
}

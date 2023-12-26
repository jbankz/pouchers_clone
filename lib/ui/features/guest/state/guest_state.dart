import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_state.freezed.dart';

@freezed
class GuestState<T> with _$GuestState<T> {
  const factory GuestState({String? fullName, String? email}) = _GuestState<T>;
}

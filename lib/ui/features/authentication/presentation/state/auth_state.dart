import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@Freezed(copyWith: true)
class AuthState<T> with _$AuthState<T> {
  const factory AuthState(
      {@Default(false) bool isBusy,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace}) = _AuthState<T>;
}

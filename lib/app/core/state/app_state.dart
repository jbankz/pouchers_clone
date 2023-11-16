import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@Freezed(copyWith: true)
class AppState<T> with _$AppState<T> {
  const factory AppState(
      {@Default(false) bool isBusy,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace}) = _AppState<T>;
}

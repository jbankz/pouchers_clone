import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_bank_state.freezed.dart';

@freezed
class LocalBankState<T> with _$LocalBankState<T> {
  const factory LocalBankState(
      {@Default(false) bool isBusy,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace}) = _LocalBankState<T>;
}

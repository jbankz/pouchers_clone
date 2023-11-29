import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/referral/earning.dart';
import '../../domain/model/referral/referral.dart';

part 'user_state.freezed.dart';

@Freezed(copyWith: true)
class UserState<T> with _$UserState<T> {
  const factory UserState(
      {@Default(false) bool isBusy,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace,
      Referral? referral}) = _UserState<T>;
}

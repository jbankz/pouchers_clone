import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/generate_2fa_token.dart';
import '../../domain/model/security_questions.dart';
import '../../domain/model/selected_questions.dart';

part 'auth_state.freezed.dart';

@Freezed(copyWith: true)
class AuthState<T> with _$AuthState<T> {
  const factory AuthState(
      {@Default(false) bool isBusy,
      T? data,
      String? errorMessage,
      @Default([]) List<SecurityQuestions> securityQuestion,
      @Default([]) List<SelectedQuestions> selectedQuestions,
      @Default(null) Generate2faToken? generate2faToken,
      StackTrace? stackTrace}) = _AuthState<T>;
}

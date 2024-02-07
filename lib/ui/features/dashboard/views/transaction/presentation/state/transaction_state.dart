import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/transaction_analytic.dart';
import '../../domain/model/transaction_history.dart';

part 'transaction_state.freezed.dart';

@Freezed(copyWith: true)
class TransactionState<T> with _$TransactionState<T> {
  const factory TransactionState(
      {@Default(false) bool isBusy,
      @Default([]) List<TransactionHistory> history,
      TransactionAnalytic? transaction,
      String? errorMessage,
      StackTrace? stackTrace}) = _TransactionState<T>;
}

import 'package:Pouchers/ui/features/transfer/domain/model/transfer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_state.freezed.dart';

@freezed
class TransferState<T> with _$TransferState<T> {
  const factory TransferState(
      {@Default(false) bool isBusy,
      Transfer? transfer,
      String? errorMessage,
      StackTrace? stackTrace}) = _TransferState<T>;
}

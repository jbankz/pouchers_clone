import 'package:Pouchers/ui/features/profile/domain/model/bank_account_details/bank_account_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_state.freezed.dart';

@Freezed(copyWith: true)
class WalletState<T> with _$WalletState<T> {
  const factory WalletState(
      {@Default(false) bool isBusy,
      @Default(false) bool validatingAccount,
      T? data,
      String? errorMessage,
      StackTrace? stackTrace,
      BankAccountDetails? bankAccountDetails}) = _WalletState<T>;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/get_card_transactions/transaction.dart';
import '../../domain/model/get_exchange_rate/get_exchange_rate.dart';
import '../../domain/model/virtual_account_balance/virtual_account_balance.dart';
import '../../domain/model/virtual_card_details/virtual_card_details.dart';

part 'card_state.freezed.dart';

@Freezed(copyWith: true)
class CardState<T> with _$CardState<T> {
  const factory CardState(
      {@Default(false) bool isBusy,
      @Default(false) bool isGettingCardTransactions,
      @Default(false) bool isGettingFundingFee,
      GetExchangeRate? exchangeRate,
      VirtualCardDetails? virtualCardDetails,
      VirtualAccountBalance? virtualAccountBalance,
      String? errorMessage,
      StackTrace? stackTrace,
      @Default([]) List<Transaction> transactions}) = _CardState<T>;
}

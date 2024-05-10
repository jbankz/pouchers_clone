import 'package:pouchers/ui/features/merchant/domain/model/get_merchants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_state.freezed.dart';

@Freezed(copyWith: true)
class MerchantState<T> with _$MerchantState<T> {
  const factory MerchantState(
      {@Default(false) bool isBusy,
      GetMerchant? getMerchant,
      String? errorMessage,
      StackTrace? stackTrace}) = _MerchantState<T>;
}

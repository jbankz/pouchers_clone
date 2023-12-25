import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/buy_voucher.dart';
import '../../domain/model/vouchers.dart';

part 'voucher_state.freezed.dart';

@Freezed(copyWith: true)
class VoucherState<T> with _$VoucherState<T> {
  const factory VoucherState(
      {@Default(false) bool isBusy,
      @Default([]) List<Vouchers> vouchers,
      @Default([]) List<num> vouchersTopDeals,
      Vouchers? voucher,
      BuyVoucher? buyVoucher,
      String? errorMessage,
      StackTrace? stackTrace}) = _VoucherState<T>;
}

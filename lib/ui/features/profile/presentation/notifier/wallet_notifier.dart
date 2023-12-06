import 'package:Pouchers/ui/features/profile/domain/model/bank_account_details/bank_account_details.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../domain/dto/wallet_dto.dart';
import '../../domain/model/wallet.dart';
import '../state/wallet_state.dart';

part 'wallet_notifier.g.dart';

@riverpod
class WalletNotifier extends _$WalletNotifier {
  final _logger = getLogger('WalletNotifier');

  Wallet? _wallet;
  BankAccountDetails? _accountDetails;

  @override
  WalletState build() => const WalletState();

  Future<void> getWalletBalance([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      _wallet = await ref
          .read(walletBalanceProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false, data: _wallet);
    }
  }

  Future<void> validateBankAccount(WalletDto walletDto,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(validatingAccount: true);

      _accountDetails = await ref.read(validateBankAccountProvider
          .call(walletDto, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(
          validatingAccount: false, bankAccountDetails: _accountDetails);
    }
  }
}

import 'package:pouchers/ui/features/profile/domain/model/wallet.dart';
import 'package:dio/dio.dart';

import '../dto/wallet_dto.dart';
import '../model/bank_account_details/bank_account_details.dart';

abstract class WalletRepo {
  Future<Wallet?> walletBalance({CancelToken? cancelToken});
  Future<BankAccountDetails?> bankAccountDetails(WalletDto walletDto,
      {CancelToken? cancelToken});
}

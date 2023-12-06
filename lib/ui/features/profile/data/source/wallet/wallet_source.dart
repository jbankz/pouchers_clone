import 'package:dio/dio.dart';

import '../../../domain/dto/wallet_dto.dart';
import '../../../domain/model/bank_account_details/bank_account_details.dart';
import '../../../domain/model/wallet.dart';

abstract class WalletSource {
  Future<Wallet?> walletBalance({CancelToken? cancelToken});
  Future<BankAccountDetails?> bankAccountDetails(WalletDto walletDto,
      {CancelToken? cancelToken});
}

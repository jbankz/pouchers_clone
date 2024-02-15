import 'package:dio/dio.dart';

import '../dto/transfer_money_dto.dart';
import '../model/guest_local_bank.dart';
import '../model/local_bank.dart';

abstract class LocalBankRepository {
  Future<List<LocalBank>> localBanks({CancelToken? cancelToken});
  Future<bool> transferToLocalBank(TransferMoneyDto transferMoneyDto,
      {CancelToken? cancelToken});
  Future<List<GuestLocalBank>> guestLocalBanks({CancelToken? cancelToken});
}

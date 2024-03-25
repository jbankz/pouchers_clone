import 'package:pouchers/ui/features/transfer/domain/model/local_bank.dart';
import 'package:dio/dio.dart';

import '../../../domain/dto/transfer_money_dto.dart';
import '../../../domain/model/guest_local_bank.dart';

abstract class LocalBankSource {
  Future<List<LocalBank>> localBanks({CancelToken? cancelToken});
  Future<List<GuestLocalBank>> guestLocalBanks({CancelToken? cancelToken});
  Future<bool> transferToLocalBank(TransferMoneyDto transferMoneyDto,
      {CancelToken? cancelToken});
}

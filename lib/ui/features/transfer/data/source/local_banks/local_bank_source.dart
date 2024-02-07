import 'package:Pouchers/ui/features/transfer/domain/model/local_bank.dart';
import 'package:dio/dio.dart';

import '../../../domain/dto/transfer_money_dto.dart';

abstract class LocalBankSource {
  Future<List<LocalBank>> localBanks({CancelToken? cancelToken});
  Future<bool> transferToLocalBank(TransferMoneyDto transferMoneyDto,
      {CancelToken? cancelToken});
}

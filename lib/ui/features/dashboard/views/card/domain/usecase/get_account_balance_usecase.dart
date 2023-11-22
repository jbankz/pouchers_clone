import 'package:Pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:dio/dio.dart';

import '../model/virtual_account_balance/virtual_account_balance.dart';
import '../repository/card_repo.dart';

class GetAccountBalanceUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, VirtualAccountBalance> {
  final CardRepo _cardRepo;

  GetAccountBalanceUseCaseImpl(this._cardRepo);

  @override
  Future<VirtualAccountBalance?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.getAccountBalance(
          cardDto: parameter, cancelToken: cancelToken);
}

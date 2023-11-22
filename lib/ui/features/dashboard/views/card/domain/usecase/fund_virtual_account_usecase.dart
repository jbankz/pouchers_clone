import 'package:Pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:dio/dio.dart';

import '../model/fund_virtual_account/fund_virtual_account.dart';
import '../repository/card_repo.dart';

class FundVirtualAccountUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, FundVirtualAccount> {
  final CardRepo _cardRepo;

  FundVirtualAccountUseCaseImpl(this._cardRepo);

  @override
  Future<FundVirtualAccount?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.fundVirtualCard(
          cardDto: parameter, cancelToken: cancelToken);
}

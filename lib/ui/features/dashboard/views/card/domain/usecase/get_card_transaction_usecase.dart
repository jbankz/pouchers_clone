import 'package:pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:dio/dio.dart';

import '../model/get_card_transactions/get_card_transactions.dart';
import '../repository/card_repo.dart';

class GetCardTransactionUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, GetCardTransactions> {
  final CardRepo _cardRepo;

  GetCardTransactionUseCaseImpl(this._cardRepo);

  @override
  Future<GetCardTransactions?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.getCardTransactions(
          cardDto: parameter, cancelToken: cancelToken);
}

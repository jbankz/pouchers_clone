import 'package:pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:dio/dio.dart';

import '../model/get_exchange_rate/get_exchange_rate.dart';
import '../repository/card_repo.dart';

class GetExchageRateUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, GetExchangeRate> {
  final CardRepo _cardRepo;

  GetExchageRateUseCaseImpl(this._cardRepo);

  @override
  Future<GetExchangeRate?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.getExchangeRate(
          cardDto: parameter, cancelToken: cancelToken);
}

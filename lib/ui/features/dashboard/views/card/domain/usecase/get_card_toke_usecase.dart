import 'package:Pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:dio/dio.dart';

import '../model/get_card_token/get_card_token.dart';
import '../repository/card_repo.dart';

class GetCardTokenUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, GetCardToken> {
  final CardRepo _cardRepo;

  GetCardTokenUseCaseImpl(this._cardRepo);

  @override
  Future<GetCardToken?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.getCardToken(
          cardDto: parameter, cancelToken: cancelToken);
}

import 'package:Pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:dio/dio.dart';

import '../model/get_card/get_cards.dart';
import '../repository/card_repo.dart';

class GetCardsUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, GetCards> {
  final CardRepo _cardRepo;

  GetCardsUseCaseImpl(this._cardRepo);

  @override
  Future<GetCards?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.getCards(cardDto: parameter, cancelToken: cancelToken);
}

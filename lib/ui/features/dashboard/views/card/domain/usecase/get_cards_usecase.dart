import 'package:pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:dio/dio.dart';

import '../model/cards/cards.dart';
import '../repository/card_repo.dart';

class GetCardsUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, List<Cards>> {
  final CardRepo _cardRepo;

  GetCardsUseCaseImpl(this._cardRepo);

  @override
  Future<List<Cards>?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.getCards(cardDto: parameter, cancelToken: cancelToken);
}

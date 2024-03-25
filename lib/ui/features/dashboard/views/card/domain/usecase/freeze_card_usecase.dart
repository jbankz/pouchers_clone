import 'package:pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:dio/dio.dart';

import '../model/freeze_card/freeze_card.dart';
import '../repository/card_repo.dart';

class FreezeCardUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, FreezeCard> {
  final CardRepo _cardRepo;

  FreezeCardUseCaseImpl(this._cardRepo);

  @override
  Future<FreezeCard?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.freezeCard(cardDto: parameter, cancelToken: cancelToken);
}

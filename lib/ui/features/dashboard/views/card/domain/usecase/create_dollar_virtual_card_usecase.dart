import 'package:pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:dio/dio.dart';

import '../model/created_virtual_card/created_virtual_card.dart';
import '../repository/card_repo.dart';

class CreateDollarVirtualCardUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, CreatedVirtualCard> {
  final CardRepo _cardRepo;

  CreateDollarVirtualCardUseCaseImpl(this._cardRepo);

  @override
  Future<CreatedVirtualCard?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.createDollarVirtualCard(
          cardDto: parameter, cancelToken: cancelToken);
}

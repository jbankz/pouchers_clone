import 'package:pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/model/virtual_card_details/virtual_card_details.dart';
import 'package:dio/dio.dart';

import '../repository/card_repo.dart';

class GetVirtualCardDetalsUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, VirtualCardDetails> {
  final CardRepo _cardRepo;

  GetVirtualCardDetalsUseCaseImpl(this._cardRepo);

  @override
  Future<VirtualCardDetails?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.getVirtualCardDetails(
          cardDto: parameter, cancelToken: cancelToken);
}

import 'package:Pouchers/app/core/usecase/poucher_usecase.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/model/get_virtual_account/get_virtual_account.dart';
import 'package:dio/dio.dart';

import '../repository/card_repo.dart';

class GetVirtualAccountUseCaseImpl
    extends PoucherUseCaseWithRequiredParam<CardDto, GetVirtualAccount> {
  final CardRepo _cardRepo;

  GetVirtualAccountUseCaseImpl(this._cardRepo);

  @override
  Future<GetVirtualAccount?> execute(
          {required CardDto parameter, CancelToken? cancelToken}) async =>
      await _cardRepo.getVirtualAccout(
          cardDto: parameter, cancelToken: cancelToken);
}

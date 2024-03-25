import 'package:pouchers/ui/features/merchant/domain/model/get_merchants.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/merchants_repo.dart';

class GetMerchantsUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<GetMerchant>> {
  final MerchantsRepo _merchantsRepo;

  GetMerchantsUseCaseImpl(this._merchantsRepo);

  @override
  Future<GetMerchant> execute([CancelToken? cancelToken]) async =>
      await _merchantsRepo.fetchMerchants(cancelToken: cancelToken);
}

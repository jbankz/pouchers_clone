import 'package:Pouchers/ui/features/utilities/domain/model/airtime_top_deals.dart';
import 'package:Pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class AirtimeTopDealsUseCaseImpl
    implements PoucherUseCaseWithOutParam<List<AirtimeTopDeals>> {
  final BillerRepo _billerRepo;

  AirtimeTopDealsUseCaseImpl(this._billerRepo);

  @override
  List<AirtimeTopDeals> execute([CancelToken? cancelToken]) =>
      _billerRepo.topDeals();
}

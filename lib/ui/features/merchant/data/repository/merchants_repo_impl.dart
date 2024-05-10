import 'package:pouchers/ui/features/merchant/data/source/merchants_source.dart';
import 'package:pouchers/ui/features/merchant/domain/model/get_merchants.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/merchants_repo.dart';
import '../dao/merchant_dao.dart';

class MerchantsRepoImpl implements MerchantsRepo {
  final MerchantsSource _merchantsSource;

  MerchantsRepoImpl(this._merchantsSource);

  @override
  Future<GetMerchant> fetchMerchants({CancelToken? cancelToken}) async {
    final getMerchant =
        await _merchantsSource.fetchMerchants(cancelToken: cancelToken);
    await merchantDao.save(getMerchant);
    return getMerchant;
  }
}

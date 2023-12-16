import 'package:Pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/airtime_top_deals.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/billers.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/discounts.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/utility.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/billers_repo.dart';
import '../source/billers_source.dart';

class BillersRepoImpl implements BillerRepo {
  final BillerSource _billersSource;

  BillersRepoImpl(this._billersSource);

  @override
  Future<List<Billers>> billers(BillersDto billersDto,
          {CancelToken? cancelToken}) async =>
      await _billersSource.billers(billersDto, cancelToken: cancelToken);

  @override
  Future<Discounts?> discounts(BillersDto billersDto,
          {CancelToken? cancelToken}) async =>
      await _billersSource.discounts(billersDto, cancelToken: cancelToken);

  @override
  List<AirtimeTopDeals> topDeals() => _billersSource.topDeals();

  @override
  Future<Utility?> utilityPurchase(MobileDto mobileDto,
          {CancelToken? cancelToken}) async =>
      await _billersSource.utilityPurchase(mobileDto, cancelToken: cancelToken);
}

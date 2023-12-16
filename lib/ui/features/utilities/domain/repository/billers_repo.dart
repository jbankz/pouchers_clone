import 'package:Pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/billers.dart';
import 'package:dio/dio.dart';

import '../dto/mobile_dto.dart';
import '../model/airtime_top_deals.dart';
import '../model/discounts.dart';
import '../model/utility.dart';

abstract class BillerRepo {
  Future<List<Billers>> billers(BillersDto billersDto,
      {CancelToken? cancelToken});
  Future<Discounts?> discounts(BillersDto billersDto,
      {CancelToken? cancelToken});
  List<AirtimeTopDeals> topDeals();
  Future<Utility?> utilityPurchase(MobileDto mobileDto,
      {CancelToken? cancelToken});
}

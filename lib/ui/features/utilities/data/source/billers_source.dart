import 'package:Pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/billers.dart';
import 'package:dio/dio.dart';

import '../../domain/dto/mobile_dto.dart';
import '../../domain/model/airtime_top_deals.dart';
import '../../domain/model/discounts.dart';
import '../../domain/model/get_cable_service.dart';
import '../../domain/model/guest_services_purchase.dart';
import '../../domain/model/mobile_data_services.dart';
import '../../domain/model/schedule.dart';
import '../../domain/model/utility.dart';
import '../../domain/model/validate_customer.dart';

abstract class BillerSource {
  Future<List<Billers>> billers(BillersDto billersDto,
      {CancelToken? cancelToken});
  Future<DiscountsData?> discounts(BillersDto billersDto,
      {CancelToken? cancelToken});
  List<AirtimeTopDeals> topDeals();
  Future<Utility?> utilityPurchase(MobileDto mobileDto,
      {CancelToken? cancelToken});
  Future<List<MobileOperatorServices>> mobileOperatorServices(
      MobileDto mobileDto,
      {CancelToken? cancelToken});
  Future<Schedule?> schedule(MobileDto mobileDto, {CancelToken? cancelToken});
  Future<GetCableService> cableServices(BillersDto billersDto,
      {CancelToken? cancelToken});
  Future<ValidateCustomer> customerInfo(BillersDto billersDto,
      {CancelToken? cancelToken});
  Future<GuestServicesPurchase> guestCardPayment(MobileDto billersDto,
      {CancelToken? cancelToken});
  Future<GuestServicesPurchase> guestUSSDPayment(MobileDto billersDto,
      {CancelToken? cancelToken});
}

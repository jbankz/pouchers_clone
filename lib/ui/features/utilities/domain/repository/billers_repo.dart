import 'package:Pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/billers.dart';
import 'package:dio/dio.dart';

import '../dto/mobile_dto.dart';
import '../model/airtime_top_deals.dart';
import '../model/discounts.dart';
import '../model/get_cable_service.dart';
import '../model/guest_services_purchase.dart';
import '../model/guest_services_purchase_status.dart';
import '../model/mobile_data_services.dart';
import '../model/schedule.dart';
import '../model/utility.dart';
import '../model/validate_customer.dart';

abstract class BillerRepo {
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
  Future<GuestServicesPurchaseStatus> guestUSSDPaymentStatus(
      MobileDto billersDto,
      {CancelToken? cancelToken});
}

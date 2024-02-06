import 'package:Pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/airtime_top_deals.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/billers.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/guest_services_purchase.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/mobile_data_services.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/discounts.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/schedule.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/utility.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/validate_customer.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/network/api_path.dart';
import '../../../../../app/core/network/network_service.dart';
import '../../domain/model/get_cable_service.dart';
import 'billers_source.dart';

class BillersSourceImpl implements BillerSource {
  final NetworkService networkService;

  BillersSourceImpl({required this.networkService});

  @override
  Future<List<Billers>> billers(BillersDto billersDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.billers}/${billersDto.billersCategory?.name}',
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return (response.data?['data'] as List<dynamic>)
        .map((data) => Billers.fromJson(data as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<DiscountsData?> discounts(BillersDto billersDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path:
            '${ApiPath.billersDiscounts}/${billersDto.billersCategory?.name}/${billersDto.operatorId}',
        requestType: RequestType.get,
        cancelToken: cancelToken);

    return DiscountsData.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }

  @override
  List<AirtimeTopDeals> topDeals() => [
        AirtimeTopDeals(amount: 100),
        AirtimeTopDeals(amount: 200),
        AirtimeTopDeals(amount: 500),
        AirtimeTopDeals(amount: 1000),
        AirtimeTopDeals(amount: 2000),
        AirtimeTopDeals(amount: 3000)
      ];

  @override
  Future<Utility?> utilityPurchase(MobileDto mobileDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: mobileDto.isMerchantPayment
            ? ApiPath.merchantPayment
            : ApiPath.mobile,
        data: mobileDto.toJson(),
        requestType: RequestType.post,
        cancelToken: cancelToken);

    return Utility.fromJson(response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<MobileOperatorServices>> mobileOperatorServices(
      MobileDto mobileDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.dataProviders}/${mobileDto.mobileOperatorPublicId}',
        requestType: RequestType.get,
        cancelToken: cancelToken);
    return (response.data?['data']?['mobileOperatorServices'] as List<dynamic>)
        .map((e) => MobileOperatorServices.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<Schedule> schedule(MobileDto mobileDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.schedule,
        data: mobileDto.toJson(),
        requestType: RequestType.post,
        cancelToken: cancelToken);
    return Schedule.fromJson(response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<GetCableService> cableServices(BillersDto billersDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path:
            '${ApiPath.merchants}/${billersDto.cableId}/${billersDto.path?.name}',
        requestType: RequestType.get,
        cancelToken: cancelToken);

    return GetCableService.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<ValidateCustomer> customerInfo(BillersDto billersDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.validateCustomerInfo,
        requestType: RequestType.post,
        data: billersDto.toJson(),
        cancelToken: cancelToken);
    return ValidateCustomer.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<GuestServicesPurchase> guestCardPayment(MobileDto billersDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.guestCardPayment,
        requestType: RequestType.post,
        data: billersDto.toJson(),
        cancelToken: cancelToken);
    return GuestServicesPurchase.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }

  @override
  Future<GuestServicesPurchase> guestUSSDPayment(MobileDto billersDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.guestUssdPayment,
        requestType: RequestType.post,
        data: billersDto.toJson(),
        cancelToken: cancelToken);
    return GuestServicesPurchase.fromJson(
        response.data?['data'] as Map<String, dynamic>);
  }
}

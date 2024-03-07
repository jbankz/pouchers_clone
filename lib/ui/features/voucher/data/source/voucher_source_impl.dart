import 'package:Pouchers/app/core/network/api_path.dart';
import 'package:Pouchers/app/core/network/network_service.dart';
import 'package:Pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:Pouchers/ui/features/voucher/domain/model/buy_voucher.dart';
import 'package:Pouchers/ui/features/voucher/domain/model/vouchers.dart';
import 'package:dio/dio.dart';

import 'voucher_source.dart';

class VoucherSourceImpl implements VoucherSource {
  final NetworkService _networkService;

  VoucherSourceImpl({required NetworkService networkService})
      : _networkService = networkService;

  @override
  Future<BuyVoucher> buyVoucher(VoucherDto voucherDto,
      {CancelToken? cancelToken}) async {
    try {
      final response = await _networkService.request(
          path: ApiPath.buyVoucher,
          requestType: RequestType.post,
          data: voucherDto.toJson(),
          cancelToken: cancelToken);
      return BuyVoucher.fromJson(
          response.data?['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Vouchers>> vouchers(VoucherDto voucherDto,
      {CancelToken? cancelToken}) async {
    final response = await _networkService.request(
        path: ApiPath.vouchers,
        requestType: RequestType.get,
        queryParams: voucherDto.toJson(),
        cancelToken: cancelToken);
    return (response.data?['data']?['vouchers'] as List<dynamic>)
        .map((data) => Vouchers.fromJson(data as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<Vouchers> giftVoucher(VoucherDto voucherDto,
      {CancelToken? cancelToken}) async {
    try {
      final response = await _networkService.request(
          path: ApiPath.giftVoucher,
          requestType: RequestType.patch,
          data: voucherDto.toJson(),
          cancelToken: cancelToken);
      return Vouchers.fromJson(response.data?['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Vouchers> redeemVoucher(VoucherDto voucherDto,
      {CancelToken? cancelToken}) async {
    try {
      final response = await _networkService.request(
          path: ApiPath.redeemVoucher,
          requestType: RequestType.patch,
          data: voucherDto.toJson(),
          cancelToken: cancelToken);
      return Vouchers.fromJson(response.data?['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<num> vouchersTopDeals() => [5000, 15000, 20000, 40000, 50000, 100000];
}

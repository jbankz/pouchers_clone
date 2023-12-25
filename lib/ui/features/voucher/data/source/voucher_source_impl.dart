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
    // final response = await _networkService.request(
    //     path: ApiPath.vouchers,
    //     requestType: RequestType.get,
    //     data: voucherDto.toJson(),
    //     cancelToken: cancelToken);
    // return (response.data?['data']?['vouchers'] as List<dynamic>)
    //     .map((e) => Vouchers.fromJson(e as Map<String, dynamic>))
    //     .toList();
    await Future.delayed(const Duration(seconds: 5));

    return List.generate(
        25,
        (index) => Vouchers.fromJson({
              "code": "#P${index}7LSAHJOF",
              "amount": index,
              "buyer_id": "user-dcd7bb168cee11edae5cab1b683c4b5d",
              "giftee_id": "user-3db1581276e611edae97730f9590a604",
              "status": "active",
              "redeemed": false,
              "created_at": DateTime.now()
                  .subtract(const Duration(days: 5))
                  .toIso8601String()
            })).toList();
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

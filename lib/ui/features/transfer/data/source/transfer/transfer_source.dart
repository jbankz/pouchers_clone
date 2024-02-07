import 'package:dio/dio.dart';

import '../../../../utilities/domain/dto/mobile_dto.dart';
import '../../../../utilities/domain/model/schedule.dart';
import '../../../domain/dto/transfer_money_dto.dart';
import '../../../domain/model/transfer.dart';

abstract class TransferSource {
  Future<Transfer> p2pTransfer(TransferMoneyDto transferMoneyDto,
      {CancelToken? cancelToken});
  Future<bool> requestMoney(TransferMoneyDto transferMoneyDto,
      {CancelToken? cancelToken});
  Future<Schedule> schedule(MobileDto mobileDto, {CancelToken? cancelToken});
}

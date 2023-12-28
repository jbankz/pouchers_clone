import 'package:Pouchers/ui/features/transfer/data/source/transfer/transfer_source.dart';
import 'package:Pouchers/ui/features/transfer/domain/dto/transfer_money_dto.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/transfer.dart';
import 'package:Pouchers/ui/features/transfer/domain/repository/transfer_repository.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/schedule.dart';
import 'package:dio/dio.dart';

class TransferRepoImpl implements TransferRepository {
  final TransferSource _transferSource;

  TransferRepoImpl(this._transferSource);

  @override
  Future<Transfer> p2pTransfer(TransferMoneyDto transferMoneyDto,
          {CancelToken? cancelToken}) async =>
      await _transferSource.p2pTransfer(transferMoneyDto,
          cancelToken: cancelToken);

  @override
  Future<Schedule> schedule(MobileDto mobileDto,
          {CancelToken? cancelToken}) async =>
      await _transferSource.schedule(mobileDto, cancelToken: cancelToken);
}

import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/schedule.dart';
import 'package:Pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class ScheduleUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<MobileDto, Schedule> {
  final BillerRepo _billerRepo;

  ScheduleUseCaseImpl(this._billerRepo);

  @override
  Future<Schedule?> execute(
          {required MobileDto parameter, CancelToken? cancelToken}) async =>
      await _billerRepo.schedule(parameter, cancelToken: cancelToken);
}

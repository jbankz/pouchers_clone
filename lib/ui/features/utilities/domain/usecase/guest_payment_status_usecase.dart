import 'package:pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:pouchers/ui/features/utilities/domain/model/guest_services_purchase_status.dart';
import 'package:pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class GuestPaymentStatusUseCaseImpl
    implements
        PoucherUseCaseWithRequiredParam<MobileDto,
            GuestServicesPurchaseStatus> {
  final BillerRepo _billerRepo;

  GuestPaymentStatusUseCaseImpl(this._billerRepo);

  @override
  Future<GuestServicesPurchaseStatus?> execute(
          {required MobileDto parameter, CancelToken? cancelToken}) async =>
      await _billerRepo.guestUSSDPaymentStatus(parameter,
          cancelToken: cancelToken);
}

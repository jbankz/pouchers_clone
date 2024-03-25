import 'package:pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:pouchers/ui/features/utilities/domain/model/guest_services_purchase.dart';
import 'package:pouchers/ui/features/utilities/domain/repository/billers_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class GuestUssdPaymentUseCaseImpl
    implements
        PoucherUseCaseWithRequiredParam<MobileDto, GuestServicesPurchase> {
  final BillerRepo _billerRepo;

  GuestUssdPaymentUseCaseImpl(this._billerRepo);

  @override
  Future<GuestServicesPurchase?> execute(
          {required MobileDto parameter, CancelToken? cancelToken}) async =>
      await _billerRepo.guestUSSDPayment(parameter, cancelToken: cancelToken);
}

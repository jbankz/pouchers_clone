import 'package:pouchers/ui/features/profile/domain/repository/user_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../model/referral/referral.dart';

class ReferralUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<Referral?>> {
  final UserRepo _userRepo;

  ReferralUseCaseImpl(this._userRepo);

  @override
  Future<Referral?> execute([CancelToken? cancelToken]) async =>
      await _userRepo.referral(cancelToken: cancelToken);
}

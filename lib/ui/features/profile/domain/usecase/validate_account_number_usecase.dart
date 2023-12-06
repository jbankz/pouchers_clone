import 'package:Pouchers/ui/features/profile/domain/dto/wallet_dto.dart';
import 'package:Pouchers/ui/features/profile/domain/model/bank_account_details/bank_account_details.dart';
import 'package:Pouchers/ui/features/profile/domain/repository/wallet_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class ValidateBankAccountNumberUseCaseImpl
    implements PoucherUseCaseWithRequiredParam<WalletDto, BankAccountDetails?> {
  final WalletRepo _walletRepo;

  ValidateBankAccountNumberUseCaseImpl(this._walletRepo);

  @override
  Future<BankAccountDetails?> execute(
          {required WalletDto parameter, CancelToken? cancelToken}) async =>
      await _walletRepo.bankAccountDetails(parameter, cancelToken: cancelToken);
}

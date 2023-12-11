import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/transfer/data/dao/local_bank_dao.dart';
import 'package:Pouchers/ui/features/transfer/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/features/transfer/presentation/state/local_bank_state.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../domain/dto/transfer_money_dto.dart';

part 'local_bank_notifier.g.dart';

@riverpod
class LocalBankNotifier extends _$LocalBankNotifier {
  final _logger = getLogger('LocalBankNotifier');

  @override
  LocalBankState build() => const LocalBankState();

  Future<void> getLocalBanks([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: localBankDao.box.isEmpty);
      await ref.read(localBanksProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      _logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> transferToLocalBank(TransferMoneyDto transferMoneyDto,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      await ref.read(transferToLocalBankProvider
          .call(transferMoneyDto, cancelToken: cancelToken)
          .future);
      PageRouter.pushNamed(Routes.successState,
          args: SuccessStateArguments(
              title: AppString.transferCompleted,
              message: AppString.transferCompletedMessage,
              btnTitle: AppString.proceed,
              tap: () => PageRouter.pushReplacement(Routes.dashboardView,
                  args: const DashboardViewArguments(gottenIndex: 2))));
    } catch (e) {
      _logger.e(e.toString());
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }
}

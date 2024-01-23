import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/schedules/domain/model/schedule_model.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/transfer.dart';
import 'package:Pouchers/ui/features/utilities/domain/enum/service_category.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../app/core/skeleton/widgets.dart';
import '../../../../widgets/gap.dart';
import '../../../voucher/presentation/views/widgets/empty_voucher_widget.dart';
import '../../domain/dto/schedule_filter.dart';
import '../notifier/schedule_notifier.dart';
import 'widget/schedule_widget.dart';

class ScheduleView extends ConsumerStatefulWidget {
  const ScheduleView({super.key});

  @override
  ConsumerState<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends ConsumerState<ScheduleView> {
  late ScheduleNotifier _scheduleNotifier;

  final CancelToken _cancelToken = CancelToken();
  final RefreshController _refreshController = RefreshController();

  ScheduleFilter? _transactionFilter;

  @override
  void initState() {
    super.initState();
    _scheduleNotifier = ref.read(scheduleNotifierProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) => _refreshTransactions());
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    _refreshController.dispose();
  }

  Future<void> _refreshTransactions({bool isBusy = false}) async {
    try {
      _scheduleNotifier.resetPageCount();
      await _scheduleNotifier.fetchSchedules(
        cancelToken: _cancelToken,
        category: _transactionFilter?.value,
      );
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  Future<void> _paginateTransactions() async {
    try {
      _scheduleNotifier.increamentPageCount();
      await _scheduleNotifier.fetchSchedules(
          category: _transactionFilter?.value, cancelToken: _cancelToken);
      _refreshController.loadComplete();
    } catch (e) {
      _refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheduleState = ref.watch(scheduleNotifierProvider);
    final schedules = scheduleState.schedules;

    return Scaffold(
      backgroundColor: AppColors.kPurpleColor800,
      appBar: AppBar(
          title: Text(AppString.scheduledPayments),
          backgroundColor: AppColors.kPurpleColor800),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(scheduleFilters.length, (index) {
                    final filter = scheduleFilters[index];
                    final bool isSelected =
                        filter.value == _transactionFilter?.value;

                    return Flexible(
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() => _transactionFilter = filter);
                          _refreshTransactions(
                              isBusy: _transactionFilter?.value != null);
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 4.h),
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.kPrimaryTextColor
                                    : AppColors.kBackgroundColor,
                                borderRadius: BorderRadius.circular(15.r)),
                            child: Text(
                              filter.key,
                              style: context.headlineMedium?.copyWith(
                                  fontSize: 12,
                                  color: isSelected ? AppColors.white : null,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                    );
                  }).toList()),
            ),
            const Gap(height: 16),
            Expanded(
              child: Skeleton(
                isLoading: scheduleState.isBusy,
                skeleton: ListView.separated(
                    itemBuilder: (_, __) => Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          color: Colors.white,
                        ),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: context.height.toInt()),
                child: SmartRefresher(
                  key: ValueKey<String>(_transactionFilter?.key ?? ''),
                  controller: _refreshController,
                  onRefresh: _refreshTransactions,
                  onLoading: _paginateTransactions,
                  child: scheduleState.schedules.isEmpty
                      ? Center(
                          child: EmptyVoucherView(
                              message: AppString.emptySchedules))
                      : ListView.separated(
                          itemCount: schedules.length,
                          separatorBuilder: (_, __) => const Divider(),
                          itemBuilder: (_, index) {
                            final schedule = schedules[index];
                            return ScheduledWidget(
                                schedule: schedule,
                                tapped: () => _handleClickedItem(schedule));
                          }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleClickedItem(ScheduleModel schedule) async {
    switch (schedule.category) {
      case null:
      case ServiceCategory.airtime:
        await PageRouter.pushNamed(Routes.scheduledAirtimeView,
            args: ScheduledAirtimeViewArguments(schedule: schedule));
      case ServiceCategory.data:
        await PageRouter.pushNamed(Routes.scheduleDataView,
            args: ScheduleDataViewArguments(schedule: schedule));
      case ServiceCategory.cable:
        await PageRouter.pushNamed(Routes.scheduleCableTvView,
            args: ScheduleCableTvViewArguments(schedule: schedule));
      case ServiceCategory.electricity:
        await PageRouter.pushNamed(Routes.scheduleElectricityView,
            args: ScheduleElectricityViewArguments(schedule: schedule));
      case ServiceCategory.betting:
        return;
      case ServiceCategory.voucherPurchase:
        return;
      case ServiceCategory.education:
        return;
      case ServiceCategory.internet:
        return;
      case ServiceCategory.voucherRedeem:
        return;
      case ServiceCategory.fundWallet:
        return;
      case ServiceCategory.createVirtualCard:
        return;
      case ServiceCategory.fundVirtualCard:
        return;
      case ServiceCategory.localBankTransfer:
      case ServiceCategory.p2p:
        await _handleTransfer(schedule);
      case ServiceCategory.adminDebitWallet:
        return;
      case ServiceCategory.adminCreditWallet:
        return;
      case ServiceCategory.referralBonusPayment:
        return;
      case ServiceCategory.moneyRequest:
    }
    _refreshTransactions();
  }

  Future<void> _handleTransfer(ScheduleModel schedule) async {
    await PageRouter.pushNamed(Routes.scheduleTransferMoneyView,
        args: ScheduleTransferMoneyViewArguments(
            schedule: schedule,
            transfer: Transfer(
                transactionId: schedule.scheduleId,
                amount: schedule.amount,
                receiverName: schedule.beneficiaryAccountName ??
                    schedule.recipient ??
                    '')));
    _refreshTransactions();
  }
}

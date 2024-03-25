import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:pouchers/ui/features/voucher/presentation/views/widgets/empty_voucher_widget.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../../../app/core/skeleton/widgets.dart';
import '../../../../../../../common/app_colors.dart';
import '../../../../../../../widgets/gap.dart';
import '../../../data/dao/transaction_dao.dart';
import '../../../domain/dto/transaction_filter.dart';
import '../../../domain/enum/transaction_type.dart';
import '../../../domain/parser/parse_transaction_title.dart';
import '../../notifier/transaction_notifier.dart';

class HistoryTab extends ConsumerStatefulWidget {
  const HistoryTab({super.key});

  @override
  ConsumerState<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends ConsumerState<HistoryTab> {
  late TransactionHistoryNotifier _transactionHistoryNotifier;

  final CancelToken _cancelToken = CancelToken();
  final RefreshController _refreshController = RefreshController();

  TransactionFilter? _transactionFilter;

  @override
  void initState() {
    super.initState();
    _transactionHistoryNotifier =
        ref.read(transactionHistoryNotifierProvider.notifier);
    Future.microtask(
        () => _refreshTransactions(isBusy: transactionHistoryDao.box.isEmpty));
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  Future<void> _refreshTransactions({bool isBusy = false}) async {
    try {
      _transactionHistoryNotifier.resetPageCount();
      await _transactionHistoryNotifier.getTransactionsHistory(
          category: _transactionFilter?.value,
          cancelToken: _cancelToken,
          isBusy: isBusy);
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  Future<void> _paginateTransactions() async {
    try {
      _transactionHistoryNotifier.increamentPageCount();
      await _transactionHistoryNotifier.getTransactionsHistory(
          category: _transactionFilter?.value, cancelToken: _cancelToken);
      _refreshController.loadComplete();
    } catch (e) {
      _refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final transactionState = ref.watch(transactionHistoryNotifierProvider);

    return ValueListenableBuilder<Box>(
        valueListenable: transactionHistoryDao.getListenable(),
        builder: (_, box, __) {
          final transactions = _transactionFilter?.value == null
              ? transactionHistoryDao.fetchTransactionHistory(box)
              : transactionState.history;

          return Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(filters.length, (index) {
                      final filter = filters[index];
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
              const Gap(height: 22),
              Expanded(
                child: Skeleton(
                  isLoading: transactionState.isBusy,
                  skeleton: ListView.separated(
                      itemBuilder: (_, __) => Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            color: Colors.white,
                          ),
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: context.height.toInt()),
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: true,
                    onRefresh: _refreshTransactions,
                    onLoading: _paginateTransactions,
                    child: transactions.isEmpty
                        ? Center(
                            child: EmptyVoucherView(
                                message: AppString.emptyTransactions))
                        : ListView.separated(
                            itemCount: transactions.length,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (_, index) {
                              bool isSameDate = true;

                              final transaction = transactions[index];

                              if (index == 0) {
                                isSameDate = false;
                              } else {
                                isSameDate = transaction.updatedAt!.isSameDate(
                                    transactions[index - 1].updatedAt!);
                              }

                              final bool isDebitTransaction =
                                  transaction.transactionType ==
                                      TransactionType.debit;

                              final Color color = isDebitTransaction
                                  ? AppColors.kColorRedDeep
                                  : AppColors.limeGreen;
                              final String amount = isDebitTransaction
                                  ? '-${transaction.amount.toNaira}'
                                  : '+${transaction.amount.toNaira}';

                              if (index == 0 || !(isSameDate)) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(height: 16),
                                    Text(
                                      transaction.updatedAt?.dayMonthYear ?? '',
                                      style: context.headlineMedium?.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.kSecondaryTextColor),
                                    ),
                                    _buildItem(
                                        title: transactionTitle(transaction),
                                        context: context,
                                        amount: amount,
                                        color: color,
                                        transactionHistory: transaction)
                                  ],
                                );
                              }

                              return _buildItem(
                                  title: transactionTitle(transaction),
                                  context: context,
                                  amount: amount,
                                  color: color,
                                  transactionHistory: transaction);
                            }),
                  ),
                ),
              ),
            ],
          );
        });
  }

  InkWell _buildItem(
          {required BuildContext context,
          required String title,
          required String amount,
          required Color color,
          required TransactionHistory transactionHistory}) =>
      InkWell(
        onTap: () => PageRouter.pushNamed(Routes.transactionDetailsView,
            args: TransactionDetailsViewArguments(
                transactionHistory: transactionHistory)),
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            children: [
              Expanded(
                child: Text(title,
                    style: context.headlineMedium?.copyWith(
                        color: AppColors.kBlueColorDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
              ),
              const Gap(width: 23),
              Expanded(
                child: Text(amount,
                    style: context.headlineMedium?.copyWith(
                        color: color,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.right),
              ),
            ],
          ),
        ),
      );
}

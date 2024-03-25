import 'package:pouchers/app/core/skeleton/widgets.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/data/dao/transaction_analytics_dao.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/presentation/notifier/transaction_notifier.dart';
import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../../common/app_images.dart';
import '../../../../../../../widgets/filter_sheet.dart';
import '../../../../../../requests/domain/model/filter_model.dart';
import '../graph/analytic_graph.dart';
import '../skeleton/analytic_skeleton.dart';
import '../widget/analytics_filter.dart';

class AnalyticTab extends ConsumerStatefulWidget {
  const AnalyticTab({super.key});

  @override
  ConsumerState<AnalyticTab> createState() => _AnalyticTabState();
}

class _AnalyticTabState extends ConsumerState<AnalyticTab> {
  late TransactionHistoryNotifier _transactionHistoryNotifier;
  final CancelToken _cancelToken = CancelToken();

  late Filter _filter;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _filter = monthFilter.firstWhere(
        (element) => int.parse(element.value ?? '') == DateTime.now().month);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _transactionHistoryNotifier =
          ref.read(transactionHistoryNotifierProvider.notifier);
      _refresh(isBusy: transactionAnalyticsDao.box.isEmpty);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  Future<void> _refresh({bool isBusy = true}) async {
    try {
      _transactionHistoryNotifier.resetPageCount();
      await _transactionHistoryNotifier.getTransactionsAnalytic(
          month: _filter.value ?? '',
          cancelToken: _cancelToken,
          isBusy: isBusy);
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: transactionAnalyticsDao.getListenable(),
      builder: (_, box, __) {
        final String monthYear = '${_filter.key} ${DateTime.now().year}';

        final data = transactionAnalyticsDao.fetchTransactionAnalytic(box);

        final transactionState = ref.watch(transactionHistoryNotifierProvider);

        final analytics = data?.analytic ?? [];

        final analytic = analytics.isNotEmpty ? analytics.first : null;
        return Column(
          children: [
            AnalyticFilterActionButton(
                value: _filter.key, tap: _triggerFilterModal),
            const Gap(height: 24),
            Expanded(
                child: Skeleton(
              isLoading: transactionState.isBusy,
              skeleton: const AnalyticsSkeleton(),
              child: SmartRefresher(
                  controller: _refreshController,
                  onRefresh: _refresh,
                  child: ListView(children: [
                    Text('$monthYear - Spending',
                        style: context.displaySmall?.copyWith(fontSize: 14)),
                    const Gap(height: 4),
                    Text((analytic?.totalSpending ?? 0).toNaira,
                        style: context.headlineMedium?.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    SizedBox(
                        width: context.width,
                        height: 183.h,
                        child: AnalyticalBarChart.withAnalyticalData(
                            data?.chunkedTransactions ?? [])),
                    const Gap(height: 28),
                    _buildInflowAndOutflow(
                        context: context,
                        image: AppImage.incomeArrowIcon,
                        title: 'Inflow - $monthYear',
                        value: '+ ${(analytic?.totalInflow ?? 0).toNaira}'),
                    const Gap(height: 14),
                    _buildInflowAndOutflow(
                        context: context,
                        image: AppImage.outputArrowIcon,
                        increase: false,
                        title: 'Outflow - $monthYear',
                        value: '- ${(analytic?.totalOutflow ?? 0).toNaira}'),
                    const Gap(height: 24),
                    Text(AppString.transactions,
                        style: context.headlineMedium?.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                    _buildTransactions(
                        context: context,
                        image: AppImage.televisionIcon,
                        title: AppString.cableTv,
                        money: analytic?.totalCablePurchased ?? 0,
                        percentage: analytic?.cablePercentage ?? 0),
                    _buildTransactions(
                        context: context,
                        image: AppImage.electricityIcon,
                        title: AppString.electricity,
                        money: analytic?.totalElectricityPurchased ?? 0,
                        percentage: analytic?.electricityPercentage ?? 0),
                    _buildTransactions(
                        context: context,
                        image: AppImage.airtimeIcon,
                        title: AppString.airtime,
                        money: analytic?.totalAirtimePurchased ?? 0,
                        percentage: analytic?.airtimePercentage ?? 0),
                    _buildTransactions(
                        context: context,
                        image: AppImage.dataIcon,
                        title: AppString.data,
                        money: analytic?.totalDataPurchased ?? 0,
                        percentage: analytic?.dataPercentage ?? 0),
                    _buildTransactions(
                        context: context,
                        image: AppImage.wifiIcon,
                        title: AppString.internet,
                        money: analytic?.totalInternetPurchased ?? 0,
                        percentage: analytic?.internetPercentage ?? 0),
                    _buildTransactions(
                        context: context,
                        image: AppImage.bettingIcon,
                        title: AppString.betting,
                        money: analytic?.totalBettingPurchased ?? 0,
                        percentage: analytic?.bettingPercentage ?? 0),
                    _buildTransactions(
                        context: context,
                        image: AppImage.voucherIcon,
                        title: AppString.vouchers,
                        money: analytic?.totalVoucherPurchased ?? 0,
                        percentage: analytic?.voucherPercentage ?? 0),
                    _buildTransactions(
                        context: context,
                        image: AppImage.educationIcon,
                        title: AppString.education,
                        money: analytic?.totalEducationPurchased ?? 0,
                        percentage: analytic?.educationPercentage ?? 0),
                  ])),
            ))
          ],
        );
      });

  Column _buildTransactions(
          {required BuildContext context,
          required String image,
          required String title,
          required num money,
          required num percentage,
          bool increase = true}) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(height: 12),
          const Divider(),
          const Gap(height: 12),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(12.4.w),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: AppColors.kBackgroundColor,
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(image)),
              const Gap(width: 14),
              Expanded(
                child: Text(title,
                    style: context.headlineMedium
                        ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              const Gap(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(money.toNaira,
                      style: context.headlineMedium?.copyWith(
                          fontSize: 14,
                          color: increase
                              ? AppColors.limeGreen
                              : AppColors.kColorRedDeep,
                          fontWeight: FontWeight.w500)),
                  const Gap(height: 4),
                  Text('$percentage%',
                      style: context.headlineMedium?.copyWith(
                          fontSize: 12,
                          color: AppColors.kSecondaryTextColor,
                          fontWeight: FontWeight.w700)),
                ],
              )
            ],
          ),
        ],
      );

  Container _buildInflowAndOutflow(
          {required BuildContext context,
          required String image,
          required String title,
          required String value,
          bool increase = true}) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 13.8.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.paleLavenderGray),
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: AppColors.white),
                child: SvgPicture.asset(image)),
            const Gap(width: 19),
            Expanded(
                child: Text(
              title,
              style: context.displaySmall
                  ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
            )),
            const Gap(width: 23),
            Text(value,
                style: context.displaySmall?.copyWith(
                    color: increase
                        ? AppColors.kColorGreen
                        : AppColors.kColorRedDeep,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                textAlign: TextAlign.right)
          ],
        ),
      );

  Future<void> _triggerFilterModal() async {
    _filter = await BottomSheets.showSheet(
        child: FilterSheet(
            filters: monthFilter,
            height: context.height * .7,
            title: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(AppString.selectMonth,
                  style: context.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: AppColors.kPrimaryTextColor)),
              const Gap(height: 31)
            ]))) as Filter;
    setState(() {});
    _refresh();
  }
}

import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../app/core/skeleton/widgets.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/app_strings.dart';
import '../../../../widgets/gap.dart';
import '../../domain/enum/voucher_status.dart';
import '../../domain/model/vouchers.dart';
import '../../presentation/notifier/vouchers_notifier.dart';
import '../../presentation/views/widgets/empty_voucher_widget.dart';
import 'skeleton/vouchers_skeleton.dart';

class VoucherHistoryView extends ConsumerStatefulWidget {
  const VoucherHistoryView({super.key});

  @override
  ConsumerState<VoucherHistoryView> createState() => _VoucherHistoryViewState();
}

class _VoucherHistoryViewState extends ConsumerState<VoucherHistoryView> {
  late VouchersNotifier _vouchersNotifier;
  final CancelToken _cancelToken = CancelToken();

  final List<VoucherStatus> _tabs = [
    VoucherStatus.allType,
    VoucherStatus.active,
    VoucherStatus.redeemed,
    VoucherStatus.gifted,
  ];

  VoucherStatus _tab = VoucherStatus.allType;

  final RefreshController _refreshController = RefreshController();
  bool get _fetchAll =>
      (_tab == VoucherStatus.allType || _tab == VoucherStatus.gifted);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeNotifier());
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  void _initializeNotifier() {
    _vouchersNotifier = ref.read(vouchersNotifierProvider.notifier);
    _refresh();
  }

  Future<void> _refresh({VoucherStatus? status}) async {
    try {
      _vouchersNotifier.resetPageCount();
      await _vouchersNotifier.getVouchers(
          status: status, refreshed: true, cancelToken: _cancelToken);
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  Future<void> _paginateNotification() async {
    try {
      _vouchersNotifier.increamentPageCount();
      await _vouchersNotifier.getVouchers(cancelToken: _cancelToken);
      _refreshController.loadComplete();
    } catch (e) {
      _refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final voucherState = ref.watch(vouchersNotifierProvider);
    final List<Vouchers> vouchers = voucherState.vouchers;
    return Scaffold(
      appBar: AppBar(title: Text(AppString.vouchers)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            _buildTabsRow(),
            const Gap(height: 24),
            Flexible(
              child: Skeleton(
                isLoading: voucherState.isBusy,
                skeleton: const VouchersSkeleton(),
                child: SmartRefresher(
                  enablePullUp: true,
                  controller: _refreshController,
                  onRefresh: _refresh,
                  onLoading: _paginateNotification,
                  child: vouchers.isEmpty
                      ? const Center(child: EmptyVoucherView())
                      : _buildVouchersList(vouchers),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabsRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _tabs
            .map(
              (tab) => InkWell(
                onTap: () async {
                  setState(() => _tab = tab);
                  await _refresh(status: _fetchAll ? null : _tab);
                },
                borderRadius: BorderRadius.circular(15.r),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _tab == tab
                        ? AppColors.kPrimaryTextColor
                        : AppColors.kBackgroundColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Text(
                    tab.value.titleCase,
                    style: context.headlineMedium?.copyWith(
                      fontSize: 12,
                      color: _tab == tab ? AppColors.white : null,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
            .toList(),
      );

  Widget _buildVouchersList(List<Vouchers> vouchers) => ListView.separated(
        itemBuilder: (_, index) {
          final voucher = _tab == VoucherStatus.gifted
              ? vouchers
                  .where((element) => element.gifteeId != null)
                  .toList()[index]
              : vouchers[index];

          final bool isSameDate = index == 0
              ? false
              : voucher.createdAt!.isSameDate(vouchers[index - 1].createdAt!);

          final bool isGifted = voucher.status == VoucherStatus.gifted;

          final Color bgColor = _getBackgroundColor(voucher.status);
          final Color textColor = _getTextColor(voucher.status);

          final String status = switch (voucher.status) {
            VoucherStatus.active => "Active",
            VoucherStatus.redeemed => "Redeemed",
            VoucherStatus.inactive => "Redeemed",
            VoucherStatus.gifted => "Gifted",
            VoucherStatus.allType => ""
          };

          if (index == 0 || !(isSameDate)) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  voucher.createdAt?.monthDayYear ?? '',
                  style: context.displaySmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Gap(height: 12),
                _buildItems(
                    status: status,
                    voucher: voucher,
                    context: context,
                    isGifted: isGifted,
                    bgColor: bgColor,
                    textColor: textColor),
              ],
            );
          }

          return _buildItems(
              status: status,
              voucher: voucher,
              context: context,
              isGifted: isGifted,
              bgColor: bgColor,
              textColor: textColor);
        },
        separatorBuilder: (_, __) =>
            const Column(children: [Gap(height: 8), Divider(), Gap(height: 8)]),
        itemCount: _tab == VoucherStatus.gifted
            ? vouchers
                .where((element) => element.gifteeId != null)
                .toList()
                .length
            : vouchers.length,
        // itemCount: vouchers.length,
      );

  Widget _buildItems(
          {required String status,
          required Vouchers voucher,
          required BuildContext context,
          required bool isGifted,
          required Color bgColor,
          required Color textColor}) =>
      Row(
        children: [
          Expanded(
            child: Text(
              voucher.code ?? '',
              style: context.headlineMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const Gap(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  voucher.amount.toNaira,
                  style: context.headlineLarge?.copyWith(
                    fontSize: 14,
                    color: isGifted
                        ? AppColors.kColorRedDeep
                        : AppColors.kColorGreen,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
                const Gap(height: 4),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Text(
                    status.titleCase,
                    style: context.headlineMedium?.copyWith(
                      fontSize: 12,
                      color: textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Color _getBackgroundColor(VoucherStatus status) {
    switch (status) {
      case VoucherStatus.gifted:
        return AppColors.kBlueColor;
      case VoucherStatus.active:
        return AppColors.kLightPurple;
      case VoucherStatus.redeemed:
        return AppColors.kBackgroundColor;
      case VoucherStatus.inactive:
        return AppColors.kBackgroundColor;
      case VoucherStatus.allType:
        return Colors.transparent;
    }
  }

  Color _getTextColor(VoucherStatus status) {
    switch (status) {
      case VoucherStatus.gifted:
        return AppColors.white;
      case VoucherStatus.active:
        return AppColors.kPurple100;
      case VoucherStatus.redeemed:
        return AppColors.kPrimaryTextColor;
      case VoucherStatus.inactive:
        return AppColors.kPrimaryTextColor;
      case VoucherStatus.allType:
        return Colors.transparent;
    }
  }
}

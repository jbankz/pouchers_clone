import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/voucher/data/dao/vouchers_dao.dart';
import 'package:pouchers/ui/features/voucher/domain/model/vouchers.dart';
import 'package:pouchers/ui/features/voucher/presentation/notifier/vouchers_notifier.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../widgets/ticket_widget.dart';
import 'widgets/empty_voucher_widget.dart';

class VoucherView extends ConsumerStatefulWidget {
  const VoucherView({super.key});

  @override
  ConsumerState<VoucherView> createState() => _VoucherViewState();
}

class _VoucherViewState extends ConsumerState<VoucherView> {
  late VouchersNotifier _vouchersNotifier;
  final CancelToken _cancelToken = CancelToken();

  int _pageIndex = 0;

  final RefreshController _refreshController = RefreshController();

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

  Future<void> _refresh() async {
    try {
      await _vouchersNotifier.getVouchers(cancelToken: _cancelToken);
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final voucherState = ref.watch(vouchersNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppString.vouchers)),
      body: ValueListenableBuilder<Box>(
        valueListenable: vouchersDao.getListenable(),
        builder: (_, box, __) {
          final vouchers = vouchersDao.retrieve(box);
          return SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: _refresh,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Builder(builder: (_) {
                      if (voucherState.isBusy) return const SizedBox.shrink();

                      final unReedemedVouchers = vouchers
                          .where((element) => !element.redeemed)
                          .toList();

                      if (unReedemedVouchers.isEmpty) {
                        return const EmptyVoucherView();
                      }

                      return _buildSlider(unReedemedVouchers);
                    }),
                    _buildActionButtons(context),
                    const Gap(height: 20),
                    _buildSecondaryActionButtons(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Column _buildSlider(List<Vouchers> vouchers) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 124.h,
            child: PageView.builder(
              itemCount: vouchers.length,
              onPageChanged: (page) => setState(() => _pageIndex = page),
              itemBuilder: (_, index) {
                final voucher = vouchers[index];
                return TicketWidget(
                    code: voucher.code ?? '',
                    amount: voucher.amount.toNaira,
                    date: voucher.createdAt);
              },
            ),
          ),
          const Gap(height: 33),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              vouchers.length,
              (index) => Container(
                height: 8.h,
                width: 8.w,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _pageIndex == index
                      ? AppColors.kPurple100
                      : AppColors.kLightPurple,
                ),
              ),
            ),
          ),
          const Gap(height: 56),
        ],
      );

  Widget _buildActionButtons(BuildContext context) => Row(
        children: [
          _buildActionButton(
            context: context,
            title: AppString.buyVoucher,
            image: AppImage.buyVoucher,
            tapped: () => PageRouter.pushNamed(Routes.buyVoucherView),
          ),
          const Gap(width: 20),
          _buildActionButton(
            context: context,
            title: AppString.giftVoucher,
            image: AppImage.giftVoucher,
            tapped: () => PageRouter.pushNamed(Routes.giftVoucherView),
          ),
        ],
      );

  Widget _buildSecondaryActionButtons(BuildContext context) => Row(
        children: [
          _buildActionButton(
            context: context,
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 42),
            title: AppString.redeemVoucher,
            image: AppImage.redeemVoucher,
            tapped: () => PageRouter.pushNamed(Routes.redeemVoucherView),
          ),
          const Gap(width: 20),
          _buildActionButton(
            context: context,
            title: AppString.voucherHistory,
            image: AppImage.voucherHistory,
            tapped: () async {
              await PageRouter.pushNamed(Routes.voucherHistoryView);
              await _refresh();
            },
          ),
        ],
      );

  Widget _buildActionButton({
    required BuildContext context,
    required String title,
    required String image,
    required Function() tapped,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(horizontal: 40, vertical: 42),
  }) =>
      Expanded(
        child: CupertinoButton(
          onPressed: tapped,
          padding: EdgeInsets.zero,
          child: Container(
            padding: padding,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.paleLavenderGray,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: [
                SvgPicture.asset(image),
                const Gap(height: 16),
                Text(
                  title,
                  style: context.headlineMedium?.copyWith(
                    color: AppColors.kPurpleLight100,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

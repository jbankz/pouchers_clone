import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../../common/app_colors.dart';
import '../../../data/dao/vouchers_dao.dart';
import '../../notifier/vouchers_notifier.dart';
import '../skeleton/vouchers_skeleton.dart';

class VouchersSheet extends ConsumerStatefulWidget {
  const VouchersSheet({super.key});

  @override
  ConsumerState<VouchersSheet> createState() => _VouchersSheetState();
}

class _VouchersSheetState extends ConsumerState<VouchersSheet> {
  final CancelToken _cancelToken = CancelToken();

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

  void _initializeNotifier() {}

  @override
  Widget build(BuildContext context) {
    final voucherState = ref.watch(vouchersNotifierProvider);
    return SizedBox(
      width: double.infinity,
      child: ValueListenableBuilder<Box>(
          valueListenable: vouchersDao.getListenable(),
          builder: (_, box, __) {
            final vouchers = vouchersDao
                .retrieve(box)
                .where((element) => !element.redeemed)
                .toList();
            return SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 20.w),
              child: Wrap(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(AppString.availableVouchers,
                          style: context.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: AppColors.kPrimaryTextColor)),
                      const Gap(height: 16),
                      SizedBox(
                        height: context.height * .4,
                        child: Skeleton(
                          isLoading: voucherState.isBusy,
                          skeleton: const VouchersSkeleton(),
                          child: ListView.separated(
                              itemBuilder: (_, index) {
                                final voucher = vouchers[index];
                                return GestureDetector(
                                  onTap: () => PageRouter.pop(voucher),
                                  child: Container(
                                      width: double.infinity,
                                      color: Colors.transparent,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16.h),
                                      child: Row(children: [
                                        Expanded(
                                          child: Text(voucher.code ?? '',
                                              style: context.titleLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16),
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        const Gap(width: 23),
                                        Expanded(
                                          child: Text(voucher.amount.toNaira,
                                              style: context.titleLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color:
                                                          AppColors.limeGreen),
                                              textAlign: TextAlign.right),
                                        )
                                      ])),
                                );
                              },
                              separatorBuilder: (_, __) => const Divider(),
                              itemCount: vouchers.length),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

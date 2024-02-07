import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_strings.dart';
import '../../../notifier/billers_notifier.dart';
import '../skeleton/data_service_skeleton.dart';

class DataBundleSheets extends ConsumerStatefulWidget {
  const DataBundleSheets({required this.providerId, super.key});

  final String providerId;

  @override
  ConsumerState<DataBundleSheets> createState() => _DataBundleSheetsState();
}

class _DataBundleSheetsState extends ConsumerState<DataBundleSheets> {
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => ref
        .read(billersNotifierProvider.notifier)
        .mobileDataServices(widget.providerId, _cancelToken));
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final billerState = ref.watch(billersNotifierProvider);
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20.w),
        child: Wrap(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppString.subscriptionType,
                    style: context.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: AppColors.kPrimaryTextColor)),
                const Gap(height: 16),
                SizedBox(
                  height: context.height * .4,
                  child: Skeleton(
                    isLoading: billerState.isGettingServices,
                    skeleton: const DataServiceSkeleton(),
                    child: ListView.separated(
                        itemBuilder: (_, index) {
                          final service =
                              billerState.mobileOperatorServices[index];
                          return GestureDetector(
                            onTap: () => PageRouter.pop(service),
                            child: Container(
                                width: double.infinity,
                                color: Colors.transparent,
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                child: Row(children: [
                                  Expanded(
                                    child: Text(service.serviceName ?? '',
                                        style: context.titleLarge?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: AppColors.kIconGrey,
                                        ),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const Gap(width: 23),
                                  Expanded(
                                    child: Text(service.servicePrice.toNaira,
                                        style: context.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: AppColors.kIconGrey),
                                        textAlign: TextAlign.right),
                                  )
                                ])),
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                        itemCount: billerState.mobileOperatorServices.length),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../../app/core/skeleton/widgets.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';
import '../../../domain/dto/billers_dto.dart';
import '../../notifier/billers_notifier.dart';
import '../data/skeleton/data_service_skeleton.dart';

class ProviderServiceSheet extends ConsumerStatefulWidget {
  const ProviderServiceSheet({required this.billersDto, super.key});

  final BillersDto billersDto;

  @override
  ConsumerState<ProviderServiceSheet> createState() =>
      _ProviderServiceSheetState();
}

class _ProviderServiceSheetState extends ConsumerState<ProviderServiceSheet> {
  late BillersNotifier _billersNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _billersNotifier = ref.read(billersNotifierProvider.notifier)
        ..getCableProviderServices(
            biller: widget.billersDto, cancelToken: _cancelToken);
    });
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
        minimum: EdgeInsets.symmetric(horizontal: 16.w),
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
                                  billerState.cableService?.services[index];
                              return GestureDetector(
                                onTap: () => PageRouter.pop(service),
                                child: Container(
                                    width: double.infinity,
                                    color: Colors.transparent,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.h),
                                    child: Row(children: [
                                      Expanded(
                                        child: Text(service?.name ?? '',
                                            style: context.titleLarge?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: AppColors.kIconGrey,
                                            ),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      const Gap(width: 16),
                                      service?.price == 0
                                          ? const SizedBox.shrink()
                                          : Expanded(
                                              child: Text(
                                                  service?.price.toNaira ?? '',
                                                  style: context.titleLarge
                                                      ?.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: AppColors.kIconGrey,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                    ])),
                              );
                            },
                            separatorBuilder: (_, __) => const Divider(),
                            itemCount:
                                billerState.cableService?.services.length ??
                                    0)))
              ],
            )
          ],
        ),
      ),
    );
  }
}

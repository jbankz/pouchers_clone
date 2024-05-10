import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/utilities/presentation/views/widget/unavailable_widget.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../../app/core/skeleton/widgets.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../widgets/gap.dart';
import '../../notifier/billers_notifier.dart';
import '../data/skeleton/data_service_skeleton.dart';

class ProvidersSheet extends HookConsumerWidget {
  const ProvidersSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billerState = ref.watch(billersNotifierProvider);
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Wrap(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppString.selectProvider,
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
                          final service = billerState.billers[index];
                          return GestureDetector(
                            onTap: () {
                              if (!service.isAvailable) return;

                              PageRouter.pop(service);
                            },
                            child: Container(
                                width: double.infinity,
                                color: Colors.transparent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 20.w),
                                child: Row(children: [
                                  CachedNetworkImage(
                                      height: 40.h,
                                      width: 40.w,
                                      imageUrl: service.logoUrl ?? '',
                                      errorWidget: (_, __, ___) => Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1.w,
                                                    color: AppColors
                                                        .kPrimaryColor
                                                        .withOpacity(.30))),
                                          )),
                                  const Gap(width: 12),
                                  Expanded(
                                    child: Text(
                                        service.displayName?.titleCase ?? '',
                                        style: context.titleLarge?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: AppColors.kIconGrey,
                                        ),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const Gap(width: 12),
                                  if (!service.isAvailable)
                                    const UnavailableWidget()
                                ])),
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                        itemCount: billerState.billers.length),
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

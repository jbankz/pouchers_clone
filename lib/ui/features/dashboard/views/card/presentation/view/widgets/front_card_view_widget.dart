import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../common/app_colors.dart';
import '../../../../../../../common/app_images.dart';
import '../../../../../../../widgets/gap.dart';
import '../../../domain/enum/currency.dart';
import '../../../domain/util/card_icon.dart';
import '../../notifier/card_notifier.dart';
import '../../notifier/module/module.dart';

class FrontCardViewWidget extends HookConsumerWidget {
  const FrontCardViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(cardNotifierProvider);

    final accountBalance = appState.virtualAccountBalance;

    final cardDetail = appState.virtualCardDetails;

    final String customerName = cardDetail?.customer?.name?.titleCase ?? '';

    final bool isNairaCurrency =
        ref.watch(paramModule).cardDetail?.currency == Currency.ngn;

    final String balance = isNairaCurrency
        ? accountBalance?.currentBalance.toNaira ?? ''
        : accountBalance?.currentBalance.toDollar ?? '';

    return Container(
      height: 206.h,
      decoration: BoxDecoration(
          color:
              isNairaCurrency ? AppColors.kGreen100Color : AppColors.kPurple400,
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(
              image: AssetImage(AppImage.ellipses), fit: BoxFit.cover)),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              isNairaCurrency
                  ? AppImage.curvedNairaIcon
                  : AppImage.curvedDollarIcon,
              height: 85.h,
              width: 85.w,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Balance',
                        style: context.titleLarge
                            ?.copyWith(color: AppColors.white)),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      child: appState.isBusy
                          ? const CupertinoActivityIndicator(
                              color: Colors.white)
                          : Text(
                              balance,
                              style: context.displayLarge?.copyWith(
                                  color: AppColors.white, fontSize: 24),
                            ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.fromLTRB(19.w, 9.h, 16.w, 19.h),
                decoration: BoxDecoration(
                    color: AppColors.kDeepPurple,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16.r))),
                child: Row(
                  children: [
                    Expanded(
                      child: appState.isBusy
                          ? const Align(
                              alignment: Alignment.centerLeft,
                              child: CupertinoActivityIndicator(
                                  color: Colors.white))
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  customerName,
                                  style: context.displayLarge?.copyWith(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Gap(height: 4),
                                Text(
                                  cardDetail?.maskedPan ?? '',
                                  style: context.displayLarge?.copyWith(
                                      color: AppColors.white.withOpacity(.80),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                    ),
                    SvgPicture.asset(CardIcon.returnIcon(cardDetail?.brand))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

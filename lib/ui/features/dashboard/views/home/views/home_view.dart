import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_colors.dart';
import 'widgets/balance_widget.dart';
import 'widgets/build_quick_action_button.dart';
import 'widgets/home_appbar.dart';
import 'widgets/sliders_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late WalletNotifier _walletNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _walletNotifier =
        ref.read(walletNotifierProvider.notifier)..getWalletBalance());
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            const Gap(height: 10),
            const HomeAppBar(),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const BalanceWidget(),
                            const Gap(height: 36),
                            Text(AppString.quickLinks,
                                style: context.headlineLarge?.copyWith(
                                    color: AppColors.kDarkFill,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14)),
                            const Gap(height: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BuildQuickActionButton(
                                    icon: AppImage.airtimeIcon,
                                    title: AppString.airtime,
                                    onPressed: () {}),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.dataIcon,
                                    title: AppString.data),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.televisionIcon,
                                    title: AppString.cableTv),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.electricityIcon,
                                    title: AppString.electricity),
                              ],
                            ),
                            const Gap(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BuildQuickActionButton(
                                    icon: AppImage.wifiIcon,
                                    title: AppString.internet),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.bettingIcon,
                                    title: AppString.betting),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.voucherIcon,
                                    title: AppString.vouchers),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.moreIcon,
                                    title: AppString.more),
                              ],
                            ),
                          ])),
                  const Gap(height: 32),
                  const SlidersWidget()
                ],
              ),
            ),
          ],
        )),
      );
}

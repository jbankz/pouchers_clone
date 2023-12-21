import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/admin/presentation/notifier/admin_notifier.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../modules/utilities/screens/betting.dart';
import '../../../../../../modules/utilities/screens/buy_cable.dart';
import '../../../../../../modules/utilities/screens/buy_education.dart';
import '../../../../../../modules/utilities/screens/buy_electricity.dart';
import '../../../../../../modules/utilities/screens/buy_internet.dart';
import '../../../../../../modules/utilities/screens/voucher/voucher.dart';
import '../../../../../common/app_colors.dart';
import '../../../../notification/presentation/notifier/notification_notifier.dart';
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
  late AdminNotifier _adminNotifier;
  late NotificationNotifier _notificationNotifier;

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchData());
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  Future<void> _fetchData() async {
    _walletNotifier = ref.read(walletNotifierProvider.notifier)
      ..getWalletBalance(_cancelToken);
    _adminNotifier = ref.read(adminNotifierProvider.notifier)
      ..getBanners(_cancelToken);
    _notificationNotifier = ref.read(notificationNotifierProvider.notifier)
      ..fetchUnreadPaymentNotifications(cancelToken: _cancelToken);
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
                            const Gap(height: 12),
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
                                    onPressed: () => PageRouter.pushNamed(
                                        Routes.airtimeView)),
                                // onPressed: () => pushTo(context,
                                //     const BuyAirtime(isGuest: false))),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.dataIcon,
                                    title: AppString.data,
                                    onPressed: () =>
                                        PageRouter.pushNamed(Routes.dataView)),
                                // onPressed: () => pushTo(context,
                                //     const BuyData(isGuest: false))),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.televisionIcon,
                                    title: AppString.cableTv,
                                    onPressed: () => PageRouter.pushNamed(
                                        Routes.cableTvView)),
                                // onPressed: () => pushTo(context,
                                //     const BuyCable(isGuest: false))),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.electricityIcon,
                                    title: AppString.electricity,
                                    onPressed: () => pushTo(context,
                                        const BuyElectricity(isGuest: false))),
                              ],
                            ),
                            const Gap(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BuildQuickActionButton(
                                    icon: AppImage.wifiIcon,
                                    title: AppString.internet,
                                    onPressed: () => pushTo(context,
                                        const BuyInternet(isGuest: false))),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.bettingIcon,
                                    title: AppString.betting,
                                    onPressed: () => pushTo(context,
                                        const Betting(isGuest: false))),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.voucherIcon,
                                    title: AppString.vouchers,
                                    onPressed: () => pushTo(context,
                                        const Vouchers(isGuest: false))),
                                Gap(width: 37.w),
                                BuildQuickActionButton(
                                    icon: AppImage.educationIcon,
                                    title: AppString.education,
                                    onPressed: () => pushTo(context,
                                        const BuyEducation(isGuest: false))),
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

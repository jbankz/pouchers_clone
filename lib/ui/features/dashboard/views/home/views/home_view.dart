import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/admin/presentation/notifier/admin_notifier.dart';
import 'package:pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

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

class _HomeViewState extends ConsumerState<HomeView>
    with TickerProviderStateMixin {
  late WalletNotifier _walletNotifier;
  late AdminNotifier _adminNotifier;
  late NotificationNotifier _notificationNotifier;

  final CancelToken _cancelToken = CancelToken();

  final RefreshController _refreshController = RefreshController();

  late AnimationController _airtimeAnimationController;
  late AnimationController _cableAnimationController;
  late AnimationController _dataAnimationController;
  late AnimationController _electricityAnimationController;
  late AnimationController _educationAnimationController;
  late AnimationController _internetAnimationController;
  late AnimationController _vouchersAnimationController;
  late AnimationController _bettingAnimationController;
  late AnimationController _boardAnimationController;
  late AnimationController _cardImageAnimationController;

  @override
  void initState() {
    _initializeAnimationController();
    Future.microtask(() => _initializeNotifiers());
    super.initState();
  }

  @override
  void dispose() {
    _disposeAnimationControllers();
    _cancelToken.cancel();
    super.dispose();
  }

  void _initializeAnimationController() {
    _boardAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward();
    _airtimeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward();
    _dataAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..forward();
    _cableAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..forward();
    _electricityAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..forward();
    _internetAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900))
      ..forward();
    _bettingAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
    _vouchersAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100))
      ..forward();
    _educationAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..forward();
    _cardImageAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..forward();
  }

  void _initializeNotifiers() {
    _walletNotifier = ref.read(walletNotifierProvider.notifier);
    _adminNotifier = ref.read(adminNotifierProvider.notifier);
    _notificationNotifier = ref.read(notificationNotifierProvider.notifier);

    _fetchData();
  }

  void _disposeAnimationControllers() {
    _airtimeAnimationController.dispose();
    _dataAnimationController.dispose();
    _cableAnimationController.dispose();
    _electricityAnimationController.dispose();
    _internetAnimationController.dispose();
    _bettingAnimationController.dispose();
    _vouchersAnimationController.dispose();
    _educationAnimationController.dispose();
  }

  Future<void> _fetchData() async {
    await Future.wait([
      _walletNotifier.getWalletBalance(_cancelToken),
      _adminNotifier.getBanners(_cancelToken),
      _notificationNotifier.fetchUnreadPaymentNotifications(
          cancelToken: _cancelToken),
      _notificationNotifier.fetchNotifications(cancelToken: _cancelToken)
    ]);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            const Gap(height: 10),
            const HomeAppBar(),
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: _fetchData,
                child: ListView(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(height: 12),
                              FadeTransition(
                                  opacity: _boardAnimationController,
                                  child: const BalanceWidget()),
                              const Gap(height: 36),
                              Text(AppString.quickLinks,
                                  style: context.headlineLarge?.copyWith(
                                      color: AppColors.kDarkFill,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14)),
                              const Gap(height: 14),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BuildQuickActionButton(
                                      animationController:
                                          _airtimeAnimationController,
                                      icon: AppImage.airtimeIcon,
                                      title: AppString.airtime,
                                      onPressed: () => PageRouter.pushNamed(
                                          Routes.airtimeView)),
                                  Gap(width: 37.w),
                                  BuildQuickActionButton(
                                      animationController:
                                          _dataAnimationController,
                                      icon: AppImage.dataIcon,
                                      title: AppString.data,
                                      onPressed: () => PageRouter.pushNamed(
                                          Routes.dataView)),
                                  Gap(width: 37.w),
                                  BuildQuickActionButton(
                                      animationController:
                                          _cableAnimationController,
                                      icon: AppImage.televisionIcon,
                                      title: AppString.cableTv,
                                      onPressed: () => PageRouter.pushNamed(
                                          Routes.cableTvView)),
                                  Gap(width: 37.w),
                                  BuildQuickActionButton(
                                      animationController:
                                          _electricityAnimationController,
                                      icon: AppImage.electricityIcon,
                                      title: AppString.electricity,
                                      onPressed: () => PageRouter.pushNamed(
                                          Routes.electricityView)),
                                ],
                              ),
                              const Gap(height: 18),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BuildQuickActionButton(
                                      animationController:
                                          _dataAnimationController,
                                      icon: AppImage.wifiIcon,
                                      title: AppString.internet,
                                      onPressed: () => PageRouter.pushNamed(
                                          Routes.internetView)),
                                  Gap(width: 37.w),
                                  BuildQuickActionButton(
                                      animationController:
                                          _bettingAnimationController,
                                      icon: AppImage.bettingIcon,
                                      title: AppString.betting,
                                      onPressed: () => PageRouter.pushNamed(
                                          Routes.bettingView)),
                                  Gap(width: 37.w),
                                  BuildQuickActionButton(
                                      animationController:
                                          _vouchersAnimationController,
                                      icon: AppImage.voucherIcon,
                                      title: AppString.vouchers,
                                      onPressed: () => PageRouter.pushNamed(
                                          Routes.voucherView)),
                                  Gap(width: 37.w),
                                  BuildQuickActionButton(
                                      animationController:
                                          _educationAnimationController,
                                      icon: AppImage.educationIcon,
                                      title: AppString.education,
                                      onPressed: () => PageRouter.pushNamed(
                                          Routes.educationView)),
                                ],
                              ),
                            ])),
                    const Gap(height: 32),
                    FadeTransition(
                        opacity: _cardImageAnimationController,
                        child: SlideTransition(
                            position: Tween<Offset>(
                                    begin: const Offset(0, 1), end: Offset.zero)
                                .animate(CurvedAnimation(
                                    parent: _cardImageAnimationController,
                                    curve: Curves.easeIn)),
                            child: const SlidersWidget())),
                    const Gap(height: 16),
                  ],
                ),
              ),
            ),
          ],
        )),
      );
}

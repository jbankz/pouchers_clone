import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/guest/notifier/guest_notifier.dart';
import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/core/router/page_router.dart';
import '../../common/app_colors.dart';
import '../../widgets/dialog/guest_modal_sheet.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/outline_button_widget.dart';
import '../onboarding/presentation/views/widgets/payment_widget.dart';

class GuestView extends ConsumerStatefulWidget {
  const GuestView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GuestViewState();
}

class _GuestViewState extends ConsumerState<GuestView>
    with TickerProviderStateMixin {
  late AnimationController _airtimeAnimationController;
  late AnimationController _cableAnimationController;
  late AnimationController _dataAnimationController;
  late AnimationController _electricityAnimationController;
  late AnimationController _educationAnimationController;
  late AnimationController _internetAnimationController;
  late AnimationController _ticketsAnimationController;
  late AnimationController _vouchersAnimationController;
  late AnimationController _bettingAnimationController;
  late AnimationController _buttonsAnimationController;

  @override
  void initState() {
    _airtimeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..forward();
    _cableAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
    _dataAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300))
      ..forward();
    _electricityAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600))
      ..forward();
    _educationAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1900))
      ..forward();
    _internetAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2200))
      ..forward();
    _ticketsAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500))
      ..forward();
    _vouchersAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2800))
      ..forward();
    _bettingAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3100))
      ..forward();
    _buttonsAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward();
    super.initState();
  }

  @override
  void dispose() {
    _airtimeAnimationController.dispose();
    _cableAnimationController.dispose();
    _dataAnimationController.dispose();
    _electricityAnimationController.dispose();
    _educationAnimationController.dispose();
    _internetAnimationController.dispose();
    _ticketsAnimationController.dispose();
    _vouchersAnimationController.dispose();
    _bettingAnimationController.dispose();
    _buttonsAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final guestNotifier = ref.read(guestNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                    opacity: _buttonsAnimationController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(AppString.welcomeGuest,
                            style: context.bodyMedium
                                ?.copyWith(color: AppColors.kIconGrey)),
                        const Gap(height: 26),
                        Text(AppString.selectPayment,
                            style:
                                context.displayLarge?.copyWith(fontSize: 14)),
                        const Gap(height: 22),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PaymentWidget(
                          animationController: _airtimeAnimationController,
                          title: AppString.airtime,
                          asset: AppImage.airtimeIcon,
                          onPressed: () => guestNotifier
                              .setRouteDestination(Routes.airtimeView)),
                      PaymentWidget(
                          animationController: _cableAnimationController,
                          title: AppString.cableTv,
                          asset: AppImage.televisionIcon,
                          onPressed: () => guestNotifier
                              .setRouteDestination(Routes.cableTvView)),
                      PaymentWidget(
                          animationController: _dataAnimationController,
                          title: AppString.data,
                          asset: AppImage.dataIcon,
                          onPressed: () => guestNotifier
                              .setRouteDestination(Routes.dataView)),
                    ],
                  ),
                  const Gap(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PaymentWidget(
                          animationController: _electricityAnimationController,
                          title: AppString.electricity,
                          asset: AppImage.electricityIcon,
                          onPressed: () => guestNotifier
                              .setRouteDestination(Routes.electricityView)),
                      PaymentWidget(
                          animationController: _educationAnimationController,
                          title: AppString.education,
                          asset: AppImage.educationIcon,
                          onPressed: () => guestNotifier
                              .setRouteDestination(Routes.educationView)),
                      PaymentWidget(
                          animationController: _internetAnimationController,
                          title: AppString.internet,
                          asset: AppImage.wifiIcon,
                          onPressed: () => guestNotifier
                              .setRouteDestination(Routes.internetView)),
                    ],
                  ),
                  const Gap(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PaymentWidget(
                          animationController: _ticketsAnimationController,
                          title: AppString.tickets,
                          asset: AppImage.ticketIcon,
                          onPressed: () => BottomSheets.showAlertDialog(
                              child: const GuestDiscountSheet())),
                      const Gap(width: 69.5),
                      PaymentWidget(
                          animationController: _vouchersAnimationController,
                          title: AppString.vouchers,
                          asset: AppImage.voucherIcon,
                          onPressed: () => BottomSheets.showAlertDialog(
                              child: const GuestDiscountSheet())),
                      const Gap(width: 69.5),
                      PaymentWidget(
                          animationController: _bettingAnimationController,
                          title: AppString.betting,
                          asset: AppImage.bettingIcon,
                          onPressed: () => guestNotifier
                              .setRouteDestination(Routes.bettingView)),
                    ],
                  ),
                ],
              ),
            ),
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: AppColors.paleLavenderGray,
            child: Column(
              children: [
                const Gap(height: 15),
                FadeScaleTransition(
                    animation: _buttonsAnimationController,
                    child: Text(AppString.paymentHub,
                        style: context.displayLarge)),
                const Gap(height: 41),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                      parent: _buttonsAnimationController,
                      curve: Curves.easeInOut)),
                  child: Row(
                    children: [
                      Expanded(
                          child: OutlineButtonWidget(
                              title: AppString.login,
                              onPressed: () =>
                                  PageRouter.pushNamed(Routes.signInView))),
                      const Gap(width: 17),
                      Expanded(
                          child: ElevatedButtonWidget(
                              title: AppString.register,
                              onPressed: () =>
                                  PageRouter.pushNamed(Routes.signUpView))),
                    ],
                  ),
                ),
                const Gap(height: 24),
              ],
            ),
          )
        ],
      ),
    );
  }
}

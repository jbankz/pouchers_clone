import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/guest/notifier/guest_notifier.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/core/router/page_router.dart';
import '../../../modules/onboarding/screens/welcome_guest.dart';
import '../../common/app_colors.dart';
import '../../widgets/dialog/guest_modal_sheet.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/outline_button_widget.dart';
import '../onboarding/presentation/views/widgets/payment_widget.dart';

class GuestView extends HookConsumerWidget {
  const GuestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _guestNotifier = ref.read(guestNotifierProvider.notifier);
    return 2 < 2
        ? WelcomeGuest()
        : Scaffold(
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
                        Text(AppString.welcomeGuest,
                            style: context.bodyMedium
                                ?.copyWith(color: AppColors.kIconGrey)),
                        const Gap(height: 26),
                        Text(AppString.selectPayment,
                            style:
                                context.displayLarge?.copyWith(fontSize: 14)),
                        const Gap(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PaymentWidget(
                                title: AppString.airtime,
                                asset: AppImage.airtimeIcon,
                                onPressed: () => _guestNotifier
                                    .setRouteDestination(Routes.airtimeView)),
                            PaymentWidget(
                                title: AppString.cableTv,
                                asset: AppImage.televisionIcon,
                                onPressed: () => _guestNotifier
                                    .setRouteDestination(Routes.cableTvView)),
                            PaymentWidget(
                                title: AppString.data,
                                asset: AppImage.dataIcon,
                                onPressed: () => _guestNotifier
                                    .setRouteDestination(Routes.dataView)),
                          ],
                        ),
                        const Gap(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PaymentWidget(
                                title: AppString.electricity,
                                asset: AppImage.electricityIcon,
                                onPressed: () =>
                                    _guestNotifier.setRouteDestination(
                                        Routes.electricityView)),
                            PaymentWidget(
                                title: AppString.education,
                                asset: AppImage.educationIcon,
                                onPressed: () => _guestNotifier
                                    .setRouteDestination(Routes.educationView)),
                            PaymentWidget(
                                title: AppString.internet,
                                asset: AppImage.wifiIcon,
                                onPressed: () => _guestNotifier
                                    .setRouteDestination(Routes.internetView)),
                          ],
                        ),
                        const Gap(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PaymentWidget(
                                title: AppString.tickets,
                                asset: AppImage.ticketIcon,
                                onPressed: () => BottomSheets.showAlertDialog(
                                    child: const GuestDiscountSheet())),
                            const Gap(width: 69.5),
                            PaymentWidget(
                                title: AppString.vouchers,
                                asset: AppImage.voucherIcon,
                                onPressed: () => BottomSheets.showAlertDialog(
                                    child: const GuestDiscountSheet())),
                            const Gap(width: 69.5),
                            PaymentWidget(
                                title: AppString.betting,
                                asset: AppImage.bettingIcon,
                                onPressed: () => _guestNotifier
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
                      Text(AppString.paymentHub, style: context.displayLarge),
                      const Gap(height: 41),
                      Row(
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
                      const Gap(height: 24),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

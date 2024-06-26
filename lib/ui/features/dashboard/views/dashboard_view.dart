import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import 'package:pouchers/app/core/auto_logout/module/module.dart';
import 'package:pouchers/ui/features/dashboard/model/bottom_nav.dart';

import '../../../../app/core/manager/firebase_messaging_manager.dart';
import '../../../common/app_colors.dart';
import 'account/views/account_view.dart';
import 'card/presentation/view/virtual_card_view.dart';
import 'home/views/home_view.dart';
import 'transaction/presentation/view/transaction_history_view.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key, this.gottenIndex = 0});

  final int gottenIndex;

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.gottenIndex;

    Future.microtask(() async {
      await FirebaseMessagingManager.initializeInstance(ref);
      ref.read(timerProvider).startTimer();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
        child: PageTransitionSwitcher(
          child: switch (_pageIndex) {
            0 => const HomeView(),
            1 => const VirtualCardView(),
            2 => const TransactionHistoryView(),
            3 => const AccountView(),
            int() => const Scaffold()
          },
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              SharedAxisTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                  fillColor: Colors.transparent,
                  child: child),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(.12),
                blurRadius: 2,
                offset: const Offset(0, -2))
          ],
        ),
        child: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: BottomNavigationBar(
              currentIndex: _pageIndex,
              onTap: onTap,
              type: BottomNavigationBarType.fixed,
              items: List.generate(bottomNav.length, (index) {
                final button = bottomNav[index];
                return BottomNavigationBarItem(
                    icon: _pageIndex == index
                        ? Lottie.asset(button.enabledIcon,
                            height: 25.h, width: 25.w, fit: BoxFit.contain)
                        : SvgPicture.asset(button.disabledIcon,
                            colorFilter: const ColorFilter.mode(
                                AppColors.kSecondaryTextColor,
                                BlendMode.srcIn)),
                    label: button.label);
              }).toList()),
        ),
      ));

  Future<void> onTap(int value) async {
    await HapticFeedback.selectionClick();
    _pageIndex = value;
    setState(() {});
  }
}

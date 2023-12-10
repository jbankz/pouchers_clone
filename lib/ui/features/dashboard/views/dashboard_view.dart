import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/dashboard/model/bottom_nav.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../modules/transactions/screens/transactions.dart';
import 'account/views/account_view.dart';
import 'card/presentation/view/virtual_card_view.dart';
import 'home/views/home_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key, this.gottenIndex = 0});

  final int gottenIndex;

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.gottenIndex;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
        child: PageTransitionSwitcher(
          child: switch (_pageIndex) {
            0 => const HomeView(),
            1 => const VirtualCardView(),
            2 => const Transactions(),
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
        child: BottomNavigationBar(
            currentIndex: _pageIndex,
            onTap: onTap,
            items: List.generate(bottomNav.length, (index) {
              final button = bottomNav[index];
              return BottomNavigationBarItem(
                  icon: SvgPicture.asset(button.icon,
                      color: _pageIndex == index
                          ? AppColors.kPrimaryColor
                          : AppColors.kSecondaryTextColor),
                  label: button.label);
            }).toList()),
      ));

  void onTap(int value) => setState(() => _pageIndex = value);
}

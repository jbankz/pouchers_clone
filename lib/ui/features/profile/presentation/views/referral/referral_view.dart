import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_strings.dart';
import 'widget/invite_tab_widget.dart';
import 'widget/rewards_tab_widget.dart';

class ReferralView extends StatefulWidget {
  const ReferralView({super.key});

  @override
  State<ReferralView> createState() => _ReferralViewState();
}

class _ReferralViewState extends State<ReferralView> {
  final List<String> _tabs = [AppString.invite, AppString.rewards];
  late String _tab;

  @override
  void initState() {
    super.initState();
    _tab = _tabs.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(AppString.referrals)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            _buildTabWidget(context),
            const Gap(height: 19),
            Expanded(
                child: PageTransitionSwitcher(
                    child: switch (_tab) {
                      'Invite' => const InviteTabWidget(),
                      'Rewards' => const RewardTabWidget(),
                      String() => const Scaffold()
                    },
                    transitionBuilder: (child, primary, secondary) =>
                        SharedAxisTransition(
                            animation: primary,
                            secondaryAnimation: secondary,
                            transitionType: SharedAxisTransitionType.horizontal,
                            child: child)))
          ],
        ),
      ));

  Center _buildTabWidget(BuildContext context) => Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.kPrimaryColor),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _tabs
                .map(
                  (tab) => InkWell(
                    onTap: () => setState(() => _tab = tab),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
                      decoration: BoxDecoration(
                          color:
                              _tab == tab ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Text(tab,
                          style: context.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: _tab == tab ? null : AppColors.white)),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
}

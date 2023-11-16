import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/onboarding/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/widgets/outline_button_widget.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/core/theme/light_theme.dart';
import '../../../../../app/navigators/navigators.dart';
import '../../../../../modules/create_account/screens/create_account.dart';
import '../../../../../modules/login/screens/login.dart';
import '../../../../../modules/onboarding/screens/welcome_guest.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/gap.dart';
import '../notifier/timer_notifier.dart';

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  late TimerNotifier _timerNotifier;

  @override
  void initState() {
    _timerNotifier = ref.read(sliderModel);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _timerNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sliders = ref.watch(slidersProvider);

    return Scaffold(
      body: Column(
        children: [
          Flexible(
              child: Container(
                  color: AppColors.paleLavenderGray,
                  height: 416.h,
                  child: SafeArea(
                    minimum: EdgeInsets.symmetric(horizontal: 14.w),
                    child: PageView.builder(
                        padEnds: false,
                        controller: _timerNotifier.pageController,
                        physics: const ClampingScrollPhysics(),
                        clipBehavior: Clip.none,
                        itemBuilder: (_, index) =>
                            sliders[index % sliders.length]),
                  ))),
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 29.h, 20.w, 56.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppString.paymentHub, style: context.displayLarge),
                const Gap(height: 8),
                Text(AppString.convenience,
                    style: context.displaySmall
                        ?.copyWith(fontWeight: FontWeight.w400)),
                const Gap(height: 63),
                Row(
                  children: [
                    Expanded(
                        child: OutlineButtonWidget(
                            title: AppString.login,
                            onPressed: () => pushTo(
                                context, const LogInAccount(),
                                settings: const RouteSettings(
                                    name: LogInAccount.routeName)))),
                    const Gap(width: 17),
                    Expanded(
                      child: ElevatedButtonWidget(
                          title: AppString.register,
                          onPressed: () => pushTo(
                              context, const CreateAccount(),
                              settings: const RouteSettings(
                                  name: CreateAccount.routeName))),
                    ),
                  ],
                ),
                const Gap(height: 24),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => pushTo(context, WelcomeGuest(),
                      settings:
                          const RouteSettings(name: WelcomeGuest.routeName)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(AppString.guestLogin,
                          style: context.displayMedium
                              ?.copyWith(fontWeight: FontWeight.w500)),
                      const Gap(width: 4),
                      Container(
                        margin: EdgeInsets.only(top: 2.h),
                        child: const Stack(
                          children: [
                            Icon(Icons.arrow_forward_ios,
                                size: 15, color: kPrimaryColor),
                            Positioned(
                              left: 5,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: kPrimaryColor,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

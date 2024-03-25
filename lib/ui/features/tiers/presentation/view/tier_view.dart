import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/tiers/presentation/notifier/tier_notifier.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/core/skeleton/widgets.dart';
import 'widgets/tier_skeleton.dart';
import 'widgets/tier_stat_widget.dart';

class TierView extends ConsumerStatefulWidget {
  const TierView({super.key});

  @override
  ConsumerState<TierView> createState() => _TierViewState();
}

class _TierViewState extends ConsumerState<TierView> {
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => ref
        .read(tierNotifierProvider.notifier)
        .fetchTier(cancelToken: _cancelToken));
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppString.tiers)),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Skeleton(
            isLoading: ref.watch(tierNotifierProvider).isBusy,
            skeleton: const TierSkeleton(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(child: TierStatsWidget()),
                Gap(height: 59.h),
                ElevatedButtonWidget(
                    title: AppString.upgrade,
                    onPressed: () =>
                        PageRouter.pushNamed(Routes.accountVerificationView))
              ],
            ),
          ),
        ),
      );
}

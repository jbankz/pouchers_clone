import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/tiers/presentation/notifier/tier_notifier.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'widgets/tier_stat_widget.dart';

class TierView extends ConsumerStatefulWidget {
  const TierView({super.key});

  @override
  ConsumerState<TierView> createState() => _TierViewState();
}

class _TierViewState extends ConsumerState<TierView> {
  late TierNotifier _tierNotifier;

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        _tierNotifier = ref.read(tierNotifierProvider.notifier)
          ..fetchTier(cancelToken: _cancelToken));
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
      valueListenable: userDao.getListenable(),
      builder: (_, box, __) {
        final user = userDao.returnUser(box);
        return Scaffold(
          appBar: AppBar(title: Text(AppString.tiers)),
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                const Expanded(child: TierStatsWidget()),
                ElevatedButtonWidget(
                    title: AppString.upgrade,
                    onPressed: () =>
                        PageRouter.pushNamed(Routes.accountVerificationView))
              ],
            ),
          ),
        );
      });
}

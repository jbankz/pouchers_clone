import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/app/core/manager/session_manager.dart';
import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../app/core/manager/hive_manager.dart';
import '../../../../../app/core/manager/intercom_manager.dart';
import '../../../admin/presentation/notifier/admin_notifier.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  final SessionManager _sessionManager = locator<SessionManager>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await initializeDB();
        await IntercomManager.initialize();
        await _sessionManager.initializeSession();

        /// Get all Envs {Charges and Fees}
        await ref.read(adminNotifierProvider.notifier).getEnvs();

        PageRouter.pushReplacement(Routes.onboardingView);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: SvgPicture.asset(AppImage.logoLength)));
}

import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/manager/session_manager.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../app/core/manager/hive_manager.dart';
import '../../../../../app/core/manager/intercom_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SessionManager _sessionManager = locator<SessionManager>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await Future.wait([
          initializeDB(),
          IntercomManager.initialize(),
          _sessionManager.initializeSession(),
          Firebase.initializeApp()
        ]);
        PageRouter.pushReplacement(Routes.onboardingView);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: SvgPicture.asset(AppImage.logoLength),
      ));
}

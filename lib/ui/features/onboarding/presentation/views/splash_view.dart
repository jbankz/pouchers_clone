import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:flutter/material.dart';

import '../../../../../app/core/manager/hive_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        await initializeDB();
      } catch (e) {
        print(e);
      }
      PageRouter.pushReplacement(Routes.onboardingView);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(backgroundColor: Colors.red);
}

import 'package:pouchers/app/app.locator.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/session_timeout_listener.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';
import 'app/config/app_config.dart';
import 'app/core/constants/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  AppConfig.setAppEnv(kDebugMode ? AppEnv.production : AppEnv.production);
  await dotenv.load(fileName: AppConfig.fileName);
  await setupLocator();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          child: OverlaySupport.global(
            child: SessionTimeOutListener(
              child: MaterialApp(
                  title: AppConstants.appName,
                  theme: kThemeData,
                  darkTheme: kThemeData,
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.light,
                  navigatorKey: StackedService.navigatorKey,
                  onGenerateRoute: StackedRouter().onGenerateRoute),
            ),
          ),
        ),
      );
}

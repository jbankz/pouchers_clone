import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/helpers/response_handler.dart';
import 'package:Pouchers/routes.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';
import 'app/config/app_config.dart';
import 'app/core/constants/app_constants.dart';
import 'app/core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.setAppEnv(kDebugMode ? AppEnv.production : AppEnv.production);

  await dotenv.load(fileName: AppConfig.fileName);

  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with ResponseHandler {
  @override
  Widget build(BuildContext context) => ProviderScope(
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          child: OverlaySupport.global(
            child: AppTheme(
              child: MaterialApp(
                  title: AppConstants.appName,
                  theme: kThemeData,
                  darkTheme: kThemeData,
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.light,
                  navigatorKey: StackedService.navigatorKey,
                  onGenerateRoute: StackedRouter().onGenerateRoute,
                  // home: Scaffold(
                  //   appBar: AppBar(),
                  //   body: BarChartSample2(),
                  // ),
                  routes: {...appRoutes}),
            ),
          ),
        ),
      );
}

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.i('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "$previousValue",
  "newValue": "$newValue"
}''');
  }
}



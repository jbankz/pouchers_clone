import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/session_manager.dart';
import 'package:pouchers/ui/login/screens/login.dart';
import 'package:pouchers/ui/onboarding/onboarding.dart';
import 'package:pouchers/ui/tab_layout/screens/buy_airtime.dart';
import 'package:pouchers/ui/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:pouchers/utils/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.setEnvironment(EnvState.test);
  Directory directory = await path.getApplicationDocumentsDirectory();
  Hive..init(directory.path);
  const secureStorage = FlutterSecureStorage();
  final eKey = await secureStorage.read(key: kHiveEncryptionKey);
  if (eKey == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: kHiveEncryptionKey,
      value: base64UrlEncode(key),
    );
  }

  final key = await secureStorage.read(key: kHiveEncryptionKey);
  final hiveEncryptionKey = base64Url.decode(key!);
  await Hive.openBox(kTokenBox,
      encryptionCipher: HiveAesCipher(hiveEncryptionKey));

  SessionManager.initSharedPreference().then((value) {
    return SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(new MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      child: MaterialApp(
        title: "Pouchers",
        theme: kThemeData,
        debugShowCheckedModeBanner: false,
        home:
        TabLayout(),
        // OnBoardingPage(),
        routes: {
          LogInAccount.routeName: (BuildContext context) =>
              const LogInAccount(),
          OnBoardingPage.routeName: (BuildContext context) => OnBoardingPage(),
          BuyAirtime.routeName: (BuildContext context) => BuyAirtime()
        },
      ),
    );
  }
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

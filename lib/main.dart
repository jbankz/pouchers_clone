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
import 'package:pouchers/modules/login/models/wallet_details.dart';
import 'package:pouchers/routes.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/onboarding/screens/onboarding.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:pouchers/utils/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.setEnvironment(EnvState.test);
  Directory directory = await path.getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(HiveStoreResponseDataAdapter())
    ..registerAdapter(WalletDetailsAdapter());

  const secureStorage = FlutterSecureStorage();
  try {
    final eKey = await secureStorage.read(key: kHiveEncryptionKey);
    if (eKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: kHiveEncryptionKey,
        value: base64UrlEncode(key),
      );
    }
  } on PlatformException catch (e) {
    await secureStorage.deleteAll();
  }

  final key = await secureStorage.read(key: kHiveEncryptionKey);
  if (key != null) {
    final hiveEncryptionKey = base64Url.decode(key);
    await Hive.openBox(kTokenBox,
        encryptionCipher: HiveAesCipher(hiveEncryptionKey));
  }

  await Hive.openBox(kUserBox);
  await Hive.openBox(k2FACodeBox);
  await Hive.openBox(kBiometricsBox);
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
              // TabLayout(),
              OnBoardingPage(),
          routes: appRoutes),
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

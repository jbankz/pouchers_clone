import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:Pouchers/app/helpers/response_handler.dart';
import 'package:Pouchers/app/helpers/service_constants.dart';
import 'package:Pouchers/app/helpers/session_manager.dart';
import 'package:Pouchers/routes.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/onboarding/screens/onboarding.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/logger.dart';
import 'package:Pouchers/utils/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Intercom.instance.initialize(interComAppId,
      iosApiKey: interComIOSKey, androidApiKey: interComAndroidKey);
  Env.setEnvironment(EnvState.test);
  await Firebase.initializeApp();
  Directory directory = await path.getApplicationDocumentsDirectory();
  // await FlutterDownloader.initialize(
  //     debug: true, // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl: true // option: set to false to disable working with http links (default: false)
  // );
  Hive
    ..init(directory.path)
    ..registerAdapter(HiveStoreResponseDataAdapter());

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with ResponseHandler {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      child: OverlaySupport.global(
        child: MaterialApp(
            title: "Pouchers",
            theme: kThemeData,
            debugShowCheckedModeBanner: false,
            home: OnBoardingPage(),
            routes: appRoutes),
      ),
    );
    //  );
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

// iOS API Key
// ios_sdk-a1b43e5e09d3ef333aaec60a4ae3cfa79f477358
//
// Android API Key
// android_sdk-543ba1f4cb81b13247aea6879c923fa666d9d79a

// Your app ID
// ors25jkb

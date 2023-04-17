import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:pouchers/app/helpers/network_helpers.dart';
import 'package:pouchers/app/helpers/response_handler.dart';
import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/session_manager.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/login/screens/login.dart';
import 'package:pouchers/routes.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/onboarding/screens/onboarding.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:pouchers/utils/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.setEnvironment(EnvState.production);
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
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      child:
      //Listener(
        // onPointerDown: (e) {
        //   DateTime whenTouchedDatetime = DateTime.now();
        //   print("now date $nowDate");
        //   print("whenTouchedDatetime $whenTouchedDatetime");
        //   if (nowDate.isBefore(whenTouchedDatetime)) {
        //     print("it is after");
        //     // if(_navigatorKey.currentState != null){
        //       _navigatorKey.currentState!.pushAndRemoveUntil(
        //           MaterialPageRoute(builder: (_) {
        //             return LogInAccount(
        //                 sessionTimeOut: true
        //             );
        //           }), (route) => false);
        //    //}
        //     // else{
        //     //   print("kmkmd");
        //     //   pushToAndClearStack(context, LogInAccount(
        //     //       sessionTimeOut: true
        //     //   ));
        //     // }
        //
        //     setState(() {
        //       nowDate = DateTime.now().add(Duration(minutes: 5));
        //     });
        //   } else {
        //     nowDate = DateTime.now().add(Duration(minutes: 5));
        //   }
        // },
       // child:
        MaterialApp(
            title: "Pouchers",
            theme: kThemeData,
            debugShowCheckedModeBanner: false,
            home:
                Navigator(
              key: _navigatorKey,
              onGenerateRoute: (settings) {
                return MaterialPageRoute(builder: (context) {
                  return OnBoardingPage();
                });
              },
            ),
            routes: appRoutes),
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

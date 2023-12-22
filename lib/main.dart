import 'dart:convert';
import 'dart:io';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/helpers/response_handler.dart';
import 'package:Pouchers/app/helpers/session_manager.dart';
import 'package:Pouchers/routes.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/logger.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';
import 'app/config/app_config.dart';
import 'app/core/constants/app_constants.dart';
import 'app/core/manager/session_manager.dart' as core;
import 'app/core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.setAppEnv(kDebugMode ? AppEnv.staging : AppEnv.production);

  await dotenv.load(fileName: AppConfig.fileName);

  await setupLocator();
  await locator<core.SessionManager>().initializeSession();

  await Intercom.instance.initialize(interComAppId,
      iosApiKey: interComIOSKey, androidApiKey: interComAndroidKey);
  // Env.setEnvironment(EnvState.production);

  // if (Env.getEnvironment() == EnvState.production) {
  //   await dotenv.load(fileName: ".env.production");
  // } else {
  //   await dotenv.load(fileName: ".env.staging");
  // }

  await Firebase.initializeApp();
  Directory directory = await path.getApplicationDocumentsDirectory();
  // await FlutterDownloader.initialize(
  //     debug: true, // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl: true // option: set to false to disable working with http links (default: false)
  // );
  // Hive
  //   ..init(directory.path)
  //   ..registerAdapter(HiveStoreResponseDataAdapter());

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
    // await Hive.openBox(kTokenBox,
    //     encryptionCipher: HiveAesCipher(hiveEncryptionKey));
  }

  // await Hive.openBox(kUserBox);
  // await Hive.openBox(k2FACodeBox);
  // await Hive.openBox(kBiometricsBox);
  SessionManager.initSharedPreference().then((value) =>
      SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
          .then((_) {
        runApp(const MyApp());
      }));
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

// iOS API Key
// ios_sdk-a1b43e5e09d3ef333aaec60a4ae3cfa79f477358
//
// Android API Key
// android_sdk-543ba1f4cb81b13247aea6879c923fa666d9d79a

// Your app ID
// ors25jkb

//Liveness check voters card
// dojah response: [
// I/flutter (11047):   {
// I/flutter (11047):     "data": {
// I/flutter (11047):       "index": {
// I/flutter (11047):         "data": {},
// I/flutter (11047):         "status": true,
// I/flutter (11047):         "message": "Successfully continued to the main checks."
// I/flutter (11047):       },index close
// I/flutter (11047):       "id-options": {
// I/flutter (11047):         "data": {
// I/flutter (11047):           "type": "NG-VCARD"
// I/flutter (11047):         }, data id close
// I/flutter (11047):         "message": "Successully picked a type",
// I/flutter (11047):         "status": true
// I/flutter (11047):       }, id options close
// I/flutter (11047):       "id": {
// I/flutter (11047):         "data": {
// I/flutter (11047):           "idUrl": "https://dojah-images.s3.amazonaws.com/645111dc972663003ffbf78590F5AUF50F3501835000.jpeg",
// I/flutter (11047):           "idData": {
// I/flutter (11047):             "first_name": "SOTONWA",
// I/flutter (11047):             "last_name": " OLUWAFEMI TOLUWA",
// I/flutter (11047):             "middle_name": "",
// I/flutter (11047):             "nationality": null,
// I/flutter (11047):             "mrz_status": "True",
// I/flutter (11047):             "mrz_1": null,
// I/flutter (11047):             "mrz_2": "",
// I/flutter (11047):             "expiry_date": null,
// I/flutter (11047):             "document_type": "Nigeria - Voter Card #2",
// I/flutter (11047):             "document_number": "90F5AUF50F3501835000",
// I/flutter (11047):             "date_of_birth": "1997-05-15",
// I/flutter (11047):             "date_issued": null,
// I/flutter (11047):             "extras": ""
// I/flutter (11047):           }
// I/flutter (11047):         },
// I/flutter (11047):         "status": true,
// I/flutter (11047):         "message": "Successfully validated your liveness"
// I/flutter (11047):       },
// I/flutter (11047):       "selfie": {
// I/flutter (11047):         "data": {}
// I/flutter (11047):       }
// I/flutter (11047):     },
// I/flutter (11047):     "idUrl": "https://dojah-images.s3.amazonaws.com/645111dc972663003ffbf78590F5AUF50F3501835000.jpeg",
// I/flutter (11047):     "idData": {
// I/flutter (11047):       "first_name": "SOTONWA",
// I/flutter (11047):       "last_name": " OLUWAFEMI TOLUWA",
// I/flutter (11047):       "middle_name": "",
// I/flutter (11047):       "nationality": null,
// I/flutter (11047):       "mrz_status": "True",
// I/flutter (11047):       "mrz_1": null,
// I/flutter (11047):       "mrz_2": "",
// I/flutter (11047):       "expiry_date": null,
// I/flutter (11047):       "document_type": "Nigeria - Voter Card #2",
// I/flutter (11047):       "document_number": "90F5AUF50F3501835000",
// I/flutter (11047):       "date_of_birth": "1997-05-15",
// I/flutter (11047):       "date_issued": null,
// I/flutter (11047):       "extras": ""
// I/flutter (11047):     },
// I/flutter (11047):     "verificationId": 66974,
// I/flutter (11047):     "verificationUrl": "https://app.dojah.io/verifications/bio-data/DJ-422B5D1346",
// I/flutter (11047):     "referenceId": "DJ-422B5D1346",
// I/flutter (11047):     "status": true,
// I/flutter (11047):     "message": "Successfully completed the verification.",
// I/flutter (11047):     "metadata": {
// I/flutter (11047):       "deviceInfo": "Mozilla/5.0 (Linux; Android 12; SM-A217F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/112.0.5615.135 Mobile Safari/537.36",
// I/flutter (11047):       "ipInfo": {
// I/flutter (11047):         "status": "success",
// I/flutter (11047):         "country": "Nigeria",
// I/flutter (11047):         "countryCode": "NG",
// I/flutter (11047):         "regionName": "Lagos",
// I/flutter (11047):         "city": "Onipanu",
// I/flutter (11047):         "district": "",
// I/flutter (11047):         "zip": "",
// I/flutter (11047):         "lat": 6.5464,
// I/flutter (11047):         "lon": 3.3721,
// I/flutter (11047):         "timezone": "Africa/Lagos",
// I/flutter (11047):         "isp": "eStream Networks",
// I/flutter (11047):         "org": "Enyata",
// I/flutter (11047):         "as": "AS37629 eStream Networks",
// I/flutter (11047):         "asname": "eStreamNetworks-AS",
// I/flutter (11047):         "mobile": false,
// I/flutter (11047):         "proxy": false,
// I/flutter (11047):         "hosting": false,
// I/flutter (11047):         "query": "196.1.187.142"
// I/flutter (11047):       }
// I/flutter (11047):     }
// I/flutter (11047):   }
// I/flutter (11047): ]

// driving license
// dojah response: [
// I/flutter (11047):   {
// I/flutter (11047):     "data": {
// I/flutter (11047):       "index": {
// I/flutter (11047):         "data": {},
// I/flutter (11047):         "status": true,
// I/flutter (11047):         "message": "Successfully continued to the main checks."
// I/flutter (11047):       },
// I/flutter (11047):       "id-options": {
// I/flutter (11047):         "data": {
// I/flutter (11047):           "type": "DL_ID"
// I/flutter (11047):         },
// I/flutter (11047):         "message": "Successully picked a type",
// I/flutter (11047):         "status": true
// I/flutter (11047):       },
// I/flutter (11047):       "id": {
// I/flutter (11047):         "data": {
// I/flutter (11047):           "idUrl": "https://dojah-images.s3.amazonaws.com/6451165d3bc78e00401c1e08LSR78347AA20.jpeg",
// I/flutter (11047):           "idData": {
// I/flutter (11047):             "first_name": "UMEMBA",
// I/flutter (11047):             "last_name": "UZOMA EBER",
// I/flutter (11047):             "middle_name": "",
// I/flutter (11047):             "nationality": null,
// I/flutter (11047):             "mrz_status": "True",
// I/flutter (11047):             "mrz_1": null,
// I/flutter (11047):             "mrz_2": "",
// I/flutter (11047):             "expiry_date": "2023-05-11",
// I/flutter (11047):             "document_type": "Nigeria - Driving License (2011)",
// I/flutter (11047):             "document_number": "LSR78347AA20",
// I/flutter (11047):             "date_of_birth": null,
// I/flutter (11047):             "date_issued": null,
// I/flutter (11047):             "extras": ""
// I/flutter (11047):           }
// I/flutter (11047):         },
// I/flutter (11047):         "status": true,
// I/flutter (11047):         "message": "Successfully validated your liveness"
// I/flutter (11047):       },
// I/flutter (11047):       "selfie": {
// I/flutter (11047):         "data": {}
// I/flutter (11047):       }
// I/flutter (11047):     },
// I/flutter (11047):     "idUrl": "https://dojah-images.s3.amazonaws.com/6451165d3bc78e00401c1e08LSR78347AA20.jpeg",
// I/flutter (11047):     "idData": {
// I/flutter (11047):       "first_name": "UMEMBA",
// I/flutter (11047):       "last_name": "UZOMA EBER",
// I/flutter (11047):       "middle_name": "",
// I/flutter (11047):       "nationality": null,
// I/flutter (11047):       "mrz_status": "True",
// I/flutter (11047):       "mrz_1": null,
// I/flutter (11047):       "mrz_2": "",
// I/flutter (11047):       "expiry_date": "2023-05-11",
// I/flutter (11047):       "document_type": "Nigeria - Driving License (2011)",
// I/flutter (11047):       "document_number": "LSR78347AA20",
// I/flutter (11047):       "date_of_birth": null,
// I/flutter (11047):       "date_issued": null,
// I/flutter (11047):       "extras": ""
// I/flutter (11047):     },
// I/flutter (11047):     "verificationId": 66979,
// I/flutter (11047):     "verificationUrl": "https://app.dojah.io/verifications/bio-data/DJ-C1C77F5626",
// I/flutter (11047):     "referenceId": "DJ-C1C77F5626",
// I/flutter (11047):     "status": true,
// I/flutter (11047):     "message": "Successfully completed the verification.",
// I/flutter (11047):     "metadata": {
// I/flutter (11047):       "deviceInfo": "Mozilla/5.0 (Linux; Android 12; SM-A217F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/112.0.5615.135 Mobile Safari/537.36",
// I/flutter (11047):       "ipInfo": {
// I/flutter (11047):         "status": "success",
// I/flutter (11047):         "country": "Nigeria",
// I/flutter (11047):         "countryCode": "NG",
// I/flutter (11047):         "regionName": "Lagos",
// I/flutter (11047):         "city": "Onipanu",
// I/flutter (11047):         "district": "",
// I/flutter (11047):         "zip": "",
// I/flutter (11047):         "lat": 6.5464,
// I/flutter (11047):         "lon": 3.3721,
// I/flutter (11047):         "timezone": "Africa/Lagos",
// I/flutter (11047):         "isp": "eStream Networks",
// I/flutter (11047):         "org": "Enyata",
// I/flutter (11047):         "as": "AS37629 eStream Networks",
// I/flutter (11047):         "asname": "eStreamNetworks-AS",
// I/flutter (11047):         "mobile": false,
// I/flutter (11047):         "proxy": false,
// I/flutter (11047):         "hosting": false,
// I/flutter (11047):         "query": "196.1.187.142"
// I/flutter (11047):       }
// I/flutter (11047):     }
// I/flutter (11047):   }
// I/flutter (11047): ]


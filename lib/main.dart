import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:pouchers/app/helpers/service_constants.dart';
import 'package:pouchers/app/helpers/session_manager.dart';
import 'package:pouchers/ui/onboarding/onboarding.dart';
import 'package:pouchers/utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.setEnvironment(EnvState.test);
  Directory directory = await path.getApplicationDocumentsDirectory();

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
    return MaterialApp(
      title: "Pouchers",
      theme: kThemeData,
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}

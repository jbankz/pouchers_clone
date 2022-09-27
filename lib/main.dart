import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/helpers/session_manager.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter_boilerplate/app/helpers/service_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.setEnvironment(EnvState.test);
  Directory directory = await path.getApplicationDocumentsDirectory();

  SessionManager.initSharedPreference().then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kappa",
      theme: kThemeData,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Boilerplate Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

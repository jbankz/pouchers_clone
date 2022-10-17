import 'package:flutter/material.dart';

Future<T?> pushTo<T>(
  BuildContext context,
  Widget page, {
  RouteSettings? settings,
}) async {
  return await Navigator.push<T>(
    context,
    MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
    ),
  );
}

Future<T> pushReplacementTo<T>(
  BuildContext context,
  Widget page,
) async {
  return await Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}


Future<T?> pushToAndClearUntil<T>(BuildContext context, Widget page,
    {required String routeName, RouteSettings? settings}) =>

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page, settings: settings),
          (route) => route.settings.name == routeName,
    );

Future<T?> pushToAndClearStack<T>(BuildContext context, Widget page) {
  return Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}

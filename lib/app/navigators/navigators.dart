import 'package:flutter/material.dart';

@Deprecated(
    '[pushTo] is depricated and will soon be removed. Make us of [PageRouter.pushName] instead')
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

@Deprecated(
    '[pushNamedTo] is depricated and will soon be removed. Make us of [PageRouter.pushName] instead')
Future<T?> pushNamedTo<T>(
  BuildContext context,
  String routeName, {
  RouteSettings? settings,
  dynamic args,
}) async {
  return await Navigator.pushNamed(context, routeName, arguments: args);
}

@Deprecated(
    '[pushReplacementTo] is depricated and will soon be removed. Make us of [PageRouter.pushName] instead')
Future<T> pushReplacementTo<T>(
  BuildContext context,
  Widget page,
) async {
  return await Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

@Deprecated(
    '[pushToAndClearUntil] is depricated and will soon be removed. Make us of [PageRouter.pushName] instead')
Future<T?> pushToAndClearUntil<T>(BuildContext context, Widget page,
        {required String routeName, RouteSettings? settings}) =>
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page, settings: settings),
      (route) => route.settings.name == routeName,
    );

@Deprecated(
    '[pushToAndClearStack] is depricated and will soon be removed. Make us of [PageRouter.pushName] instead')
Future<T?> pushToAndClearStack<T>(BuildContext context, Widget page) {
  return Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}

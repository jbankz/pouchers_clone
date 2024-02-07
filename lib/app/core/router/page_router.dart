import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.locator.dart';

class PageRouter {
  static final _navigatorKey = StackedService.navigatorKey!.currentContext!;

  static BuildContext get globalContext => _navigatorKey;

  static final _navigation = locator<NavigationService>();
  static NavigationService get navigation => _navigation;

  static Future<dynamic> pushNamed(String routeName, {dynamic args}) async =>
      await _navigation.navigateTo(routeName, arguments: args);

  static Future<void> pushWidget(Widget view, {dynamic args}) async =>
      await _navigation.navigateToView(view);

  static bool get canPop => Navigator.canPop(globalContext);

  static bool pop([dynamic result]) => _navigation.back(result: result);

  static void popToRoot([String routeName = '']) =>
      _navigation.popUntil((route) => route.settings.name == routeName);

  static Future<void> pushReplacement(String routeName, {dynamic args}) async =>
      await _navigation.clearStackAndShow(routeName, arguments: args);

  static Future<void> pushReplacementWidget(Widget view,
          {dynamic args}) async =>
      await _navigation.clearStackAndShowView(view, arguments: args);

  static Future<void> pushReplacementWithAnimation(Widget child,
          {dynamic args,
          bool? opaque,
          Transition? transition,
          bool? popGesture}) async =>
      await _navigation.replaceWithTransition(child,
          opaque: opaque, transitionStyle: transition, popGesture: popGesture);

  static Future<dynamic> pushWithAnimation(Widget child,
          {dynamic args, Transition? transition, bool? popGesture}) async =>
      await _navigation.navigateToView(child,
          curve: Curves.easeIn,
          transitionStyle: transition,
          popGesture: popGesture);
}

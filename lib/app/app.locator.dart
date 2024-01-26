// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import 'core/manager/biometric_manager.dart';
import 'core/manager/dojah_manager.dart';
import 'core/manager/hive_manager.dart';
import 'core/manager/image_manager.dart';
import 'core/manager/secure_manager.dart';
import 'core/manager/session_manager.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator
    ..registerEnvironment(
        environment: environment, environmentFilter: environmentFilter)

// Register dependencies
    ..registerLazySingleton(() => NavigationService())
    ..registerLazySingleton(() => DialogService())
    ..registerLazySingleton(() => SnackbarService())
    ..registerLazySingleton(() => SessionManager())
    ..registerLazySingleton(() => BiometricManager())
    ..registerLazySingleton(() => const FlutterSecureStorage())
    ..registerLazySingleton(() => SecuredManager())
    ..registerLazySingleton(() => HiveManager())
    ..registerLazySingleton(() => DojahManager())
    ..registerLazySingleton(() => ImageManager());
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../ui/common/app_strings.dart';
import '../core/constants/app_constants.dart';

// Enum to represent different app environments
enum AppEnv { staging, production }

class AppConfig {
  static final String _notFound = AppString.notFound;

  // Store the current app environment
  static late AppEnv _appEnv;

  // Method to set the app environment
  static void setAppEnv(AppEnv env) => _appEnv = env;

  // Check if the app is running in the production environment
  static bool get _isProduction => _appEnv == AppEnv.production;

  // Determine the appropriate environment file name based on the environment
  static String get fileName =>
      _isProduction ? AppConstants.liveEnv : AppConstants.stagingEnv;

  // Retrieve the API URL from environment variables, with a default value if $_notFound
  static String get apiUrl =>
      dotenv.env[AppConstants.apiUrl] ?? '${AppConstants.apiUrl} $_notFound';

  // Retrieve the Terms of Use URL from environment variables, with a default value if $_notFound
  static String get termsOfUse =>
      dotenv.env[AppConstants.termsOfUse] ??
      '${AppConstants.termsOfUse} $_notFound';

  // Retrieve the Privacy policy URL from environment variables, with a default value if $_notFound
  static String get privacyPolicy =>
      dotenv.env[AppConstants.privacyPolicy] ??
      '${AppConstants.privacyPolicy} $_notFound';
}

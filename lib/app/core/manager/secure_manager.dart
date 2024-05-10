import 'package:pouchers/app/app.locator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredManager {
  final FlutterSecureStorage _storage = locator<FlutterSecureStorage>();

  final String _emailKey = 'email';
  final String _passwordKey = 'password';
  final String _pinKey = 'pin';

  Future<void> storeEmailCred(String value) async =>
      await _storage.write(key: _emailKey, value: value);

  Future<String> readEmailCred() async =>
      await _storage.read(key: _emailKey) ?? '';

  Future<String> readPasswordCred() async =>
      await _storage.read(key: _passwordKey) ?? '';

  Future<void> storePasswordCred(String value) async =>
      await _storage.write(key: _passwordKey, value: value);

  Future<String> readPinCred() async => await _storage.read(key: _pinKey) ?? '';

  Future<void> storePinCred(String value) async =>
      await _storage.write(key: _pinKey, value: value);

  Future<void> clearAllSecurities() async => await _storage.deleteAll();
}

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pouchers/app/common/model.dart';
import 'package:pouchers/utils/strings.dart';


final _secureStorage = FlutterSecureStorage();

Future<UserCredentials?> getUserCredentials() async {
  try {
    final serializedData = await _secureStorage.read(key: userCredentialKey);

    if (serializedData != null) {
      return UserCredentials.deserialize(serializedData);
    } else {
      return null;
    }
  } catch (e) {
    throw "Error getting user data.";
  }
}

Future<void> saveUserCredential({
  String? password,
  String? transactionPin,
}) async {
  try {
    final existingCredentials = await getUserCredentials();

    if (existingCredentials == null) {
      final credentials =
          UserCredentials(password: password, transactionPin: transactionPin);
      await _secureStorage.write(
          key: userCredentialKey, value: credentials.serialize());
    } else {
      await _secureStorage.write(
          key: userCredentialKey,
          value: existingCredentials
              .copyWith(password: password, transactionPin: transactionPin)
              .serialize());
    }
  } catch (e) {
    throw "An error occurred";
  }
}



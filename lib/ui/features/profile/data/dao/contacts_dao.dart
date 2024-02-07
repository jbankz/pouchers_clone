import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';

late ContactDao contactDao;
final _hiveManager = locator<HiveManager>();

class ContactDao {
  late Box _box;

  Box get box => _box;

  ContactDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.contactsDaoKey);

  Future<void> save(List<User> contacts) async {
    if (contacts.isEmpty) return;

    for (User contact in contacts) {
      await _box.put(contact.id, contact);
    }
  }

  List<User> retrieve(Box box) => box.values.cast<User>().toList();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}

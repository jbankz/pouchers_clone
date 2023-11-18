import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';

import '../../../modules/login/models/login_response.dart';
import '../../../ui/features/profile/data/dao/user_dao.dart';
import '../../../ui/features/profile/data/dao/wallet_dao.dart';
import '../../../ui/features/profile/domain/model/user.dart';
import '../../../ui/features/profile/domain/model/wallet.dart';
import '../../app.locator.dart';

/// initialize local data storage
Future<void> initializeDB() async {
  await Hive.initFlutter();

  await locator<HiveManager>().openAllBox();

  Hive
    ..registerAdapter(UserAdapter())
    // ..registerAdapter(WalletAdapter())
    ..registerAdapter(HiveStoreResponseDataAdapter());
}

class HiveManager {
  Future openAllBox() async {
    userDao = UserDao();
    walletDao = WalletDao();
  }

  Future clearAllBox() async {
    await userDao.truncate();
    // await walletDao.truncate();
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    Box<T> box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<T>(boxName);
    } else {
      try {
        box = await Hive.openBox<T>(boxName);
      } catch (_) {
        await Hive.deleteBoxFromDisk(boxName);
        box = await Hive.openBox<T>(boxName);
      }
    }
    return box;
  }

  Future<void> clearData() async {
    await _clearBox<Map<String, dynamic>>('');
  }

  Future<void> _clearBox<T>(String name) async {
    try {
      final Box<T> box = await openBox<T>(name);
      await box.clear();
    } catch (_) {
      debugPrint('clear $name error: ${_.toString()}');
    }
  }
}

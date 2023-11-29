import 'package:Pouchers/ui/features/dashboard/views/card/data/dao/card_dao.dart';
import 'package:Pouchers/ui/features/profile/domain/model/referral/earning.dart';
import 'package:Pouchers/ui/features/profile/domain/model/referral/referral.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../modules/login/models/login_response.dart';
import '../../../ui/features/profile/data/dao/referral_dao.dart';
import '../../../ui/features/profile/data/dao/user_dao.dart';
import '../../../ui/features/profile/data/dao/wallet_dao.dart';
import '../../../ui/features/profile/domain/model/referral/referral_trail.dart';
import '../../../ui/features/profile/domain/model/user.dart';
import '../../../ui/features/profile/domain/model/wallet.dart';
import '../../app.locator.dart';

/// initialize local data storage
Future<void> initializeDB() async {
  try {
    await Hive.initFlutter();

    await locator<HiveManager>().openAllBox();

    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(ReferralAdapter())
      ..registerAdapter(EarningAdapter())
      ..registerAdapter(ReferralTrailAdapter())
      ..registerAdapter(WalletAdapter())
      ..registerAdapter(HiveStoreResponseDataAdapter());
  } catch (e) {
    debugPrint(e.toString());
  }
}

class HiveManager {
  Future openAllBox() async {
    userDao = UserDao();
    walletDao = WalletDao();
    cardsDao = CardsDao();
    referralDao = ReferralDao();
  }

  Future clearAllBox() async {
    await userDao.truncate();
    await walletDao.truncate();
    await cardsDao.truncate();
    await referralDao.truncate();
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

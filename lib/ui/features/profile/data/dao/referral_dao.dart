import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/profile/domain/model/referral/referral.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';

late ReferralDao referralDao;
final _hiveManager = locator<HiveManager>();

class ReferralDao {
  late Box _box;

  Box get box => _box;

  ReferralDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.referralDaoKey);

  Future<void> save(Referral? referral) async =>
      await _box.put(AppKeys.referralDaoKey, referral);

  Referral returnReferral(Box box) =>
      box.get(AppKeys.referralDaoKey, defaultValue: Referral());

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}

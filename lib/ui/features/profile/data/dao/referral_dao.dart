import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:Pouchers/ui/features/profile/domain/model/referral/referral.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:Pouchers/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';

late ReferralDao referralDao;
final _hiveManager = locator<HiveManager>();

class ReferralDao {
  late Box<Map> _box;

  Box<Map> get box => _box;

  ReferralDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box<Map>> openBox() =>
      _hiveManager.openBox<Map>(AppKeys.referralDaoKey);

  Future<void> save(Referral? referral) async {
    await _box.put(AppKeys.referralDaoKey, referral?.toJson() ?? {});
  }

  Referral returnReferral(Box box) =>
      Referral.fromJson(box.toMap()[AppKeys.referralDaoKey] ?? {});

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}

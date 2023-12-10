import 'dart:async';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';
import '../../domain/model/banner.dart';

late BannerDao bannerDao;
final _hiveManager = locator<HiveManager>();

class BannerDao {
  late Box _box;

  Box get box => _box;

  BannerDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.bannerDaoKey);

  Future<void> save(List<Banner> banners) async {
    if (banners.isEmpty) return;

    for (var banner in banners) {
      await _box.put(banner.id, banner);
    }
  }

  List<Banner> retrieve(Box box) => box.values.cast<Banner>().toList();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}

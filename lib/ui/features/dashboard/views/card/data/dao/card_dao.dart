import 'dart:async';
import 'dart:convert';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/config/app_logger.dart';
import 'package:Pouchers/ui/common/app_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../../app/core/manager/hive_manager.dart';
import '../../domain/model/cards/cards.dart';

late CardsDao cardsDao;
final _hiveManager = locator<HiveManager>();

class CardsDao {
  late Box _box;

  Box? get box => _box;

  CardsDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox(AppKeys.cardsDaoKey);

  List<Cards> get cards => fetchCards(_box);

  Future<void> saveCards(List<Cards> cards) async {
    try {
      if (cards.isEmpty) return;

      for (Cards card in cards) {
        await _box.put(card.cardId, card);
      }
    } catch (e) {
      getLogger('className').e(e);
    }
  }

  Future<void> clear() async => await _box.clear();

  List<Cards> fetchCards(Box box) => Map<String, dynamic>.from(box.toMap())
      .values
      .map((e) => Cards.fromJson(json.decode(json.encode(e))))
      .toList();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}

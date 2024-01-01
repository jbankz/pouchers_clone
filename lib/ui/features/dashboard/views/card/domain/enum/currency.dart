// ignore_for_file: constant_identifier_names

import 'package:hive/hive.dart';

part 'currency.g.dart';

@HiveType(typeId: 19, adapterName: 'CurrencyAdapter')
enum Currency {
  @HiveField(0)
  NGN,
  @HiveField(1)
  USD
}

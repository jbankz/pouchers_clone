// ignore_for_file: constant_identifier_names

import 'package:hive/hive.dart';

import '../../../../../../../app/core/constants/db_constants.dart';

part 'currency.g.dart';

@HiveType(typeId: DbConstants.nineteen)
enum Currency {
  @HiveField(0)
  NGN,
  @HiveField(1)
  USD
}

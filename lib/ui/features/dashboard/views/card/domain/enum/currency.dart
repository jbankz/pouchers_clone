import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../../../app/core/constants/db_constants.dart';

part 'currency.g.dart';

@HiveType(typeId: DbConstants.nineteen)
@JsonEnum(valueField: 'value')
enum Currency {
  @HiveField(0)
  ngn('NGN'),
  @HiveField(1)
  usd('USD');

  final String value;

  const Currency(this.value);
}

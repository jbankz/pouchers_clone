import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../app/core/constants/db_constants.dart';

part 'card_brand.g.dart';

@HiveType(typeId: DbConstants.twentyEight)
@JsonEnum(valueField: 'value', fieldRename: FieldRename.kebab)
enum CardBrand {
  @HiveField(0)
  verve('Verve'),
  @HiveField(1)
  visa('Visa'),
  @HiveField(2)
  masterCard('MasterCard');

  final String value;

  const CardBrand(this.value);
}

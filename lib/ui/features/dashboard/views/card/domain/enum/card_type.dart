import 'package:hive/hive.dart';

import '../../../../../../../app/core/constants/db_constants.dart';

part 'card_type.g.dart';

@HiveType(typeId: DbConstants.twentyNine)
enum CardType {
  @HiveField(0)
  naira,
  @HiveField(1)
  dollar
}

import 'package:hive/hive.dart';

import '../../../../../../../app/core/constants/db_constants.dart';

part 'transaction_type.g.dart';

@HiveType(typeId: DbConstants.twenty)
enum TransactionType {
  @HiveField(0)
  debit,
  @HiveField(1)
  credit
}

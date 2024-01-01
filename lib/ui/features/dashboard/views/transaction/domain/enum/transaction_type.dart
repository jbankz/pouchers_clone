import 'package:hive/hive.dart';

part 'transaction_type.g.dart';

@HiveType(typeId: 20, adapterName: 'TransactionTypeAdapter')
enum TransactionType {
  @HiveField(0)
  debit,
  @HiveField(1)
  credit
}

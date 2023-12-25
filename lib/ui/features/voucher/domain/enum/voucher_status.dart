import 'package:hive/hive.dart';

part 'voucher_status.g.dart';

@HiveType(typeId: 16, adapterName: 'VoucherStatusAdapter')
enum VoucherStatus {
  @HiveField(0)
  inactive('inactive'),
  @HiveField(1)
  active('active'),
  @HiveField(2)
  allType('All type'),
  @HiveField(3)
  redeemed('redeemed'),
  @HiveField(4)
  gifted('gifted');

  final String value;

  const VoucherStatus(this.value);
}

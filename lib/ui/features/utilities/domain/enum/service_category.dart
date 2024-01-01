import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'service_category.g.dart';

@JsonEnum(valueField: 'value', fieldRename: FieldRename.kebab)
@HiveType(typeId: 21, adapterName: 'ServiceCategoryAdapter')
enum ServiceCategory {
  @HiveField(0)
  @HiveField(1)
  airtime('airtime-purchase'),
  @HiveField(2)
  data('data-purchase'),
  @HiveField(3)
  cable('cable-purchase'),
  @HiveField(4)
  electricity('electricity-purchase'),
  @HiveField(5)
  betting('betting-purchase'),
  @HiveField(6)
  voucherPurchase('voucher-purchase'),
  @HiveField(7)
  education('education-purchase'),
  @HiveField(8)
  internet('internet-purchase'),
  @HiveField(9)
  p2p('p2p-transfer'),
  @HiveField(10)
  voucherRedeem('voucher-redeem'),
  @HiveField(11)
  fundWallet('fund-wallet'),
  @HiveField(12)
  createVirtualCard('create-virtual-card'),
  @HiveField(13)
  fundVirtualCard('fund-virtual-card'),
  @HiveField(14)
  localBankTransfer('local-bank-transfer'),
  @HiveField(15)
  adminDebitWallet('admin-debit-wallet'),
  @HiveField(16)
  adminCreditWallet('admin-credit-wallet'),
  @HiveField(17)
  referralBonusPayment('referral-bonus-payment');

  const ServiceCategory(this.value);

  final String value;
}

import '../../../../../utilities/domain/enum/service_category.dart';

class TransactionFilter {
  final String key;
  final String? value;

  TransactionFilter({required this.key, required this.value});
}

List<TransactionFilter> filters = [
  TransactionFilter(key: 'All', value: null),
  TransactionFilter(key: 'Airtime', value: 'airtime'),
  TransactionFilter(key: 'Data', value: 'data'),
  TransactionFilter(key: 'Internet', value: 'internet'),
  TransactionFilter(key: 'Cable TV', value: 'cable'),
  TransactionFilter(key: 'Electricity', value: 'electricity'),
  TransactionFilter(key: 'Betting', value: 'betting'),
  TransactionFilter(key: 'Voucher', value: 'voucher'),
  TransactionFilter(key: 'Transfer', value: 'transfer'),
  TransactionFilter(key: 'Education', value: 'education'),
  TransactionFilter(key: 'Create Card', value: 'create_card'),
  TransactionFilter(key: 'Fund Card', value: 'fund_card'),
  TransactionFilter(
      key: 'Admin Credit Wallet',
      value: ServiceCategory.adminCreditWallet.value),
  TransactionFilter(
      key: 'Admin Debit Wallet', value: ServiceCategory.adminDebitWallet.value)
];

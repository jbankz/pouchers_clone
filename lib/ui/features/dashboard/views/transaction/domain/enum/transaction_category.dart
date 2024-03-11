enum TransactionCategory {
  airtime('airtime-purchase'),
  data('data-purchase'),
  cable('cable-purchase'),
  electricity('electricity-purchase'),
  betting('betting-purchase'),
  voucher('voucher-purchase'),
  education('education-purchase'),
  internet('internet-purchase'),
  transfer('p2p-transfer');

  const TransactionCategory(this.value);

  final String value;
}

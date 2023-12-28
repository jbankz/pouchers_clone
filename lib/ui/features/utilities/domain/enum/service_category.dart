enum ServiceCategory {
  airtime('airtime-purchase'),
  data('data-purchase'),
  cable('cable-purchase'),
  electricity('electricity-purchase'),
  betting('betting-purchase'),
  voucher('voucher-purchase'),
  education('education-purchase'),
  internet('internet-purchase'),
  p2p('p2p-transfer');

  const ServiceCategory(this.value);

  final String value;
}

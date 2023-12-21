enum ServiceCategory {
  airtime('airtime-purchase'),
  data('data-purchase'),
  cable('cable-purchase'),
  electricity('electricity-purchase');

  const ServiceCategory(this.value);
  final String value;
}

enum ServiceCategory {
  airtime('airtime-purchase'),
  data('data-purchase'),
  cable('cable-purchase');

  const ServiceCategory(this.value);
  final String value;
}

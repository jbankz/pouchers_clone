class TopDeals {
  final String? name;
  final num? mobileOperatorId;
  final String? code;
  final num price;
  final String? shortCode;
  final String? dataValue;
  final String? validityPeriod;
  final String? serviceName;
  final num? serviceId;

  TopDeals(
      {this.name,
      this.code,
      this.price = 0,
      this.shortCode,
      this.dataValue,
      this.validityPeriod,
      this.mobileOperatorId,
      this.serviceId,
      this.serviceName});
}

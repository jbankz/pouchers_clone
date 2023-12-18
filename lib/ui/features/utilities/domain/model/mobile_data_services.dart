import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile_data_services.freezed.dart';
part 'mobile_data_services.g.dart';

@freezed
class MobileOperatorServices with _$MobileOperatorServices {
  factory MobileOperatorServices(
      {@Default(0) num mobileOperatorId,
      @Default(0) num servicePrice,
      String? validityPeriod,
      String? dataValue,
      String? serviceName,
      @Default(0) num serviceId}) = _MobileOperatorServices;

  factory MobileOperatorServices.fromJson(Map<String, dynamic> json) =>
      _$MobileOperatorServicesFromJson(json);
}

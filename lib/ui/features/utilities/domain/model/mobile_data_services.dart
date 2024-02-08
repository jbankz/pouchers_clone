import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/serializer/string_to_num_serializer.dart';

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
      String? code,
      String? name,
      String? shortCode,
      @StringToNumSerializer() @Default(0) num price,
      @Default(0) num serviceId}) = _MobileOperatorServices;

  factory MobileOperatorServices.fromJson(Map<String, dynamic> json) =>
      _$MobileOperatorServicesFromJson(json);
}

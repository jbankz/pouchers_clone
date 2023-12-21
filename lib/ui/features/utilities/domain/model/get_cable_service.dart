import 'package:Pouchers/ui/features/utilities/domain/model/cable_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'get_cable_service.freezed.dart';
part 'get_cable_service.g.dart';

@freezed
class GetCableService with _$GetCableService {
  @HiveType(typeId: 13, adapterName: 'GetCableServiceAdapter')
  factory GetCableService(
          {@HiveField(0) String? referenceNumber,
          @HiveField(1) @Default([]) List<CableService> services}) =
      _GetCableService;

  factory GetCableService.fromJson(Map<String, dynamic> json) =>
      _$GetCableServiceFromJson(json);
}

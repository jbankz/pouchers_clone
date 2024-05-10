import 'package:pouchers/ui/features/utilities/domain/model/cable_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../app/core/constants/db_constants.dart';

part 'get_cable_service.freezed.dart';
part 'get_cable_service.g.dart';

@freezed
@HiveType(typeId: DbConstants.thirteen)
class GetCableService with _$GetCableService {
  factory GetCableService(
          {@HiveField(0) String? referenceNumber,
          @HiveField(1) @Default([]) List<CableService> services}) =
      _GetCableService;

  factory GetCableService.fromJson(Map<String, dynamic> json) =>
      _$GetCableServiceFromJson(json);
}

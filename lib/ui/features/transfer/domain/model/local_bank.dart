import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../app/core/constants/db_constants.dart';
import 'attributes.dart';

part 'local_bank.freezed.dart';
part 'local_bank.g.dart';

@freezed
@HiveType(typeId: DbConstants.six)
class LocalBank with _$LocalBank {
  factory LocalBank(
      {@HiveField(0) String? id,
      @HiveField(1) String? type,
      @HiveField(2) Attributes? attributes}) = _LocalBank;

  factory LocalBank.fromJson(Map<String, dynamic> json) =>
      _$LocalBankFromJson(json);
}

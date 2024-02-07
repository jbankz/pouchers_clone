import 'package:freezed_annotation/freezed_annotation.dart';

import 'identity.dart';

part 'individual.freezed.dart';
part 'individual.g.dart';

@freezed
class Individual with _$Individual {
  factory Individual({
    String? firstName,
    String? lastName,
    DateTime? dob,
    Identity? identity,
    @JsonKey(name: '_id') String? id,
  }) = _Individual;

  factory Individual.fromJson(Map<String, dynamic> json) =>
      _$IndividualFromJson(json);
}

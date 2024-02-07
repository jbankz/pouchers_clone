import 'package:json_annotation/json_annotation.dart';

import '../earning.dart';

class EarningSerializer implements JsonConverter<List<Earning>?, Object?> {
  const EarningSerializer();

  @override
  List<Earning>? fromJson(Object? json) {
    if (json is List<dynamic>) {
      return json
          .map((dynamic e) => Earning.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  @override
  Object? toJson(List<Earning>? object) =>
      object?.map((Earning e) => e.toJson()).toList();
}

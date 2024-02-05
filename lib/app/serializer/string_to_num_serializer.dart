import 'package:json_annotation/json_annotation.dart';

class StringToNumSerializer implements JsonConverter<num, dynamic> {
  const StringToNumSerializer();

  @override
  num fromJson(dynamic json) => num.tryParse(json.toString()) ?? 0;

  @override
  String toJson(num object) => object.toString();
}

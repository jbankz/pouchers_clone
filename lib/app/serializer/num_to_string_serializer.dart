import 'package:json_annotation/json_annotation.dart';

class NumToStringSerializer implements JsonConverter<String, dynamic> {
  const NumToStringSerializer();

  @override
  String fromJson(dynamic json) => json.toString();

  @override
  String toJson(String object) => object.toString();
}

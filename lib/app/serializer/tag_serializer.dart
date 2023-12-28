import 'package:json_annotation/json_annotation.dart';

class TagSerializer implements JsonConverter<String, String> {
  const TagSerializer();

  @override
  String fromJson(String json) => '@$json';

  @override
  String toJson(String object) => object;
}

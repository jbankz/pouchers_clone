import '../enum/id_enum.dart';

class IdentificationType {
  final String key;
  final String value;
  final IdTypes idTypes;
  final String dojahKey;

  IdentificationType(
      {required this.key,
      required this.value,
      required this.idTypes,
      required this.dojahKey});
}

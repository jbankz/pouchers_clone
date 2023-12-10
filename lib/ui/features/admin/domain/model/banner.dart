import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'banner.freezed.dart';
part 'banner.g.dart';

@freezed
class Banner with _$Banner {
  @HiveType(typeId: 9, adapterName: 'BannerAdapter')
  factory Banner(
      {@HiveField(0) String? id,
      @JsonKey(name: 'image_url') @HiveField(1) String? imageUrl,
      @HiveField(2) String? type}) = _Banner;

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
}

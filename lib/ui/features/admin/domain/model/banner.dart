import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/constants/db_constants.dart';

part 'banner.freezed.dart';
part 'banner.g.dart';

@freezed
@HiveType(typeId: DbConstants.nine)
class Banner with _$Banner {
  factory Banner(
      {@HiveField(0) String? id,
      @JsonKey(name: 'image_url') @HiveField(1) String? imageUrl,
      @HiveField(2) String? type}) = _Banner;

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_signed_url.freezed.dart';
part 'get_signed_url.g.dart';

@freezed
class GetSignedUrl with _$GetSignedUrl {
  factory GetSignedUrl(
      {String? status,
      String? message,
      int? code,
      String? data}) = _GetSignedUrl;

  factory GetSignedUrl.fromJson(Map<String, dynamic> json) =>
      _$GetSignedUrlFromJson(json);
}

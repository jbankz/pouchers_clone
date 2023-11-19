class UserDto {
  final String? bvn;
  final String? validId;

  UserDto({this.bvn, this.validId});

  Map<String, dynamic> toJson() =>
      {if (bvn != null) 'bvn': bvn, if (validId != null) 'valid_id': validId};
}

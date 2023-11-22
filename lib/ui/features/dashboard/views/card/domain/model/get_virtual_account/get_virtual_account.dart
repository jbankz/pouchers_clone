import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'get_virtual_account.freezed.dart';
part 'get_virtual_account.g.dart';

@freezed
class GetVirtualAccount with _$GetVirtualAccount {
  factory GetVirtualAccount({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _GetVirtualAccount;

  factory GetVirtualAccount.fromJson(Map<String, dynamic> json) =>
      _$GetVirtualAccountFromJson(json);
}

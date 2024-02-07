import 'package:Pouchers/ui/features/utilities/domain/enum/billers_category.dart';

class BillersDto {
  final BillersCategory? billersCategory;
  final String? cableId;
  final String? merchantAccount;
  final String? merchantReferenceNumber;
  final String? merchantServiceProductCode;
  final String? operatorId;
  final BillersCategory? path;

  BillersDto(
      {this.billersCategory,
      this.cableId,
      this.merchantAccount,
      this.merchantReferenceNumber,
      this.merchantServiceProductCode,
      this.path,
      this.operatorId});

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (merchantAccount != null) {
      result.addAll({'merchantAccount': merchantAccount});
    }

    if (merchantReferenceNumber != null) {
      result.addAll({'merchantReferenceNumber': merchantReferenceNumber});
    }

    if (merchantServiceProductCode != null) {
      result.addAll({'merchantServiceProductCode': merchantServiceProductCode});
    }
    if (merchantServiceProductCode != null) {
      result.addAll({'category': billersCategory?.name});
    }
    return result;
  }
}

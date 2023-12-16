class MobileDto {
  final String? category;
  final String? subCategory;
  final num? amount;
  final String? destinationPhoneNumber;
  final String? mobileOperatorPublicId;
  final bool? applyDiscount;
  final String? transactionPin;

  MobileDto(
      {this.category,
      this.subCategory,
      this.amount,
      this.destinationPhoneNumber,
      this.mobileOperatorPublicId,
      this.applyDiscount,
      this.transactionPin});

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (category != null) {
      result.addAll({'category': category});
    }
    if (subCategory != null) {
      result.addAll({'sub_category': subCategory});
    }
    if (amount != null) {
      result.addAll({'amount': amount});
    }
    if (destinationPhoneNumber != null) {
      result.addAll({'destinationPhoneNumber': destinationPhoneNumber});
    }
    if (mobileOperatorPublicId != null) {
      result.addAll({'mobileOperatorPublicId': mobileOperatorPublicId});
    }
    if (applyDiscount != null) {
      result.addAll({'apply_discount': applyDiscount});
    }
    if (transactionPin != null) {
      result.addAll({'transactionPin': transactionPin});
    }
    return result;
  }
}

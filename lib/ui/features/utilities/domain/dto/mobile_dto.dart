import '../enum/service_category.dart';

class MobileDto {
  final ServiceCategory? category;
  final String? subCategory;
  final num? amount;
  final String? destinationPhoneNumber;
  final String? mobileOperatorPublicId;
  final bool? applyDiscount;
  final String? mobileOperatorServiceId;
  final String? transactionPin;
  final bool? isDataBundle;
  final String? frequency;
  final String? merchantAccount;
  final String? merchantReferenceNumber;
  final String? merchantService;
  final String? tag;
  final bool isMerchantPayment;
  final bool makeMerchantServiceArray;
  final String? note;

  MobileDto({
    this.category,
    this.subCategory,
    this.amount,
    this.destinationPhoneNumber,
    this.mobileOperatorPublicId,
    this.applyDiscount,
    this.mobileOperatorServiceId,
    this.isDataBundle,
    this.transactionPin,
    this.frequency,
    this.merchantAccount,
    this.merchantReferenceNumber,
    this.merchantService,
    this.isMerchantPayment = false,
    this.makeMerchantServiceArray = true,
    this.tag,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (category != null) {
      result.addAll({'category': category?.value});
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
    if (mobileOperatorServiceId != null) {
      result.addAll({'mobileOperatorServiceId': mobileOperatorServiceId});
    }
    if (isDataBundle != null) {
      result.addAll({'isDataBundle': isDataBundle});
    }
    if (frequency != null) {
      result.addAll({'frequency': frequency});
    }
    if (merchantAccount != null) {
      result.addAll({'merchantAccount': merchantAccount});
    }
    if (merchantReferenceNumber != null) {
      result.addAll({'merchantReferenceNumber': merchantReferenceNumber});
    }
    if (merchantService != null) {
      result.addAll({
        'merchantService':
            makeMerchantServiceArray ? [merchantService] : merchantService
      });
    }
    if (tag != null) {
      result.addAll({'tag': tag!.replaceAll('@', '')});
    }
    if (note != null) {
      result.addAll({'note': note});
    }
    return result;
  }
}

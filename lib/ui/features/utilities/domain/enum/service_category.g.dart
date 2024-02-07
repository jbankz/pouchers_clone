// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceCategoryAdapter extends TypeAdapter<ServiceCategory> {
  @override
  final int typeId = 21;

  @override
  ServiceCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ServiceCategory.airtime;
      case 2:
        return ServiceCategory.data;
      case 3:
        return ServiceCategory.cable;
      case 4:
        return ServiceCategory.electricity;
      case 5:
        return ServiceCategory.betting;
      case 6:
        return ServiceCategory.voucherPurchase;
      case 7:
        return ServiceCategory.education;
      case 8:
        return ServiceCategory.internet;
      case 9:
        return ServiceCategory.p2p;
      case 10:
        return ServiceCategory.voucherRedeem;
      case 11:
        return ServiceCategory.fundWallet;
      case 12:
        return ServiceCategory.createVirtualCard;
      case 13:
        return ServiceCategory.fundVirtualCard;
      case 14:
        return ServiceCategory.localBankTransfer;
      case 15:
        return ServiceCategory.adminDebitWallet;
      case 16:
        return ServiceCategory.adminCreditWallet;
      case 17:
        return ServiceCategory.referralBonusPayment;
      case 18:
        return ServiceCategory.moneyRequest;
      default:
        return ServiceCategory.airtime;
    }
  }

  @override
  void write(BinaryWriter writer, ServiceCategory obj) {
    switch (obj) {
      case ServiceCategory.airtime:
        writer.writeByte(0);
        break;
      case ServiceCategory.data:
        writer.writeByte(2);
        break;
      case ServiceCategory.cable:
        writer.writeByte(3);
        break;
      case ServiceCategory.electricity:
        writer.writeByte(4);
        break;
      case ServiceCategory.betting:
        writer.writeByte(5);
        break;
      case ServiceCategory.voucherPurchase:
        writer.writeByte(6);
        break;
      case ServiceCategory.education:
        writer.writeByte(7);
        break;
      case ServiceCategory.internet:
        writer.writeByte(8);
        break;
      case ServiceCategory.p2p:
        writer.writeByte(9);
        break;
      case ServiceCategory.voucherRedeem:
        writer.writeByte(10);
        break;
      case ServiceCategory.fundWallet:
        writer.writeByte(11);
        break;
      case ServiceCategory.createVirtualCard:
        writer.writeByte(12);
        break;
      case ServiceCategory.fundVirtualCard:
        writer.writeByte(13);
        break;
      case ServiceCategory.localBankTransfer:
        writer.writeByte(14);
        break;
      case ServiceCategory.adminDebitWallet:
        writer.writeByte(15);
        break;
      case ServiceCategory.adminCreditWallet:
        writer.writeByte(16);
        break;
      case ServiceCategory.referralBonusPayment:
        writer.writeByte(17);
        break;
      case ServiceCategory.moneyRequest:
        writer.writeByte(18);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

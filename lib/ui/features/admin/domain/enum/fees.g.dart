// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fees.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeesAdapter extends TypeAdapter<Fees> {
  @override
  final int typeId = 30;

  @override
  Fees read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Fees.tier1DailyTransactionLimit;
      case 1:
        return Fees.tier2DailyTransactionLimit;
      case 2:
        return Fees.tier3DailyTransactionLimit;
      case 3:
        return Fees.tier1MaximumBalance;
      case 4:
        return Fees.currentDollarRate;
      case 5:
        return Fees.walletFundingFee;
      case 6:
        return Fees.externalTransferfee;
      case 7:
        return Fees.sudoVerveNairaCardCreationFee;
      case 8:
        return Fees.sudoVerveNairaCardFundingFee;
      case 9:
        return Fees.sudoDollarCardCreationfee;
      case 10:
        return Fees.sudoMinNairaCardFundingAmt;
      case 11:
        return Fees.sudoMinDollarCardFundingAmt;
      case 12:
        return Fees.utilityProvider;
      case 13:
        return Fees.electricityUtilityProvider;
      case 14:
        return Fees.internetUtilityProvider;
      case 15:
        return Fees.cableUtilityProvider;
      case 16:
        return Fees.educationUtilityProvider;
      case 17:
        return Fees.bettingUtilityProvider;
      case 18:
        return Fees.referralBonusAmount;
      case 19:
        return Fees.electricityFee;
      case 20:
        return Fees.internetFee;
      case 21:
        return Fees.airtimeUtilityProvider;
      case 22:
        return Fees.tier2MaximumBalance;
      case 23:
        return Fees.tier3MaximumBalance;
      case 24:
        return Fees.nairaCardCreationFee;
      case 25:
        return Fees.dollarCardCreationFee;
      case 26:
        return Fees.dollarCardFundingFee;
      case 27:
        return Fees.nairaCardFundingFee;
      case 28:
        return Fees.betWalletFundingFee;
      case 29:
        return Fees.educationFee;
      case 30:
        return Fees.airtimeFee;
      case 31:
        return Fees.dataFee;
      case 32:
        return Fees.cableTvFee;
      case 33:
        return Fees.vouchersFee;
      case 34:
        return Fees.sendPulseAccessToken;
      case 35:
        return Fees.dataUtilityProvider;
      default:
        return Fees.tier1DailyTransactionLimit;
    }
  }

  @override
  void write(BinaryWriter writer, Fees obj) {
    switch (obj) {
      case Fees.tier1DailyTransactionLimit:
        writer.writeByte(0);
        break;
      case Fees.tier2DailyTransactionLimit:
        writer.writeByte(1);
        break;
      case Fees.tier3DailyTransactionLimit:
        writer.writeByte(2);
        break;
      case Fees.tier1MaximumBalance:
        writer.writeByte(3);
        break;
      case Fees.currentDollarRate:
        writer.writeByte(4);
        break;
      case Fees.walletFundingFee:
        writer.writeByte(5);
        break;
      case Fees.externalTransferfee:
        writer.writeByte(6);
        break;
      case Fees.sudoVerveNairaCardCreationFee:
        writer.writeByte(7);
        break;
      case Fees.sudoVerveNairaCardFundingFee:
        writer.writeByte(8);
        break;
      case Fees.sudoDollarCardCreationfee:
        writer.writeByte(9);
        break;
      case Fees.sudoMinNairaCardFundingAmt:
        writer.writeByte(10);
        break;
      case Fees.sudoMinDollarCardFundingAmt:
        writer.writeByte(11);
        break;
      case Fees.utilityProvider:
        writer.writeByte(12);
        break;
      case Fees.electricityUtilityProvider:
        writer.writeByte(13);
        break;
      case Fees.internetUtilityProvider:
        writer.writeByte(14);
        break;
      case Fees.cableUtilityProvider:
        writer.writeByte(15);
        break;
      case Fees.educationUtilityProvider:
        writer.writeByte(16);
        break;
      case Fees.bettingUtilityProvider:
        writer.writeByte(17);
        break;
      case Fees.referralBonusAmount:
        writer.writeByte(18);
        break;
      case Fees.electricityFee:
        writer.writeByte(19);
        break;
      case Fees.internetFee:
        writer.writeByte(20);
        break;
      case Fees.airtimeUtilityProvider:
        writer.writeByte(21);
        break;
      case Fees.tier2MaximumBalance:
        writer.writeByte(22);
        break;
      case Fees.tier3MaximumBalance:
        writer.writeByte(23);
        break;
      case Fees.nairaCardCreationFee:
        writer.writeByte(24);
        break;
      case Fees.dollarCardCreationFee:
        writer.writeByte(25);
        break;
      case Fees.dollarCardFundingFee:
        writer.writeByte(26);
        break;
      case Fees.nairaCardFundingFee:
        writer.writeByte(27);
        break;
      case Fees.betWalletFundingFee:
        writer.writeByte(28);
        break;
      case Fees.educationFee:
        writer.writeByte(29);
        break;
      case Fees.airtimeFee:
        writer.writeByte(30);
        break;
      case Fees.dataFee:
        writer.writeByte(31);
        break;
      case Fees.cableTvFee:
        writer.writeByte(32);
        break;
      case Fees.vouchersFee:
        writer.writeByte(33);
        break;
      case Fees.sendPulseAccessToken:
        writer.writeByte(34);
        break;
      case Fees.dataUtilityProvider:
        writer.writeByte(35);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'envs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnvsAdapter extends TypeAdapter<Envs> {
  @override
  final int typeId = 31;

  @override
  Envs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Envs();
  }

  @override
  void write(BinaryWriter writer, Envs obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnvsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnvsImpl _$$EnvsImplFromJson(Map<String, dynamic> json) => _$EnvsImpl(
      name: $enumDecodeNullable(_$FeesEnumMap, json['name']),
      value: json['value'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$EnvsImplToJson(_$EnvsImpl instance) =>
    <String, dynamic>{
      'name': _$FeesEnumMap[instance.name],
      'value': instance.value,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$FeesEnumMap = {
  Fees.tier1DailyTransactionLimit: 'tier1_daily_transaction_limit',
  Fees.tier2DailyTransactionLimit: 'tier2_daily_transaction_limit',
  Fees.tier3DailyTransactionLimit: 'tier3_daily_transaction_limit',
  Fees.tier1MaximumBalance: 'tier1_maximum_balance',
  Fees.currentDollarRate: 'current_dollar_rate',
  Fees.walletFundingFee: 'wallet_funding_fee',
  Fees.externalTransferfee: 'external_transfer_fee',
  Fees.sudoVerveNairaCardCreationFee: 'sudo_verve_naira_card_creation_fee',
  Fees.sudoVerveNairaCardFundingFee: 'sudo_verve_naira_card_funding_fee',
  Fees.sudoDollarCardCreationfee: 'sudo_dollar_card_creation_fee',
  Fees.sudoMinNairaCardFundingAmt: 'sudo_min_naira_card_funding_amt',
  Fees.sudoMinDollarCardFundingAmt: 'sudo_min_dollar_card_funding_amt',
  Fees.utilityProvider: 'utility_provider',
  Fees.electricityUtilityProvider: 'electricity_utility_provider',
  Fees.internetUtilityProvider: 'internet_utility_provider',
  Fees.cableUtilityProvider: 'cable_utility_provider',
  Fees.educationUtilityProvider: 'education_utility_provider',
  Fees.bettingUtilityProvider: 'betting_utility_provider',
  Fees.referralBonusAmount: 'referral_bonus_amount',
  Fees.electricityFee: 'electricity_fee',
  Fees.internetFee: 'internet_fee',
  Fees.airtimeUtilityProvider: 'airtime_utility_provider',
  Fees.tier2MaximumBalance: 'tier2_maximum_balance',
  Fees.tier3MaximumBalance: 'tier3_maximum_balance',
  Fees.nairaCardCreationFee: 'naira_card_creation_fee',
  Fees.dollarCardCreationFee: 'dollar_card_creation_fee',
  Fees.dollarCardFundingFee: 'dollar_card_funding_fee',
  Fees.nairaCardFundingFee: 'naira_card_funding_fee',
  Fees.betWalletFundingFee: 'bet_wallet_funding_fee',
  Fees.educationFee: 'education_fee',
  Fees.airtimeFee: 'airtime_fee',
  Fees.dataFee: 'data_fee',
  Fees.cableTvFee: 'cable_tv_fee',
  Fees.vouchersFee: 'vouchers_fee',
  Fees.sendPulseAccessToken: 'send_pulse_access_token',
  Fees.dataUtilityProvider: 'data_utility_provider',
};

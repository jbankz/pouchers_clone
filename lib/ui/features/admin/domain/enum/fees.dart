import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../app/core/constants/db_constants.dart';

part 'fees.g.dart';

@HiveType(typeId: DbConstants.thirty)
@JsonEnum(valueField: 'value', fieldRename: FieldRename.kebab)
enum Fees {
  @HiveField(0)
  tier1DailyTransactionLimit('tier1_daily_transaction_limit'),
  @HiveField(1)
  tier2DailyTransactionLimit('tier2_daily_transaction_limit'),
  @HiveField(2)
  tier3DailyTransactionLimit('tier3_daily_transaction_limit'),
  @HiveField(3)
  tier1MaximumBalance('tier1_maximum_balance'),
  @HiveField(4)
  currentDollarRate('current_dollar_rate'),
  @HiveField(5)
  walletFundingFee('wallet_funding_fee'),
  @HiveField(6)
  externalTransferfee('external_transfer_fee'),
  @HiveField(7)
  sudoVerveNairaCardCreationFee('sudo_verve_naira_card_creation_fee'),
  @HiveField(8)
  sudoVerveNairaCardFundingFee('sudo_verve_naira_card_funding_fee'),
  @HiveField(9)
  sudoDollarCardCreationfee('sudo_dollar_card_creation_fee'),
  @HiveField(10)
  sudoMinNairaCardFundingAmt('sudo_min_naira_card_funding_amt'),
  @HiveField(11)
  sudoMinDollarCardFundingAmt('sudo_min_dollar_card_funding_amt'),
  @HiveField(12)
  utilityProvider('utility_provider'),
  @HiveField(13)
  electricityUtilityProvider('electricity_utility_provider'),
  @HiveField(14)
  internetUtilityProvider('internet_utility_provider'),
  @HiveField(15)
  cableUtilityProvider('cable_utility_provider'),
  @HiveField(16)
  educationUtilityProvider('education_utility_provider'),
  @HiveField(17)
  bettingUtilityProvider('betting_utility_provider'),
  @HiveField(18)
  referralBonusAmount('referral_bonus_amount'),
  @HiveField(19)
  electricityFee('electricity_fee'),
  @HiveField(20)
  internetFee('internet_fee'),
  @HiveField(21)
  airtimeUtilityProvider('airtime_utility_provider'),
  @HiveField(22)
  tier2MaximumBalance('tier2_maximum_balance'),
  @HiveField(23)
  tier3MaximumBalance('tier3_maximum_balance'),
  @HiveField(24)
  nairaCardCreationFee('naira_card_creation_fee'),
  @HiveField(25)
  dollarCardCreationFee('dollar_card_creation_fee'),
  @HiveField(26)
  dollarCardFundingFee('dollar_card_funding_fee'),
  @HiveField(27)
  nairaCardFundingFee('naira_card_funding_fee'),
  @HiveField(28)
  betWalletFundingFee('bet_wallet_funding_fee'),
  @HiveField(29)
  educationFee('education_fee'),
  @HiveField(30)
  airtimeFee('airtime_fee'),
  @HiveField(31)
  dataFee('data_fee'),
  @HiveField(32)
  cableTvFee('cable_tv_fee'),
  @HiveField(33)
  vouchersFee('vouchers_fee'),
  @HiveField(34)
  sendPulseAccessToken('send_pulse_access_token'),
  @HiveField(35)
  dataUtilityProvider('data_utility_provider'),
  @HiveField(36)
  sudoDollarCardFundingFee('sudo_dollar_card_funding_fee');

  final String value;

  const Fees(this.value);
}

import 'package:Pouchers/ui/features/dashboard/views/card/data/repository/module/module.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/usecase/freeze_card_usecase.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/usecase/get_exchange_rate_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../app/core/usecase/poucher_usecase.dart';
import '../create_dollar_virtual_card_usecase.dart';
import '../create_naira_virtual_card_usecase.dart';
import '../fund_virtual_account_usecase.dart';
import '../get_account_balance_usecase.dart';
import '../get_card_toke_usecase.dart';
import '../get_card_transaction_usecase.dart';
import '../get_cards_usecase.dart';
import '../get_virtual_account_usecase.dart';
import '../get_virtual_card_details_usecase.dart';

final getVirtualCardDetailsUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => GetVirtualCardDetalsUseCaseImpl(ref.read(cardRepoModule)));

final createNairaVirtualCardUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => CreateNairaVirtualCardUseCaseImpl(ref.read(cardRepoModule)));

final createDollarVirtualCardUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => CreateDollarVirtualCardUseCaseImpl(ref.read(cardRepoModule)));

final getAccountBalanceUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => GetAccountBalanceUseCaseImpl(ref.read(cardRepoModule)));

final getVirtualAccountUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => GetVirtualAccountUseCaseImpl(ref.read(cardRepoModule)));

final getFundVirtualAccountUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => FundVirtualAccountUseCaseImpl(ref.read(cardRepoModule)));

final getFreezedCardUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => FreezeCardUseCaseImpl(ref.read(cardRepoModule)));

final getCardTransactionUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => GetCardTransactionUseCaseImpl(ref.read(cardRepoModule)));

final getCardsUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => GetCardsUseCaseImpl(ref.read(cardRepoModule)));

final getCardTokenUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => GetCardTokenUseCaseImpl(ref.read(cardRepoModule)));

final getExchangeRateUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => GetExchageRateUseCaseImpl(ref.read(cardRepoModule)));

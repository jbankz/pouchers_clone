import '../../../../../utilities/domain/enum/service_category.dart';
import '../model/transaction_history.dart';

String transactionTitle(TransactionHistory transaction) =>
    switch (transaction.transactionCategory) {
      ServiceCategory.airtime => 'Airtime Purchase',
      ServiceCategory.adminCreditWallet => 'Admin Credit Wallet',
      ServiceCategory.adminDebitWallet => 'Admin Debit Wallet',
      ServiceCategory.betting => 'Betting Purchase',
      ServiceCategory.cable => 'Cable Purchase',
      ServiceCategory.createVirtualCard => 'Virtual Card Created',
      ServiceCategory.voucherRedeem => 'Vouchers Redeem',
      ServiceCategory.localBankTransfer => 'Money Transfer (Bank)',
      ServiceCategory.education => 'Education Purchase',
      ServiceCategory.data => 'Data Purchase',
      ServiceCategory.fundVirtualCard => 'Virtual Card Funded',
      ServiceCategory.voucherPurchase => 'Vouchers Purchase',
      ServiceCategory.electricity => 'Electricity Purchase',
      ServiceCategory.p2p => 'Money Transfer (P2P)',
      ServiceCategory.fundWallet => 'Wallet Funding',
      ServiceCategory.referralBonusPayment => 'Referral Bonus',
      ServiceCategory.internet => 'Internet Purchase',
      ServiceCategory.moneyRequest => "Request Money",
      null => ''
    };

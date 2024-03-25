import 'package:pouchers/ui/features/profile/domain/model/bank_account_details/bank_account_details.dart';
import 'package:pouchers/ui/features/transfer/domain/model/attributes.dart';

class ConfirmTransferMoney {
  final double amount;
  final BankAccountDetails bankAccountDetails;
  final Attributes attributes;
  final String accountNumber;

  ConfirmTransferMoney(
      {required this.amount,
      required this.bankAccountDetails,
      required this.attributes,
      required this.accountNumber});
}

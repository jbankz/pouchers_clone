import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../domain/dto/confirm_transfer_money_dto.dart';
import '../domain/dto/transfer_money_dto.dart';
import 'notifier/local_bank_notifier.dart';

class TransferMoneyConfirmationView extends ConsumerStatefulWidget {
  const TransferMoneyConfirmationView(
      {super.key, required this.confirmTransferMoney});

  final ConfirmTransferMoney confirmTransferMoney;

  @override
  ConsumerState<TransferMoneyConfirmationView> createState() =>
      _TransferMoneyConfirmationViewState();
}

class _TransferMoneyConfirmationViewState
    extends ConsumerState<TransferMoneyConfirmationView> {
  late LocalBankNotifier _localBankNotifier;
  final CancelToken _cancelToken = CancelToken();
  @override
  void initState() {
    super.initState();
    _localBankNotifier = ref.read(localBankNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppString.transferMoney)),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  Text(AppString.confirm,
                      style: context.headlineMedium?.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w700)),
                  const Gap(height: 24),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
                    width: double.infinity,
                    color: AppColors.kBackgroundColor,
                    child: Column(
                      children: [
                        _buildTile(
                            context: context,
                            key: AppString.amount,
                            value: widget.confirmTransferMoney.amount.toNaira),
                        const Gap(height: 30),
                        _buildTile(
                            context: context,
                            key: AppString.transferFee,
                            value: widget.confirmTransferMoney
                                .bankAccountDetails.transactionFee.toNaira),
                        const Gap(height: 30),
                        _buildTile(
                            context: context,
                            key: AppString.bankName,
                            value:
                                widget.confirmTransferMoney.attributes.name ??
                                    ''),
                        const Gap(height: 30),
                        _buildTile(
                            context: context,
                            key: AppString.accountNumber,
                            value: widget.confirmTransferMoney.accountNumber),
                        const Gap(height: 30),
                        _buildTile(
                            context: context,
                            key: AppString.accountName,
                            value: widget.confirmTransferMoney
                                    .bankAccountDetails.accountName ??
                                ''),
                        const Gap(height: 30),
                        _buildTile(
                            context: context,
                            key: AppString.total,
                            fontWeight: FontWeight.w700,
                            value: (widget.confirmTransferMoney.amount +
                                    widget.confirmTransferMoney
                                        .bankAccountDetails.transactionFee)
                                .toNaira),
                      ],
                    ),
                  ),
                  const Gap(height: 36),
                  RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: AppString.youWillDebited,
                          style: context.headlineMedium?.copyWith(
                              color: AppColors.kIconGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          children: [
                            TextSpan(
                                text: (widget.confirmTransferMoney.amount +
                                        widget.confirmTransferMoney
                                            .bankAccountDetails.transactionFee)
                                    .toNaira,
                                style: context.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.kPrimaryTextColor)),
                            TextSpan(text: AppString.youWillDebited2)
                          ]))
                ],
              )),
              ElevatedButtonWidget(
                  title: 'Transfer',
                  loading: ref.watch(localBankNotifierProvider).isBusy,
                  onPressed: () async {
                    final pin = await BottomSheets.showSheet(
                        child: const PinConfirmationSheet()) as String?;
                    if (pin != null) {
                      _localBankNotifier.transferToLocalBank(
                          TransferMoneyDto(
                              amount:
                                  widget.confirmTransferMoney.amount.toString(),
                              accountNumber:
                                  widget.confirmTransferMoney.accountNumber,
                              bankName:
                                  widget.confirmTransferMoney.attributes.name ??
                                      '',
                              transactionPin: pin),
                          _cancelToken);
                    }
                  })
            ],
          ),
        ),
      );

  Row _buildTile(
          {required BuildContext context,
          required String key,
          required String value,
          FontWeight fontWeight = FontWeight.w400}) =>
      Row(
        children: [
          Expanded(
            child: Text(
              key,
              style: context.headlineMedium?.copyWith(
                  color: AppColors.kIconGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
              maxLines: 1,
            ),
          ),
          const Gap(width: 23),
          Expanded(
            child: Text(value,
                style: context.headlineMedium
                    ?.copyWith(fontSize: 14, fontWeight: fontWeight),
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          )
        ],
      );
}

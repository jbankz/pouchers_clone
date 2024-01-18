import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:Pouchers/ui/features/requests/domain/enum/request_money_action.dart';
import 'package:Pouchers/ui/features/requests/domain/model/request_model.dart';
import 'package:Pouchers/ui/features/transfer/presentation/notifier/transfer_notifier.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/keypad/config/keypad_config.dart';
import 'package:Pouchers/ui/widgets/keypad/virtual_keypad.dart';
import 'package:Pouchers/ui/widgets/profile_image.dart';
import 'package:Pouchers/ui/widgets/sheets/confirmation_sheet.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/formatter/money_formatter.dart';
import '../../../../widgets/keypad/virtual_key_pad_controller.dart';
import '../../domain/dto/request_dto.dart';
import 'sheet/decline_requested_money_sheet.dart';

class RequestMoneyView extends ConsumerStatefulWidget {
  const RequestMoneyView({super.key, required this.request});

  final RequestModel request;

  @override
  ConsumerState<RequestMoneyView> createState() => _RequestMoneyViewState();
}

class _RequestMoneyViewState extends ConsumerState<RequestMoneyView> {
  final VirtualKeyPadController _controller =
      VirtualKeyPadController(applyPinLength: false);
  final CancelToken _cancelToken = CancelToken();
  late TransferNotifier _transferNotifier;

  String get _fullName =>
      '${request?.firstName?.titleCase ?? ''} ${request?.lastName?.titleCase ?? ''}';
  String get _note => request?.note ?? 'This is a samole';

  String _errorMessage = '';

  RequestModel? request;

  late MoneyMaskedTextController _moneyMaskedTextController;
  bool get _isBtnDisabled =>
      _controller.pins.isEmpty || request == null || _errorMessage.isNotEmpty;

  @override
  void initState() {
    super.initState();
    request = widget.request;
    _controller.pins.add((request?.amount ?? '').toString());
    _moneyMaskedTextController = MoneyMaskedTextController(
        initialValue: (request?.amount ?? 0).toDouble(),
        leftSymbol: AppString.nairaSymbol,
        amountColor: AppColors.white,
        koboColor: AppColors.white.withOpacity(.50));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _transferNotifier = ref.read(transferNotifierProvider.notifier);
      _controller.addListener(() => setState(() {}));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final transferState = ref.watch(transferNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.kPurpleColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPurpleColor,
        title: Text(
          'Request Money',
          style: context.bodyLarge?.copyWith(
            color: AppColors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Gap(height: 62),
                    _buildTagContainer(context),
                    const Gap(height: 32),
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: _moneyMaskedTextController,
                      readOnly: true,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                        hintText: 0.toNaira,
                        hintStyle: TextStyle(
                          color: AppColors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        fillColor: Colors.transparent,
                        filled: false,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                      ),
                    ),
                    Text(
                      _errorMessage,
                      style: context.headlineLarge?.copyWith(
                          color: AppColors.kColorOrange, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            _buildVirtualKeyPad(),
            const Gap(height: 23),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButtonWidget(
                    loading: transferState.isBusy,
                    title: AppString.decline,
                    outlinedColor: AppColors.white,
                    onPressed: () async {
                      await BottomSheets.showAlertDialog(
                          barrierDismissible: false,
                          child: DeclineRequestedMoneySheet(request: request));
                    },
                  )),
                  const Gap(width: 17),
                  Expanded(
                      child: ElevatedButtonWidget(
                    loading: transferState.isBusy,
                    title: AppString.approve,
                    bacgroundColor: _isBtnDisabled
                        ? null
                        : AppColors.kColorBackgroundLight200,
                    outlinedColor: AppColors.kColorBackgroundLight200,
                    textStyle: context.titleLarge?.copyWith(
                        color: AppColors.kPurpleColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                    onPressed: _isBtnDisabled
                        ? null
                        : () async {
                            final response = await BottomSheets.showAlertDialog(
                                child: TransferConfirmationSheet(
                                    amount:
                                        _moneyMaskedTextController.numberValue,
                                    receipient: _fullName)) as String?;

                            if (response != null) {
                              _transferNotifier.requestedMoney(
                                requestDto: RequestDto(
                                    requestedMoneyAction:
                                        RequestMoneyAction.accept,
                                    requestId: request?.requestId,
                                    transactionPin: response,
                                    amount:
                                        _moneyMaskedTextController.numberValue),
                                cancelToken: _cancelToken,
                              );
                            }
                          },
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTagContainer(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding:
              EdgeInsets.only(left: 18.w, top: 14.h, bottom: 19.h, right: 39.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: AppColors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileImage(
                  image: request?.profilePicture ?? '', height: 48, width: 48),
              const Gap(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_fullName,
                        style: context.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        maxLines: 1),
                    const Gap(height: 3),
                    Text((request?.amount ?? 0).toNaira,
                        style: context.titleMedium?.copyWith(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const Gap(height: 4),
                    Text(_note,
                        style: context.titleMedium?.copyWith(
                          color: AppColors.kIconGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildVirtualKeyPad() => VirtualKeyPad(
        keyPadController: _controller,
        keypadConfig: KeypadConfig(
            keypadColor: AppColors.white, showPoint: true, decimal: 2),
        onTyping: () {
          _controller.pins.join().isEmpty
              ? _moneyMaskedTextController.updateValue(0)
              : _moneyMaskedTextController
                  .updateValue(double.parse(_controller.pins.join()));

          if (_moneyMaskedTextController.numberValue >
              num.parse(walletDao.wallet.balance ?? '0')) {
            _errorMessage = AppString.insufficientFund;
          } else {
            _errorMessage = '';
          }

          setState(() {});
        },
        onComplete: (_) {},
      );
}

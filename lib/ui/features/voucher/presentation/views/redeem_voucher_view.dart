import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../utils/field_validator.dart';
import '../../../../widgets/edit_text_field_with.dart';
import '../../../../widgets/ticket_widget.dart';
import '../../domain/model/vouchers.dart';
import '../notifier/vouchers_notifier.dart';
import 'sheets/vouchers_sheets.dart';

import 'redeem_voucher_view.form.dart';

@FormView(fields: [FormTextField(name: 'code')])
class RedeemVoucherView extends ConsumerStatefulWidget {
  const RedeemVoucherView({super.key});

  @override
  ConsumerState<RedeemVoucherView> createState() => _RedeemVoucherViewState();
}

class _RedeemVoucherViewState extends ConsumerState<RedeemVoucherView>
    with $RedeemVoucherView {
  late VouchersNotifier _vouchersNotifier;
  final CancelToken _cancelToken = CancelToken();
  final _formKey = GlobalKey<FormState>();
  Vouchers? _voucher;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeNotifier());
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  void _initializeNotifier() {
    _vouchersNotifier = ref.read(vouchersNotifierProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final voucherState = ref.watch(vouchersNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppString.redeemVoucher)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      EditTextFieldWidget(
                        title: AppString.enterVoucherCode,
                        label: '#12ABC499J',
                        controller: codeController,
                        focusNode: codeFocusNode,
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (_) {},
                        validator: FieldValidator.validateString(),
                        suffixIcon: _buildSubscriptionTypeSuffixIcon(),
                        onTap: () =>
                            BottomSheets.showSheet(child: const VouchersSheet())
                                .then((value) {
                          if (value != null) {
                            _voucher = value as Vouchers;
                            setState(
                                () => codeController.text = value.code ?? '');
                          }
                        }),
                      ),
                      const Gap(height: 10),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        transitionBuilder: (child, animation) =>
                            SizeTransition(sizeFactor: animation, child: child),
                        child: _voucher == null
                            ? const SizedBox.shrink()
                            : Container(
                                height: 180.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 16.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.kBackgroundColor),
                                child: TicketWidget(
                                    code: _voucher?.code ?? '',
                                    margin: EdgeInsets.only(left: 130.w),
                                    amount: (_voucher?.amount ?? 0).toNaira,
                                    date: _voucher?.createdAt)),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(height: 16),
              ElevatedButtonWidget(
                  loading: voucherState.isBusy,
                  title: AppString.redeemVoucher,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    _vouchersNotifier.redeemVoucher(
                        VoucherDto(code: codeController.text),
                        cancelToken: _cancelToken);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionTypeSuffixIcon() =>
      const Icon(Icons.keyboard_arrow_down_outlined,
          color: AppColors.kSecondaryTextColor);
}

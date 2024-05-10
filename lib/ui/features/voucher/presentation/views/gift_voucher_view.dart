import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/features/voucher/domain/dto/voucher_dto.dart';
import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../utils/field_validator.dart';
import '../../../../common/app_strings.dart';
import '../../../../widgets/edit_text_field_with.dart';
import '../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../notifier/vouchers_notifier.dart';
import 'gift_voucher_view.form.dart';
import 'sheets/vouchers_sheets.dart';

@FormView(
    fields: [FormTextField(name: 'code'), FormTextField(name: 'beneficiary')])
class GiftVoucherView extends ConsumerStatefulWidget {
  const GiftVoucherView({super.key});

  @override
  ConsumerState<GiftVoucherView> createState() => _GiftVoucherViewState();
}

class _GiftVoucherViewState extends ConsumerState<GiftVoucherView>
    with $GiftVoucherView {
  final _formKey = GlobalKey<FormState>();
  late VouchersNotifier _vouchersNotifier;

  final List<String> _tags = ['Email', 'Poucher Tag'];
  String _tag = '';
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeNotifier());
    _tag = _tags.first;
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
      appBar: AppBar(title: const Text('Gift Vouchers')),
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
                            setState(
                                () => codeController.text = value?.code ?? '');
                          }
                        }),
                      ),
                      const Gap(height: 24),
                      EditTextFieldWidget(
                          titleWidget: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: _tags.map((e) {
                                final bool isSelected = _tag == e;
                                return GestureDetector(
                                    onTap: () {
                                      beneficiaryController.clear();
                                      setState(() => _tag = e);
                                    },
                                    child: Row(children: [
                                      Icon(
                                          isSelected
                                              ? Icons.radio_button_checked
                                              : Icons.radio_button_unchecked,
                                          color: isSelected
                                              ? AppColors.kPurple100
                                              : AppColors.kSecondaryTextColor),
                                      const Gap(width: 6),
                                      Text(e,
                                          style: context.titleMedium?.copyWith(
                                              fontSize: 14,
                                              color: isSelected
                                                  ? AppColors.kPurple100
                                                  : AppColors
                                                      .kSecondaryTextColor,
                                              fontWeight: FontWeight.w500)),
                                      const Gap(width: 12)
                                    ]));
                              }).toList()),
                          label: _tag == _tags.first
                              ? AppString.emailInstruction
                              : AppString.enterPoucherTag,
                          controller: beneficiaryController,
                          readOnly: voucherState.isBusy,
                          focusNode: beneficiaryFocusNode,
                          keyboardType: _tag == _tags.first
                              ? TextInputType.emailAddress
                              : TextInputType.text,
                          onFieldSubmitted: (_) {},
                          validator: _tag == _tags.first
                              ? FieldValidator.validateEmail()
                              : FieldValidator.validateString()),
                    ],
                  ),
                ),
              ),
              const Gap(height: 16),
              ElevatedButtonWidget(
                  title: 'Gift Voucher',
                  loading: voucherState.isBusy,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    _submitData();
                  }),
              const Gap(height: 24),
              Text('Or send code via',
                  style: context.headlineMedium?.copyWith(
                      color: AppColors.kIconGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
              const Gap(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: SvgPicture.asset(AppImage.facebookIcon),
                      onPressed: () {
                        if (codeController.text.isEmpty) return;
                      }),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: SvgPicture.asset(AppImage.whatsappIcon),
                      onPressed: () {
                        if (codeController.text.isEmpty) return;
                      }),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: SvgPicture.asset(AppImage.instagramIcon),
                      onPressed: () {
                        if (codeController.text.isEmpty) return;
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionTypeSuffixIcon() =>
      const Icon(Icons.keyboard_arrow_down_outlined,
          color: AppColors.kSecondaryTextColor);

  void _submitData() {
    BottomSheets.showSheet(child: const PinConfirmationSheet()).then((value) {
      if (value != null) {
        final dto = _tag == _tags.first
            ? VoucherDto(
                code: codeController.text,
                transactionPin: value,
                email: beneficiaryController.text)
            : VoucherDto(
                code: codeController.text,
                transactionPin: value,
                tag: beneficiaryController.text);

        _vouchersNotifier.giftVoucher(dto, cancelToken: _cancelToken);
      }
    });
  }
}

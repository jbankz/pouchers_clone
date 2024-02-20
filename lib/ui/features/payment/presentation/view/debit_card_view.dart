import 'package:Pouchers/app/formatter/input_formatters.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/utilities/presentation/notifier/billers_notifier.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../app/core/router/page_router.dart';
import '../../../../../utils/field_validator.dart';
import '../../../../common/app_strings.dart';
import '../../../../widgets/edit_text_field_with.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../domain/dto/debit_card_dto.dart';
import 'debit_card_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'cardNumber'),
  FormTextField(name: 'expiry'),
  FormTextField(name: 'cvv')
])
class DebitCardView extends ConsumerStatefulWidget {
  const DebitCardView({super.key, this.amount});

  final String? amount;

  @override
  ConsumerState<DebitCardView> createState() => _DebitCardViewState();
}

class _DebitCardViewState extends ConsumerState<DebitCardView>
    with $DebitCardView {
  late BillersNotifier _billersNotifier;

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    cardNumberFocusNode.requestFocus();
    _billersNotifier = ref.read(billersNotifierProvider.notifier);
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) {
    final billerState = ref.watch(billersNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppString.payWithDebitCard)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    Text(AppString.cardDetails,
                        style: context.titleLarge
                            ?.copyWith(color: AppColors.kPrimaryTextColor)),
                    const Gap(height: 20),
                    EditTextFieldWidget(
                      title: AppString.cardNumber,
                      label: AppString.cardNumberInstruction,
                      controller: cardNumberController,
                      focusNode: cardNumberFocusNode,
                      keyboardType: TextInputType.number,
                      validator: FieldValidator.validateCreditCard(),
                      inputFormatters: [
                        context.digitsOnly,
                        context.limit(max: 16),
                        CardNumberInputFormatter()
                      ],
                    ),
                    const Gap(height: 35),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: EditTextFieldWidget(
                            title: AppString.cardExpiry,
                            label: AppString.cardExpiryInstruction,
                            controller: expiryController,
                            focusNode: expiryFocusNode,
                            keyboardType: TextInputType.number,
                            validator: FieldValidator.validateDate(),
                            inputFormatters: [
                              context.digitsOnly,
                              context.limit(max: 4),
                              CardMonthInputFormatter()
                            ],
                          ),
                        ),
                        const Gap(width: 19),
                        Expanded(
                          child: EditTextFieldWidget(
                            title: AppString.cardCVV,
                            label: AppString.cardCVVInstruction,
                            controller: cvvController,
                            focusNode: cvvFocusNode,
                            keyboardType: TextInputType.number,
                            validator: FieldValidator.validateCVV(),
                            inputFormatters: [
                              context.digitsOnly,
                              context.limit(max: 3)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButtonWidget(
                  title: 'Pay ${widget.amount}',
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;

                    _billersNotifier.submitCardForGuest(
                        mobileDto: billerState.mobileDto,
                        cancelToken: _cancelToken);
                    // PageRouter.pop(DebitCardDto(
                    //     cardNumber: cardNumberController.text,
                    //     expiry: expiryController.text,
                    //     cvv: cvvController.text));
                  }),
              const Gap(height: 7),
              Text(AppString.paga,
                  style: context.bodyLarge?.copyWith(
                      color: AppColors.kColorOrange,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700))
            ],
          ),
        ),
      ),
    );
  }
}

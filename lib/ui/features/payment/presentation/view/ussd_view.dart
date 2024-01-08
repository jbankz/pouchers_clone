import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/payment/domain/dto/debit_card_dto.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/attributes.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/hint_widget.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../utils/field_validator.dart';
import '../../../../common/app_strings.dart';
import '../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../widgets/edit_text_field_with.dart';
import '../../../../widgets/elevated_button_widget.dart';
import 'sheets/ussd_sheets.dart';
import 'ussd_view.form.dart';

@FormView(fields: [FormTextField(name: 'account')])
class UssdView extends StatefulWidget {
  const UssdView({super.key, this.amount});

  final String? amount;

  @override
  State<UssdView> createState() => _UssdViewState();
}

class _UssdViewState extends State<UssdView> with $UssdView {
  Attributes? _attribute;

  @override
  void initState() {
    accountFocusNode.requestFocus();
    super.initState();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppString.payWithUssd)),
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
                      const Gap(height: 41),
                      SvgPicture.asset(AppImage.ussd),
                      const Gap(height: 51),
                      Center(
                          child: Text(AppString.chooseBank,
                              style: context.headlineLarge?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.kPrimaryBlack))),
                      const Gap(height: 20),
                      EditTextFieldWidget(
                          titleWidget: const SizedBox.shrink(),
                          title: AppString.cardNumber,
                          label: AppString.selectBank,
                          controller: accountController,
                          focusNode: accountFocusNode,
                          keyboardType: TextInputType.text,
                          validator: FieldValidator.validateString(),
                          readOnly: true,
                          suffixIcon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.kSecondaryTextColor),
                          onTap: () async {
                            final response = await BottomSheets.showSheet(
                                child: const UssdSheets()) as Attributes?;
                            if (response != null) {
                              _attribute = response;
                              setState(() =>
                                  accountController.text = response.name ?? '');
                            }
                          }),
                      const Gap(height: 40),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        transitionBuilder: (child, primary) =>
                            SizeTransition(sizeFactor: primary, child: child),
                        child: _attribute == null
                            ? const SizedBox.shrink()
                            : Column(mainAxisSize: MainAxisSize.min, children: [
                                InkWell(
                                  onTap: () => AppHelper.triggerUrl(
                                      'tel://*901*000*340749339035#'),
                                  borderRadius: BorderRadius.circular(300.r),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 23.w, vertical: 11.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(300.r),
                                        color: AppColors.kBackgroundColor),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AppImage.call),
                                        const Gap(width: 10),
                                        Flexible(
                                          child: Text('*901*000*340749339035#',
                                              style: context.headlineLarge
                                                  ?.copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors
                                                          .kSecondaryPurple,
                                                      letterSpacing: 2.w),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Gap(height: 17),
                                Center(
                                  child: Text(AppString.tapToDial,
                                      style: context.headlineLarge?.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.kIconGrey)),
                                ),
                                const Gap(height: 39),
                                HintWidget(hint: AppString.tapToDial1),
                                const Gap(height: 20),
                                HintWidget(hint: AppString.tapToDial2),
                              ]),
                      )
                    ],
                  ),
                ),
                ElevatedButtonWidget(
                    title: 'I have paid ${widget.amount}',
                    onPressed: () {
                      if (!formKey.currentState!.validate()) return;

                      PageRouter.pop(DebitCardDto(bank: _attribute?.name));
                    }),
              ],
            ),
          ),
        ),
      );
}

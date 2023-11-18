import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../../utils/field_validator.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/edit_text_field_with.dart';
import 'bvn_view.form.dart';
import 'widget/bvn_modal.dart';

@FormView(fields: [FormTextField(name: 'bvn')])
class BvnView extends StatefulWidget {
  const BvnView({super.key});

  @override
  State<BvnView> createState() => _BvnViewState();
}

class _BvnViewState extends State<BvnView> with $BvnView {
  final _formKey = GlobalKey<FormState>();
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    bvnFocusNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppString.bvn)),
        body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: AppColors.kLightOrange100,
                              borderRadius: BorderRadius.circular(8.r),
                              border:
                                  Border.all(color: AppColors.kLightOrange200)),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppImage.exclamation),
                              const Gap(width: 7),
                              Flexible(
                                child: Text(AppString.bvnHint1,
                                    style: context.titleLarge?.copyWith(
                                        color: AppColors.kLightOrange300,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                        ),
                        const Gap(height: 36),
                        EditTextFieldWidget(
                            // readOnly: true,
                            title: AppString.bvn,
                            label: AppString.bvnInst,
                            controller: bvnController,
                            focusNode: bvnFocusNode,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              context.limit(),
                              context.digitsOnly
                            ],
                            validator: FieldValidator.validateInt(),
                            textInputAction: TextInputAction.go,
                            onFieldSubmitted: (_) {}),
                      ],
                    ),
                  ),
                  ElevatedButtonWidget(
                      title: AppString.verifyBVN, onPressed: () {}),
                  const Gap(height: 27),
                  InkWell(
                    onTap: () =>
                        BottomSheets.showAlertDialog(child: const BvnModal()),
                    child: Text(AppString.bvnReminder,
                        style: context.displayMedium
                            ?.copyWith(fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            )),
      );
}

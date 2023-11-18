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

import '../../../../../../../app/core/theme/light_theme.dart';
import '../../../../../../../utils/field_validator.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/edit_text_field_with.dart';
import 'id_view.form.dart';
import 'widget/id_type_widget.dart';

@FormView(fields: [FormTextField(name: 'id')])
class IdView extends StatefulWidget {
  const IdView({super.key});

  @override
  State<IdView> createState() => _IdViewState();
}

class _IdViewState extends State<IdView> with $IdView {
  final _formKey = GlobalKey<FormState>();
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppString.id)),
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
                        Text(AppString.validIdInst,
                            style: context.titleLarge?.copyWith(fontSize: 14)),
                        const Gap(height: 31),
                        EditTextFieldWidget(
                          readOnly: true,
                          title: AppString.verificationType,
                          label: AppString.idDropdownInst,
                          suffixIcon:
                              const Icon(Icons.keyboard_arrow_down_rounded),
                          validator: FieldValidator.validateString(),
                          onTap: () => BottomSheets.showSheet(
                              child: const IdTypesWidget()),
                        ),
                        const Gap(height: 30),
                        EditTextFieldWidget(
                            // readOnly: true,
                            title: AppString.idNum,
                            label: AppString.idInst,
                            controller: idController,
                            focusNode: idFocusNode,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              context.limit(),
                              context.digitsOnly
                            ],
                            validator: FieldValidator.validateInt(),
                            textInputAction: TextInputAction.go,
                            onFieldSubmitted: (_) {}),
                        const Gap(height: 80),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 700),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
                                  opacity: animation,
                                  child: SizeTransition(
                                      sizeFactor: animation, child: child)),
                          child: 2 < 2
                              ? const SizedBox.shrink()
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(AppString.howToGetVNIN,
                                        style: kHeadline1TextStyle.copyWith(
                                            fontSize: 16)),
                                    const Gap(height: 28),
                                    _buildHints(
                                        context, AppString.howToGetNIN1),
                                    const Gap(height: 20),
                                    _buildHints(
                                        context, AppString.howToGetNIN2),
                                    const Gap(height: 20),
                                    _buildHints(
                                        context, AppString.howToGetNIN3),
                                    const Gap(height: 20),
                                    _buildHints(
                                        context, AppString.howToGetNIN4),
                                    const Gap(height: 20),
                                  ],
                                ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButtonWidget(
                      title: AppString.verify, onPressed: () {}),
                ],
              ),
            )),
      );

  Row _buildHints(BuildContext context, String hint) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppImage.comment),
          const Gap(width: 15),
          Flexible(
              child: Text(hint,
                  style: context.titleLarge?.copyWith(
                      color: AppColors.kIconGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)))
        ],
      );
}

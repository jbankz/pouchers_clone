import 'package:Pouchers/app/config/app_logger.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/domain/enum/id_enum.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../../app/core/theme/light_theme.dart';
import '../../../../../../../utils/field_validator.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/edit_text_field_with.dart';
import '../../../../../../widgets/hint_widget.dart';
import '../../../../domain/model/idenitification_type.dart';
import 'id_view.form.dart';
import 'widget/id_type_widget.dart';

@FormView(fields: [FormTextField(name: 'type'), FormTextField(name: 'id')])
class IdView extends ConsumerStatefulWidget {
  const IdView({super.key});

  @override
  ConsumerState<IdView> createState() => _IdViewState();
}

class _IdViewState extends ConsumerState<IdView> with $IdView {
  final _formKey = GlobalKey<FormState>();
  final CancelToken _cancelToken = CancelToken();
  late UserNotifier _userNotifier;
  IdentificationType? _identificationType;

  bool get _isAlphaNumericValidation =>
      (_identificationType?.idTypes == IdTypes.driver ||
          _identificationType?.idTypes == IdTypes.voters ||
          _identificationType?.idTypes == IdTypes.passport);

  @override
  void initState() {
    super.initState();
    _userNotifier = ref.read(userNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(userNotifierProvider);
    return Scaffold(
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
                        controller: typeController,
                        suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.kIconGrey),
                        validator: FieldValidator.validateString(),
                        onTap: () async {
                          _identificationType = await BottomSheets.showSheet(
                                  child: const IdTypesWidget())
                              as IdentificationType?;

                          typeController.text = _identificationType?.key ?? '';
                          setState(() {});
                        },
                      ),
                      const Gap(height: 30),
                      EditTextFieldWidget(
                          readOnly: appState.isBusy,
                          title: AppString.idNum,
                          label: AppString.idInst,
                          controller: idController,
                          focusNode: idFocusNode,
                          keyboardType: _isAlphaNumericValidation
                              ? TextInputType.text
                              : TextInputType.number,
                          inputFormatters: [
                            if (!_isAlphaNumericValidation) context.limit(),
                            if (!_isAlphaNumericValidation) context.digitsOnly
                          ],
                          validator: _isAlphaNumericValidation
                              ? FieldValidator.validateString()
                              : FieldValidator.validateInt(),
                          textInputAction: TextInputAction.go,
                          onFieldSubmitted: (_) => _triggerDojah),
                      const Gap(height: 30),
                      InkWell(
                        borderRadius: BorderRadius.circular(10.r),
                        onTap: _triggerDojah,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border:
                                  Border.all(color: kLightPurple, width: 1.w)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(AppImage.uploadIcon),
                              const Gap(width: 10),
                              Flexible(
                                child: Text(AppString.uploadId,
                                    style: context.displayMedium
                                        ?.copyWith(fontSize: 14)),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Gap(height: 80),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 700),
                        transitionBuilder: (child, animation) => FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                                sizeFactor: animation, child: child)),
                        child: _identificationType?.idTypes != IdTypes.vnin
                            ? const SizedBox.shrink()
                            : Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(AppString.howToGetVNIN,
                                      style: kHeadline1TextStyle.copyWith(
                                          fontSize: 16)),
                                  const Gap(height: 28),
                                  HintWidget(hint: AppString.howToGetNIN1),
                                  const Gap(height: 20),
                                  HintWidget(hint: AppString.howToGetNIN2),
                                  const Gap(height: 20),
                                  HintWidget(hint: AppString.howToGetNIN3),
                                  const Gap(height: 20),
                                  HintWidget(hint: AppString.howToGetNIN4),
                                  const Gap(height: 20),
                                ],
                              ),
                      )
                    ],
                  ),
                ),
                ElevatedButtonWidget(
                    loading: appState.isBusy,
                    title: AppString.verify,
                    onPressed: null
                    // onPressed: _submit

                    )
              ],
            ),
          )),
    );
  }

  void _submit(Dojah dojah) {
    if (!_formKey.currentState!.validate()) return;

    _userNotifier.validateID(
        UserDto(
            idType: _identificationType?.value,
            isUploadId: true,
            idNumber: idController.text,
            dojah: dojah),
        _cancelToken);
  }

  Future<void> _triggerDojah() async {
    // if (!_formKey.currentState!.validate()) return;

    await _userNotifier.triggerDojah(
        identificationType: _identificationType,
        onSuccess: (success) {
          final response =
              ((success as List<dynamic>).first as Map<String, dynamic>)['data']
                      ?['government-data']?['data']?['entity'] ??
                  {};

          // final mapped =
          //     response['data']?['government-data']?['data']?['entity'] ?? {};
          _submit(Dojah.fromJson(response));
        });
  }
}

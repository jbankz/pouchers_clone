import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../../utils/field_validator.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/edit_text_field_with.dart';
import '../../../notifier/user_notifier.dart';
import 'bvn_view.form.dart';
import 'widget/bvn_modal.dart';

@FormView(fields: [FormTextField(name: 'bvn')])
class BvnView extends ConsumerStatefulWidget {
  const BvnView({super.key, required this.routeName});

  final String routeName;

  @override
  ConsumerState<BvnView> createState() => _BvnViewState();
}

class _BvnViewState extends ConsumerState<BvnView> with $BvnView {
  final _formKey = GlobalKey<FormState>();
  final CancelToken _cancelToken = CancelToken();

  late UserNotifier _userNotifier;

  @override
  void initState() {
    super.initState();
    bvnFocusNode.requestFocus();
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
                          readOnly: appState.isBusy,
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
                          onFieldSubmitted: (_) => _submit()),
                    ],
                  ),
                ),
                ElevatedButtonWidget(
                    loading: appState.isBusy,
                    title: AppString.verifyBVN,
                    onPressed: _submit),
                const Gap(height: 27),
                InkWell(
                  onTap: () => appState.isBusy
                      ? null
                      : BottomSheets.showAlertDialog(child: const BvnModal()),
                  child: Text(AppString.bvnReminder,
                      style: context.displayMedium
                          ?.copyWith(fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          )),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    _userNotifier.validateBVN(UserDto(bvn: bvnController.text),
        cancelToken: _cancelToken, route: widget.routeName);
  }
}

import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:Pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../common/app_strings.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import '../../notifier/auth_notifier.dart';
import 'tag_view.form.dart';

@FormView(fields: [FormTextField(name: 'tag')])
class TagView extends ConsumerStatefulWidget {
  const TagView({super.key});

  @override
  ConsumerState<TagView> createState() => _TagViewState();
}

class _TagViewState extends ConsumerState<TagView> with $TagView {
  final formKey = GlobalKey<FormState>();

  late AuthNotifier _authNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    tagFocusNode.requestFocus();
    _authNotifier = ref.read(authNotifierProvider.notifier);
    super.initState();
  }

  @override
  void dispose() {
    disposeForm();
    _cancelToken.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    Text(AppString.poucherTag,
                        style: context.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 24.sp)),
                    const Gap(height: 8),
                    Text(AppString.tagHint,
                        style: context.titleLarge?.copyWith(fontSize: 16)),
                    EditTextFieldWidget(
                        readOnly: appState.isBusy,
                        controller: tagController,
                        focusNode: tagFocusNode,
                        keyboardType: TextInputType.text,
                        prefix: Text('@ ',
                            style: context.titleLarge
                                ?.copyWith(color: AppColors.kPrimaryTextColor)),
                        validator: FieldValidator.validateString(),
                        onFieldSubmitted: (_) {}),
                  ],
                ),
              ),
              ElevatedButtonWidget(
                  title: AppString.createTag,
                  loading: appState.isBusy,
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;
                    _authNotifier.createTag(
                        AuthDto(tag: tagController.text), _cancelToken);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:pouchers/app/app.router.dart';
import 'package:pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../utils/field_validator.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/edit_text_field_with.dart';
import '../../../../../widgets/elevated_button_widget.dart';
import '../../../../../widgets/gap.dart';
import '../../../domain/dto/two_fa_dto.dart';
import '../../../domain/model/security_questions.dart';
import 'second_security_question_view.form.dart';
import 'sheets/questions_options_sheet.dart';

@FormView(
    fields: [FormTextField(name: 'question'), FormTextField(name: 'answer')])
class SecondSecurityQuestionView extends ConsumerStatefulWidget {
  const SecondSecurityQuestionView({super.key});

  @override
  ConsumerState<SecondSecurityQuestionView> createState() =>
      _SecondSecurityQuestionViewState();
}

class _SecondSecurityQuestionViewState
    extends ConsumerState<SecondSecurityQuestionView>
    with $SecondSecurityQuestionView {
  final formKey = GlobalKey<FormState>();

  late AuthNotifier _authNotifier;

  final CancelToken _cancelToken = CancelToken();

  SecurityQuestions? _securityQuestion;

  @override
  void initState() {
    _authNotifier = ref.read(authNotifierProvider.notifier);
    super.initState();
  }

  @override
  void dispose() {
    _cancelToken.cancel();
    disposeForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppString.authentication)),
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
                    Text(AppString.selectSecurityQue,
                        style: context.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: AppColors.kPrimaryTextColor)),
                    const Gap(height: 8),
                    Text(AppString.selectSecurityQueInstr,
                        style: context.titleLarge?.copyWith(fontSize: 16)),
                    const Gap(height: 29),
                    EditTextFieldWidget(
                      readOnly: true,
                      title: AppString.secondQuestion,
                      label: AppString.selectSecondQuestion,
                      titleStyle: context.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.kPrimaryTextColor),
                      controller: questionController,
                      focusNode: questionFocusNode,
                      keyboardType: TextInputType.text,
                      validator: FieldValidator.validateString(),
                      suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined,
                          color: AppColors.kSecondaryTextColor),
                      onTap: () {
                        BottomSheets.showSheet(
                                child: const QuestionsOptionsSheet())
                            .then((question) {
                          if (question != null) {
                            questionController.text = question.question ?? '';
                            _securityQuestion = question;
                            setState(() {});
                            context.nextFocus(answerFocusNode);
                          }
                        });
                      },
                    ),
                    const Gap(height: 20),
                    EditTextFieldWidget(
                        title: AppString.answer,
                        readOnly: appState.isBusy,
                        controller: answerController,
                        focusNode: answerFocusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        validator: FieldValidator.validateString(),
                        onFieldSubmitted: (_) => _submitForm())
                  ],
                ),
              ),
              const Gap(height: 28),
              ElevatedButtonWidget(
                  title: AppString.proceed,
                  loading: appState.isBusy,
                  onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!formKey.currentState!.validate()) return;

    _authNotifier.answerQuestion(
        twoFaDto: TwoFaDto(
            questionId: _securityQuestion?.id, answer: answerController.text),
        cancelToken: _cancelToken,
        route: Routes.twoFaGoogleAuthenticatorView);
  }
}

import 'package:Pouchers/app/core/manager/intercom_manager.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:Pouchers/ui/features/authentication/domain/dto/two_fa_dto.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/ui/features/authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/edit_text_field_with.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:Pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

import 'selected_question_view.form.dart';

@FormView(fields: [FormTextField(name: 'answer')])
class SelectedQuestionView extends ConsumerStatefulWidget {
  const SelectedQuestionView({super.key});

  @override
  ConsumerState<SelectedQuestionView> createState() =>
      _SelectedQuestionViewState();
}

class _SelectedQuestionViewState extends ConsumerState<SelectedQuestionView>
    with $SelectedQuestionView {
  late AuthNotifier _authNotifier;
  final CancelToken _cancelToken = CancelToken();
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        _authNotifier = ref.read(authNotifierProvider.notifier)
          ..selectedQuestions(cancelToken: _cancelToken));
  }

  @override
  void dispose() {
    super.dispose();
    disposeForm();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppString.authentication)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                  child: ListView(children: [
                Text(
                  AppString.answerTheQuestion,
                  style: context.headlineMedium
                      ?.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const Gap(height: 10),
                RichText(
                  text: TextSpan(
                    text: AppString.cantRemember,
                    style: context.headlineLarge?.copyWith(
                        color: AppColors.kIconGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: AppString.contactSupport,
                          style: context.headlineLarge?.copyWith(
                              color: AppColors.kPrimaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => IntercomManager.displayMessenger())
                    ],
                  ),
                ),
                const Gap(height: 30),
                SizedBox(
                  height: 144.h,
                  child: PageView.builder(
                      itemCount: authState.selectedQuestions.length,
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) =>
                          setState(() => _pageIndex = index),
                      itemBuilder: (_, index) {
                        final selectedQue = authState.selectedQuestions[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Question ${index + 1}',
                                style: context.headlineMedium?.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.w700)),
                            const Gap(height: 20),
                            EditTextFieldWidget(
                                controller: answerController,
                                focusNode: answerFocusNode,
                                title: selectedQue.question,
                                validator: FieldValidator.validateString(),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (value) => _submit())
                          ],
                        );
                      }),
                ),
              ])),
              ElevatedButtonWidget(
                  loading: authState.isBusy,
                  title: AppString.confirm,
                  onPressed: _submit)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final questions = ref.watch(authNotifierProvider).selectedQuestions;

    final verifiedPin = await BottomSheets.showSheet(
        child: const PinConfirmationSheet(validatePinHere: true)) as String?;
    if (verifiedPin != null) {
      final String questionId = questions[_pageIndex].questionId ?? '';

      _authNotifier.validate2fa(
          TwoFaDto(questionId: questionId, answer: answerController.text),
          cancelToken: _cancelToken, success: () {
        if ((_pageIndex + 1) == questions.length) {
          // userDao.save(userDao.user.copyWith(is2faActive: false));
          // PageRouter.pop();
          _authNotifier.disable2fa(AuthDto(transactionPin: verifiedPin),
              cancelToken: _cancelToken);
          return;
        }

        _pageIndex++;
        answerController.text = '';
        answerFocusNode.requestFocus();

        _pageController.animateToPage(_pageIndex,
            duration: const Duration(milliseconds: 250), curve: Curves.linear);
      });
    }
  }
}

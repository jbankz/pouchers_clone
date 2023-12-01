import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/widgets/edit_text_field_with.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:Pouchers/utils/field_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _authNotifier = ref.read(authNotifierProvider.notifier)
        ..selectedQuestions(_cancelToken);
    });
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
        child: Column(
          children: [
            Expanded(
                child: ListView(children: [
              Text(
                'Answer the security questions',
                style: context.headlineMedium
                    ?.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const Gap(height: 10),
              RichText(
                text: TextSpan(
                  text: "Can’t remember the answers? ",
                  style: context.headlineLarge?.copyWith(
                      color: AppColors.kIconGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                        text: "contact support",
                        style: context.headlineLarge?.copyWith(
                            color: AppColors.kPrimaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              const Gap(height: 30),
              SizedBox(
                height: 144.h,
                child: PageView.builder(
                    itemCount: authState.selectedQuestions.length,
                    controller: _pageController,
                    onPageChanged: (index) =>
                        setState(() => _pageIndex = index),
                    itemBuilder: (_, index) {
                      final selectedQue = authState.selectedQuestions[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Question ${index + 1}',
                            style: context.headlineMedium?.copyWith(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          const Gap(height: 20),
                          EditTextFieldWidget(
                              controller: answerController,
                              focusNode: answerFocusNode,
                              title: selectedQue.question,
                              validator: FieldValidator.validateString(),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {})
                        ],
                      );
                    }),
              ),
            ])),
            ElevatedButtonWidget(
                loading: authState.isBusy,
                title: AppString.confirm,
                onPressed: () {
                  _pageController.animateToPage(_pageIndex++,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.linear);
                })
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/account/models/security_question.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/tab_layout/two_fa_modal.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class DisableAuthQuestion2 extends ConsumerStatefulWidget {
  static const String routeName = "disableAuthQuestion2";
  final SelectedQuestionResponseData? questionData;

  const DisableAuthQuestion2({Key? key, this.questionData}) : super(key: key);

  @override
  ConsumerState<DisableAuthQuestion2> createState() =>
      _DisableAuthQuestion2State();
}

class _DisableAuthQuestion2State extends ConsumerState<DisableAuthQuestion2> {
  TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: factorAuth,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    answerQuestion,
                    style: textTheme.headline1!.copyWith(
                      fontFamily: "DMSans",
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Can’t remember the answers? ",
                      style: textTheme.headline4!.copyWith(color: kIconGrey),
                      children: [
                        TextSpan(
                            text: "contact support",
                            style: textTheme.headline3!.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Text(
                    "2. ${widget.questionData!.question}",
                    style: textTheme.bodyText1!.copyWith(
                      color: kIconGrey,
                    ),
                  ),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  TextInputNoIcon(
                    textTheme: textTheme,
                    widget: SizedBox(),
                    hintText: enterAnswer,
                    controller: answerController,
                  ),
                ],
              ),
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(set2QuestionProvider,
                  (previous, NotifierState<String> next) {
                if (next.status == NotifierStatus.done) {
                  buildShowModalBottomSheet(
                    context,
                    TwoFactorPinModal(
                      isDisable: true,
                    ),
                  );
                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message!);
                }
              });
              var _widget = LargeButton(
                title: confirm,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (answerController.text.isNotEmpty) {
                    ref.read(set2QuestionProvider.notifier).setSecurityQuestion(
                        questionId: widget.questionData!.questionId!,
                        answer: answerController.text,
                        isValidate: true);
                  } else {
                    showErrorBar(context, emptyField);
                  }
                },
              );
              return ref.watch(set2QuestionProvider).when(
                  done: (done) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget);
            })
          ],
        ));
  }
}

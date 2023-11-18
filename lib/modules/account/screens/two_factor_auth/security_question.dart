import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/security_question.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/question_modal.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/second_security_question.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/security_modal.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class SecurityQuestion extends ConsumerStatefulWidget {
  static const String routeName = "securityQuestion";

  const SecurityQuestion({Key? key}) : super(key: key);

  @override
  ConsumerState<SecurityQuestion> createState() => _SecurityQuestionState();
}

class _SecurityQuestionState extends ConsumerState<SecurityQuestion> {
  SecurityQuestionData _prefixText =
      SecurityQuestionData(question: selectQuestion);
  List<SecurityQuestionData> questionData = [];
  TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) => showDialog(
        context: context,
        builder: (ctx) {
          return SecurityModal(
            textTheme: Theme.of(context).textTheme,
            title: securityQuestionNote,
            message: securityQuestionNoteSub,
            button: understand,
          );
        }));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getSecurityQuestionsProvider.notifier).getSecurityQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: factorAuth,
      child: ListenerPage(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    securityQuestion,
                    style: textTheme.headline1!.copyWith(
                      fontFamily: "DMSans",
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    securityQuestionSub,
                    style: textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Text(
                    firstQuestion,
                    style: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: kSmallPadding,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: kRegularPadding, vertical: kRegularPadding),
                    decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(kSmallPadding)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            _prefixText.question!,
                            style:
                                textTheme.subtitle1!.copyWith(color: kIconGrey),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Consumer(
                          builder: (context, ref, _) {
                            ref.listen(getSecurityQuestionsProvider, (previous,
                                NotifierState<SecurityQuestionResponse> next) {
                              if (next.status == NotifierStatus.done) {
                                next.data!.data!.forEach((element) {
                                  questionData.add(element);
                                });
                              }
                            });
                            var _widget = inkWell(
                                onTap: () async {
                                  final result =
                                      await buildShowModalBottomSheet(
                                          context,
                                          QuestionModal(
                                            question: questionData,
                                          ));
                                  if (result != null) {
                                    setState(() => _prefixText = result);
                                  }
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                  color: kSecondaryTextColor,
                                ));
                            return ref.watch(getSecurityQuestionsProvider).when(
                                  done: (done) => _widget,
                                  loading: () => SpinKitDemo(
                                    size: 35,
                                  ),
                                  error: (val) => _widget,
                                );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  TextInputNoIcon(
                    textTheme: textTheme,
                    text: answer,
                    controller: answerController,
                    hintText: enterAnswer,
                  ),
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, _) {
                ref.listen(setQuestionProvider,
                    (previous, NotifierState<String> next) async {
                  await Hive.openBox(k2FACodeBox);
                  if (next.status == NotifierStatus.done) {
                    Hive.box(k2FACodeBox).put(kSetQuestion, 1);
                    ref.read(calculateQuestionProvider.notifier).state =
                        Hive.box(k2FACodeBox).get(kSetQuestion);
                    print("security2 ${ref.watch(calculateQuestionProvider)}");
                    pushTo(
                      context,
                      SecondSecurityQuestion(),
                      settings: const RouteSettings(
                          name: SecondSecurityQuestion.routeName),
                    );
                  } else if (next.status == NotifierStatus.error) {
                    showErrorBar(context, next.message!);
                  }
                });
                var _widget = LargeButton(
                  title: continueText,
                  onPressed: () {
                    print("security1 ${ref.watch(calculateQuestionProvider)}");
                    FocusScope.of(context).unfocus();
                    if (_prefixText.id != null &&
                        answerController.text.isNotEmpty) {
                      ref
                          .read(setQuestionProvider.notifier)
                          .setSecurityQuestion(
                              questionId: _prefixText.id!,
                              answer: answerController.text,
                              isValidate: false);
                    } else {
                      showErrorBar(context, emptyField);
                    }
                  },
                );
                return ref.watch(setQuestionProvider).when(
                    done: (done) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget);
              },
            )
          ],
        ),
      ),
    );
  }
}

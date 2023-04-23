import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/security_question.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/account_settings/account_settings.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/disable_auth_question2.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class DisableAuthQuestion extends ConsumerStatefulWidget {
  static const String routeName = "disableAuthQuestion";

  const DisableAuthQuestion({Key? key}) : super(key: key);

  @override
  ConsumerState<DisableAuthQuestion> createState() =>
      _DisableAuthQuestionState();
}

class _DisableAuthQuestionState extends ConsumerState<DisableAuthQuestion> {
  List<SelectedQuestionResponseData>? data;
  TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getSelectedQuestionsProvider.notifier).getSelectedQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, (route) => route.settings.name == AccountSettings.routeName);
        return true;
      },
      child: InitialPage(
          title: factorAuth,
          onTap: (){
            Navigator.popUntil(context, (route) => route.settings.name == AccountSettings.routeName);
          },
          child: ListenerPage(
        child:  ref.watch(getSelectedQuestionsProvider).when(
              loading: () => SpinKitDemo(),
              error: (val) => SizedBox(),
              done: (done) => Column(
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
                                style: textTheme.headline4!
                                    .copyWith(color: kIconGrey),
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
                              "1. ${done!.data![0].question}",
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
                        ref.listen(setQuestionProvider,
                            (previous, NotifierState<String> next) {
                          if (next.status == NotifierStatus.done) {
                            pushTo(
                              context,
                              DisableAuthQuestion2(
                                questionData: done.data!.last,
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
                              ref
                                  .read(setQuestionProvider.notifier)
                                  .setSecurityQuestion(
                                      questionId: done.data![0].questionId!,
                                      answer: answerController.text,
                                      isValidate: true);
                            } else {
                              showErrorBar(context, emptyField);
                            }
                          },
                        );
                        return ref.watch(setQuestionProvider).when(
                            done: (done) => _widget,
                            loading: () => SpinKitDemo(),
                            error: (val) => _widget);
                      })
                    ],
                  ))),
      ));
  }
}

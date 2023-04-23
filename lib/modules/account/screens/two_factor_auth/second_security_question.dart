import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/security_question.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/google_authenticator_download.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/question_modal.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/two_factor.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class SecondSecurityQuestion extends ConsumerStatefulWidget {
  static const String routeName = "secondSecurityQuestion";

  const SecondSecurityQuestion({Key? key,}) : super(key: key);

  @override
  ConsumerState<SecondSecurityQuestion> createState() => _SecondSecurityQuestionState();
}

class _SecondSecurityQuestionState extends ConsumerState<SecondSecurityQuestion> {
  SecurityQuestionData _prefixText2 = SecurityQuestionData(question: selectQuestion);
  TextEditingController answerController = TextEditingController();
  List<SecurityQuestionData> questionData = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getSecurityQuestionsProvider.notifier).getSecurityQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: factorAuth,
        onTap: (){
          Navigator.popUntil(context, (route) => route.settings.name == TwoFactor.routeName);
        },
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
                      secondQuestion,
                      style: textTheme.subtitle1!.copyWith( fontWeight: FontWeight.w700,),
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
                              _prefixText2.question!,
                              style: textTheme.subtitle1,
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
                                    final result = await buildShowModalBottomSheet(
                                        context,
                                        QuestionModal(
                                          question: questionData,
                                        ));
                                    if (result != null) {
                                      setState(() => _prefixText2 = result);
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kMediumPadding,
                    ),
                    TextInputNoIcon(
                      textTheme: textTheme,
                      text: answer,
                      hintText: enterAnswer,
                      controller: answerController,
                    ),
                  ],
                ),
              ),
              Consumer(builder: (context, ref, _) {
                ref.listen(set2QuestionProvider,
                        (previous, NotifierState<String> next) async{
                          await Hive.openBox(k2FACodeBox);
                      if (next.status == NotifierStatus.done) {
                        pushTo(context, GoogleAuthenticatorDownload(),
                            settings: const RouteSettings(
                                name: GoogleAuthenticatorDownload.routeName));
                      } else if (next.status == NotifierStatus.error) {
                        showErrorBar(context, next.message!);
                      }
                    });
                var _widget = LargeButton(
                  title: continueText,
                  onPressed: () {
                    // ref.read(calculateQuestionProvider.notifier).state = 2;
                    // print( ref.watch(calculateQuestionProvider));
                    print("security numbe2r ${ref.watch(calculateQuestionProvider)}");
                    FocusScope.of(context).unfocus();
                    if (_prefixText2.id != null && answerController.text.isNotEmpty) {
                      ref.read(set2QuestionProvider.notifier).setSecurityQuestion(
                        questionId: _prefixText2.id!,
                        answer: answerController.text,
                          isValidate: false
                      );
                    }else{
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
          ),
        ));
  }
}

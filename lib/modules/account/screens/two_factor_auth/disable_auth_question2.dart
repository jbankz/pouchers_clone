import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/common/listener.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/account/models/security_question.dart';
import 'package:pouchers/modules/account/models/ui_models_class.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/account/screens/account_settings/account_settings.dart';
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
        child: ListenerPage(
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
                ref.listen(
                  disable2FAProvider,
                  (previous, NotifierState<bool> next) {
                    if (next.status == NotifierStatus.done) {
                      Hive.deleteBoxFromDisk(k2FACodeBox);
                      ref.read(authFactorProvider.notifier).state = next.data!;
                      Navigator.popUntil(
                          context,
                          (route) =>
                              route.settings.name == AccountSettings.routeName);
                    } else if (next.status == NotifierStatus.error) {
                      showErrorBar(
                          context, next.message ?? "Error Disabling 2FA");
                    }
                  },
                );
                var _widget = Consumer(builder: (context, ref, _) {
                  ref.listen(set2QuestionProvider,
                      (previous, NotifierState<String> next) async {
                    if (next.status == NotifierStatus.done) {
                      final result = await buildShowModalBottomSheet(
                        context,
                        TransactionPinContainer(
                          isData: false,
                          isCard: false,
                          isFundCard: false,
                        ),
                      );
                      if (result != null) {
                        ref
                            .read(disable2FAProvider.notifier)
                            .disable2FA(transactionPin: result);
                      }
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
                            .read(set2QuestionProvider.notifier)
                            .setSecurityQuestion(
                              questionId: widget.questionData!.questionId!,
                              answer: answerController.text,
                              isValidate: true,
                            );
                      } else {
                        showErrorBar(context, emptyField);
                      }
                    },
                  );
                  return ref.watch(set2QuestionProvider).when(
                      done: (done) => _widget,
                      loading: () => SpinKitDemo(),
                      error: (val) => _widget);
                });
                return ref.watch(disable2FAProvider).when(
                      done: (done) => _widget,
                      loading: () => SpinKitDemo(),
                      error: (val) => _widget,
                    );
              })
            ],
          ),
        ));
  }
}

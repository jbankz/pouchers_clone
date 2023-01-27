import 'package:flutter/material.dart';
import 'package:pouchers/modules/tab_layout/models/security_question.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/widgets.dart';

class QuestionModal extends StatefulWidget {

 final List<SecurityQuestionData> question;

  const QuestionModal({
    Key? key,
    required this.question
  }) : super(key: key);

  @override
  State<QuestionModal> createState() => _QuestionModalState();
}

class _QuestionModalState extends State<QuestionModal> {
  SecurityQuestionData? _prefixText;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.7,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kMicroPadding),
                topRight: Radius.circular(kMicroPadding),
              ),
              color: kPrimaryWhite),
          child: ListView(
            controller: controller,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: kMacroPadding,
                  height: 5,
                  decoration: BoxDecoration(
                    color: kPurpleColor200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              ...widget.question.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: kRegularPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: kMediumPadding),
                        child: inkWell(
                          onTap: () {
                            setState(() => _prefixText = e);
                            Navigator.pop(context, _prefixText);
                          },
                          child: Text(
                            e.question!,
                            style: textTheme.headline4,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSmallPadding,
                      ),
                      Divider(
                        color: kLightPurple,
                        thickness: 1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class QuestionStringModal extends StatefulWidget {

  final List<String> question;

  const QuestionStringModal({
    Key? key,
    required this.question
  }) : super(key: key);

  @override
  State<QuestionStringModal> createState() => _QuestionStringModalState();
}

class _QuestionStringModalState extends State<QuestionStringModal> {
  String _prefixText = "";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.42,
        maxChildSize: 0.42,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kMicroPadding),
                topRight: Radius.circular(kMicroPadding),
              ),
              color: kPrimaryWhite),
          child: ListView(
            controller: controller,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: kMacroPadding,
                  height: 5,
                  decoration: BoxDecoration(
                    color: kPurpleColor200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              ...widget.question.map(
                    (e) => Padding(
                  padding: const EdgeInsets.only(bottom: kRegularPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: kMediumPadding),
                        child: inkWell(
                          onTap: () {
                            setState(() => _prefixText = e);
                            Navigator.pop(context, _prefixText);
                          },
                          child: Text(
                            e,
                            style: textTheme.headline4,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSmallPadding,
                      ),
                      Divider(
                        color: kLightPurple,
                        thickness: 1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

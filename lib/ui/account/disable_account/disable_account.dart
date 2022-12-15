import 'package:flutter/material.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/account/disable_account/disable_account_confirmation.dart';
import 'package:pouchers/ui/account/two_factor_auth/question_modal.dart';
import 'package:pouchers/ui/tab_layout/models/question_model.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class DisableAccount extends StatefulWidget {
  static const String routeName = "disableAccount";

  DisableAccount({Key? key}) : super(key: key);

  @override
  State<DisableAccount> createState() => _DisableAccountState();
}

class _DisableAccountState extends State<DisableAccount> {
  String _prefixText = selectReason;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: disableAccountText,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    disableAccountSub,
                    style: textTheme.headline1!.copyWith(
                      fontFamily: "DMSans",
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: kRegularPadding, vertical: kRegularPadding),
                    decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(kSmallPadding)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _prefixText,
                            style: textTheme.subtitle1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        inkWell(
                            onTap: () async {
                              final result = await buildShowModalBottomSheet(
                                  context,
                                  QuestionStringModal(
                                    question: reason,
                                  ));
                              if (result != null) {
                                setState(() => _prefixText = result);
                              }
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                              color: kSecondaryTextColor,
                            )),
                      ],
                    ),
                  ),
                  _prefixText == "Others"
                      ? Column(
                          children: [
                            SizedBox(
                              height: kLargePadding,
                            ),
                            TextInputNoIcon(
                              textTheme: textTheme,
                              text: tellWhy,
                              maxLine: 10,
                            )
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ),
            LargeButton(
              title: disableAccountText,
              disableColor:
                  _prefixText == selectReason ? kPurpleColor100 : kPrimaryColor,
              onPressed: _prefixText == selectReason
                  ? () {}
                  : () {
                      pushTo(
                        context,
                        DisableConfirm(reason: _prefixText),
                        settings:
                            const RouteSettings(name: DisableConfirm.routeName),
                      );
                    },
            )
          ],
        ));
  }
}

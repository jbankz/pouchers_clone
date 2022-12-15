import 'package:flutter/material.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/account/delete_account/delete_account_confirmation.dart';
import 'package:pouchers/ui/account/disable_account/disable_account_confirmation.dart';
import 'package:pouchers/ui/account/two_factor_auth/question_modal.dart';
import 'package:pouchers/ui/tab_layout/models/question_model.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class DeleteAccount extends StatefulWidget {
  static const String routeName = "deleteAccount";

  DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  String _prefixText = selectReason;
  TextEditingController othersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: deleteAccountText,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    deleteAccountTextSub,
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
                            style: textTheme.bodyText1!.copyWith(
                              color: kIconGrey,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        inkWell(
                          onTap: () async {
                            final result = await buildShowModalBottomSheet(
                              context,
                              QuestionStringModal(
                                question: deleteQuestion,
                              ),
                            );
                            if (result != null) {
                              setState(() => _prefixText = result);
                            }
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: kSecondaryTextColor,
                          ),
                        ),
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
                              controller: othersController,
                            )
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ),
            LargeButton(
              title: talkToSupport,
              onPressed: () {},
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            inkWell(
              onTap: () {
                if (_prefixText != selectReason && _prefixText != "Others") {
                  pushTo(
                    context,
                    DeleteConfirm(
                      reason: _prefixText,
                    ),
                    settings:
                        const RouteSettings(name: DisableConfirm.routeName),
                  );
                } else if (_prefixText == "Others") {
                  if (othersController.text.isNotEmpty) {
                    pushTo(
                      context,
                      DeleteConfirm(
                        reason: othersController.text,
                      ),
                      settings:
                          const RouteSettings(name: DisableConfirm.routeName),
                    );
                  } else {
                    showErrorBar(context, "Please state reason");
                  }
                } else {
                  showErrorBar(context, "Please pick a reason");
                }
              },
              child: Text(
                deleteAccount,
                style: textTheme.subtitle1!.copyWith(
                  color: kLightOrange,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ));
  }
}

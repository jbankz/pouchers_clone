import 'package:flutter/material.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/question_model.dart';
import 'package:Pouchers/modules/account/screens/delete_account/delete_account_confirmation.dart';
import 'package:Pouchers/modules/account/screens/disable_account/disable_account_confirmation.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/question_modal.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:intercom_flutter/intercom_flutter.dart';

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
        child: ListenerPage(
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
                          horizontal: kRegularPadding,
                          vertical: kRegularPadding),
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
                onPressed: () {
                  Intercom.instance.displayMessenger();
                },
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
          ),
        ));
  }
}

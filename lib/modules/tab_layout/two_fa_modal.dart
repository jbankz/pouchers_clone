import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/common/credentials.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/account/screens/account_settings/account_settings.dart';
import 'package:pouchers/modules/account/screens/two_factor_auth/google_authenticator_download.dart';
import 'package:pouchers/modules/account/screens/two_factor_auth/second_security_question.dart';
import 'package:pouchers/modules/account/screens/two_factor_auth/security_question.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class TwoFactorPinModal extends ConsumerStatefulWidget {
  final bool? isDisable, isBiometric;
  final int? lengthOfQuestion;
  final Function()? doBiom;


  const TwoFactorPinModal(
      {Key? key, this.lengthOfQuestion, this.isDisable = false, this.doBiom, this.isBiometric = false})
      : super(key: key);

  @override
  ConsumerState<TwoFactorPinModal> createState() => _TwoFactorPinModalState();
}

class _TwoFactorPinModalState extends ConsumerState<TwoFactorPinModal> {
  List<int> pinPicked = [];
  List<bool> containerBoolean = [];

  @override
  void initState() {
    super.initState();
    containerBoolean = List.generate(containerIndex.length, (index) => false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getQuestionHive();
    });
  }

  getQuestionHive() async {
    await Hive.openBox(k2FACodeBox);
    Hive.box(k2FACodeBox).put(kSetQuestion, widget.lengthOfQuestion);
    var noOfQuestion = Hive.box(k2FACodeBox).get(kSetQuestion);
    if (noOfQuestion != null) {
      setState(() {
        ref.read(calculateQuestionProvider.notifier).state = noOfQuestion;
      });
    } else {
      setState(() {
        ref.read(calculateQuestionProvider.notifier).state = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kMicroPadding),
            topRight: Radius.circular(kMicroPadding),
          ),
          color: kPrimaryWhite),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
          SizedBox(
            height: kMediumPadding,
          ),
          Text(
            enterPin,
            textAlign: TextAlign.center,
            style: textTheme.headline4!.copyWith(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          Consumer(builder: (context, ref, _) {
            ref.listen(
              validatePinProvider,
              (previous, NotifierState<String> next) {
                if (next.status == NotifierStatus.done) {
                  if (widget.isBiometric!) {
                    Navigator.pop(context, pinPicked);
                    widget.doBiom!();
                  }else{
                    ref.watch(calculateQuestionProvider) == 0
                        ? pushTo(context, SecurityQuestion(),
                        settings: const RouteSettings(
                            name: SecurityQuestion.routeName))
                        : ref.watch(calculateQuestionProvider) == 1
                        ? pushTo(context, SecondSecurityQuestion(),
                        settings: const RouteSettings(
                            name: SecondSecurityQuestion.routeName))
                        : pushTo(context, GoogleAuthenticatorDownload(),
                        settings: const RouteSettings(
                            name: GoogleAuthenticatorDownload.routeName));
                  }

                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message ?? next.data!);
                }
              },
            );
            var _widget = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  containerIndex.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: kRegularPadding),
                    height: kMediumPadding,
                    width: kMediumPadding,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: containerBoolean[index] == true
                            ? kPrimaryColor
                            : kPurpleColor300),
                  ),
                ),
              ],
            );
            return ref.watch(validatePinProvider).when(
                  done: (done) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget,
                );
          }),
          SizedBox(
            height: kMacroPadding,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: GridView.count(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
              children: List.generate(
                guestNumber.length,
                (index) => Column(
                  children: [
                    inkWell(
                      onTap: guestNumber[index].title == "Delete"
                          ? () {
                              if (pinPicked.length != 0) {
                                setState(() {
                                  pinPicked.removeLast();
                                  for (int i = 3;
                                      i <= containerBoolean.length;) {
                                    if (containerBoolean[i] == true) {
                                      setState(
                                          () => containerBoolean[i] = false);
                                      break;
                                    } else {
                                      i--;
                                    }
                                  }
                                });
                              }
                            }
                          : () {
                              if (pinPicked.length != 4) {
                                setState(() {
                                  pinPicked.add(
                                    int.parse(guestNumber[index].title),
                                  );
                                });
                                for (int i = 0; i < containerBoolean.length;) {
                                  if (containerBoolean[i] == false) {
                                    setState(() => containerBoolean[i] = true);
                                    break;
                                  } else {
                                    i++;
                                  }
                                }
                                ref.read(phoneProvider.notifier).state =
                                    pinPicked.length;
                                if (ref.watch(phoneProvider) == 4) {
                                  ref
                                      .read(validatePinProvider.notifier)
                                      .validatePin(pin: pinPicked.join(""));
                                }
                              }
                              print(pinPicked);
                            },
                      child: guestNumber[index].title == "Delete"
                          ? SvgPicture.asset(AssetPaths.backSpaceIcon)
                          : Container(
                              height: 35,
                              width: 35,
                              child: Text(
                                guestNumber[index].title,
                                style: textTheme.headline4!.copyWith(
                                    color: kDarkFill100,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22),
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

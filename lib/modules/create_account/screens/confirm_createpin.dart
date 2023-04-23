import 'package:Pouchers/modules/login/screens/reset_successful.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/create_account/models/create_account_response.dart';
import 'package:Pouchers/modules/create_account/providers/create_account_provider.dart';
import 'package:Pouchers/modules/create_account/screens/biometrics_page.dart';
import 'package:Pouchers/modules/login/screens/login.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/constant/ui_constants.dart';
import 'package:Pouchers/utils/extras.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class ConfirmCreatePin extends ConsumerStatefulWidget {
  static const String routeName = "confirmCreatePin";
  final List<int>? pinPicked;
  final bool isForgot;

  const ConfirmCreatePin({Key? key, this.pinPicked, this.isForgot = false})
      : super(key: key);

  @override
  ConsumerState<ConfirmCreatePin> createState() => _ConfirmCreatePinState();
}

class _ConfirmCreatePinState extends ConsumerState<ConfirmCreatePin> {
  List<int> pinPicked = [];
  List<bool> containerBoolean = [];

  @override
  void initState() {
    super.initState();
    containerBoolean = List.generate(containerIndex.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              confirmTransactionPin,
              style: textTheme.headline1,
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              createPinSub,
              style: textTheme.bodyText1!,
            ),
            SizedBox(
              height: kFullPadding,
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(createPinProvider,
                  (previous, NotifierState<TagResponse> next) {
                if (next.status == NotifierStatus.done) {
                  widget.isForgot
                      ? pushTo(
                          context,
                          ResetSuccessful(
                            message: successResetPin,
                            isChangePassword: true,
                          ),
                          settings: const RouteSettings(
                              name: ResetSuccessful.routeName),
                        )
                      : pushToAndClearStack(
                          context,
                          LogInAccount(
                            firstTime: true,
                          ),
                        );
                  // pushToAndClearUntil(context, BiometricsPage(),
                  //     routeName: LogInAccount.routeName,
                  //     settings:
                  //     const RouteSettings(name: BiometricsPage.routeName));
                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message ?? "");
                }
              });
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
              return ref.watch(createPinProvider).when(
                    done: (done) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget,
                  );
            }),
            SizedBox(
              height: kFullPadding,
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
                                  for (int i = 0;
                                      i < containerBoolean.length;) {
                                    if (containerBoolean[i] == false) {
                                      setState(
                                          () => containerBoolean[i] = true);
                                      break;
                                    } else {
                                      i++;
                                    }
                                  }
                                  ref.read(phoneProvider.notifier).state =
                                      pinPicked.length;
                                  if (ref.watch(phoneProvider) == 4) {
                                    Function eq = const ListEquality().equals;
                                    eq(widget.pinPicked, pinPicked)
                                        ? ref
                                            .read(createPinProvider.notifier)
                                            .createPin(pin: pinPicked.join(""))
                                        : showErrorBar(
                                            context, "Your pin does not match");
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
      ),
    );
  }
}

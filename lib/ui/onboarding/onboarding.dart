import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/create_account/screens/biometrics_page.dart';
import 'package:pouchers/ui/create_account/screens/create_account.dart';
import 'package:pouchers/ui/login/screens/login.dart';
import 'package:pouchers/ui/onboarding/welcome_guest.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = "onboarding";

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _controller = PageController();
  int _currentPage = 0;

  List<Widget> _pages = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OnBoardingWidget(
          isRight: false,
          text: onBoardingText,
          subText: onBoardingSubText,
        ),
        OnBoardingWidget(
          isRight: true,
          text: onBoardingText2,
          subText: onBoardingSubText2,
        ),
        OnBoardingWidget(
          isRight: false,
          text: onBoardingText,
          subText: onBoardingSubText3,
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OnBoardingWidget2(
          isRight: true,
          text: onBoardingText4,
          subText: onBoardingSubText4,
          color: kIconPink,
          path: AssetPaths.wifiIcon,
        ),
        OnBoardingWidget2(
          isRight: false,
          text: onBoardingText4,
          subText: onBoardingSubText7,
          color: kPurpleColor,
          path: AssetPaths.airtimeIcon,
        ),
        OnBoardingWidget2(
          isRight: true,
          text: onBoardingText5,
          subText: onBoardingSubText5,
          color: kColorGreen,
          path: AssetPaths.ticketIcon,
        ),
        OnBoardingWidget2(
          isRight: false,
          text: onBoardingText6,
          subText: onBoardingSubText6,
          color: kColorOrange,
          path: AssetPaths.electricityIcon,
        ),
      ],
    ),
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: kMacroPadding,
                    bottom: kMediumPadding,
                    left: kRegularPadding,
                    right: kRegularPadding),
                color: kBackgroundColor,
                height: MediaQuery.of(context).size.height / 2,
                child: PageView.builder(
                  itemBuilder: (context, int index) {
                    return Container(
                      child: _pages[index],
                    );
                  },
                  itemCount: _pages.length,
                  controller: _controller,
                  onPageChanged: _onChanged,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(kMediumPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(onBoardingTitle,
                          style: textTheme.headline1!.copyWith(height: 1.4)),
                      // SizedBox(
                      //   height: kPadding,
                      // ),
                      Text(onBoardingSubTitle,
                          style: textTheme.bodyText1!.copyWith(height: 1.5)),
                      // SizedBox(
                      //   height: kFullPadding,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: LargeButton(
                              title: logIn,
                              outlineButton: true,
                              whiteButton: true,
                              onPressed: () {
                                pushTo(
                                  context,
                                  LogInAccount(),
                                  settings: RouteSettings(
                                      name: LogInAccount.routeName),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: kMediumPadding,
                          ),
                          Expanded(
                            child: LargeButton(
                              title: register,
                              onPressed: () {
                                pushTo(context, CreateAccount());
                              },
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: kMicroPadding,
                      // ),
                      inkWell(
                        onTap: () {
                          pushTo(
                            context,
                            WelcomeGuest(),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${guestLogin}",
                              style: textTheme.subtitle2!.copyWith(
                                fontFamily: "DMSans",
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              width: 20,
                              child: Stack(
                                children: [
                                  Icon(Icons.arrow_forward_ios,
                                      size: 15, color: kPrimaryColor),
                                  Positioned(
                                    left: 5,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: kPrimaryColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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

  void _animateSlider() {
    int nextPage = 0;
    Future.delayed(Duration(seconds: 2)).then((_) {
      nextPage = _controller.page!.round() + 1;
      if (nextPage == _pages.length) {
        nextPage = 0;
      }

      _controller
          .animateToPage(nextPage,
              duration: Duration(milliseconds: 700),
              curve: Curves.fastLinearToSlowEaseIn)
          .then((_) => _animateSlider());
    });
  }
}

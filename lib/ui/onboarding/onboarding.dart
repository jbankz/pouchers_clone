import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/navigators/navigators.dart';
import 'package:flutter_boilerplate/ui/create_account/screens/create_account.dart';
import 'package:flutter_boilerplate/ui/login/screens/login.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/strings.dart';
import 'package:flutter_boilerplate/utils/widgets.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _controller = PageController();
  int _currentPage = 0;

  List<Widget> _pages = [
    Column(
      children: [
        Text(
          onBoardingTitle,
          style:
              TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.5),
        ),
        SizedBox(
          height: kPadding,
        ),
        Text(
          onBoardingTitle,
          style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w400, height: 1.5),
        ),
      ],
    ),
    Column(
      children: [
        Text(onBoardingTitle,
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, height: 1.5)),
        SizedBox(
          height: kPadding,
        ),
        Text(
          onBoardingTitle,
          style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w400, height: 1.5),
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              height: MediaQuery.of(context).size.height / 2,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 140,
                    child: PageView.builder(
                      itemBuilder: (context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: kMediumPadding),
                          child: _pages[index],
                        );
                      },
                      itemCount: _pages.length,
                      controller: _controller,
                      onPageChanged: _onChanged,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < _pages.length; i++)
                        SlideBar(
                          index: i,
                          currentPage: _currentPage,
                        )
                    ],
                  ),
                  SizedBox(
                    height: kLargePadding,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kMediumPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: LargeButton(
                            title: logIn,
                            outlineButton: true,
                            whiteButton: true,
                            onPressed: () {
                              pushTo(context, LogInAccount());
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
                  ),
                  SizedBox(
                    height: kMicroPadding,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: kRegularPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${guestLogin}",
                          style: textTheme.bodyText1,
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
            )
          ],
        ),
      ),
    );
  }
}

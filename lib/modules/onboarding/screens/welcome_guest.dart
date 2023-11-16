import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/login/screens/login.dart';
import 'package:Pouchers/modules/onboarding/screens/guest_widget.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/constant/ui_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

import '../../../app/app.router.dart';
import '../../../app/core/router/page_router.dart';

class WelcomeGuest extends StatelessWidget {
  static const String routeName = "welcomeGuest";

  WelcomeGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kMediumPadding,
                  vertical: kSmallPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      welcomeGuest,
                      style: textTheme.headline1!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: kIconGrey,
                      ),
                    ),
                    SizedBox(
                      height: kMediumPadding,
                    ),
                    Text(selectPayment,
                        style: textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(
                      height: kMediumPadding,
                    ),
                    GridView.count(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: SizeConfig.blockSizeHorizontal! / 4,
                      children: List.generate(
                        guestClass.length,
                        (index) => inkWell(
                          onTap: () {
                            (guestClass[index].title == "Vouchers" ||
                                    guestClass[index].title == "Tickets")
                                ? buildShowModalBottomSheet(
                                    context, GuestDiscountModal())
                                : pushTo(
                                    context,
                                    guestClass[index].page,
                                  );
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kColorBackgroundLight,
                                ),
                                padding: EdgeInsets.all(kMediumPadding),
                                child: SvgPicture.asset(guestClass[index].icon),
                              ),
                              SizedBox(
                                height: kRegularPadding,
                              ),
                              Text(
                                guestClass[index].title,
                                style: textTheme.headline4!,
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: kMacroPadding,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: kColorBackgroundLight100,
                  height: MediaQuery.of(context).size.height / 3.0,
                  padding: EdgeInsets.symmetric(
                      horizontal: kMediumPadding, vertical: kMediumPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        onBoardingTitle,
                        style: textTheme.headline1!.copyWith(
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(
                        height: kMacroPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: LargeButton(
                              title: logIn,
                              outlineButton: true,
                              whiteButton: true,
                              onPressed: () {
                                pushTo(context, LogInAccount(),
                                    settings: const RouteSettings(
                                        name: LogInAccount.routeName));
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
                                PageRouter.pushNamed(Routes.signUpView);
                              },
                            ),
                          ),
                        ],
                      ),
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

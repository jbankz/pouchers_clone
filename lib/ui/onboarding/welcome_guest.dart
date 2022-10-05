import 'package:flutter/material.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/create_account/screens/create_account.dart';
import 'package:pouchers/ui/login/screens/login.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class WelcomeGuest extends StatelessWidget {
  WelcomeGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: kSmallPadding),
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
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(
                      height: kLargePadding,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kMediumPadding),
                      child: Text(selectPayment, style: textTheme.subtitle1),
                    ),
                    SizedBox(
                      height: kMediumPadding,
                    ),
                    GridView.count(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        guestClass.length,
                        (index) => Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kColorBackgroundLight,
                              ),
                              padding: EdgeInsets.all(kMediumPadding),
                              child: Image.asset(guestClass[index].icon),
                            ),
                            SizedBox(
                              height: kRegularPadding,
                            ),
                            Text(
                              guestClass[index].title,
                              style: textTheme.headline4,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: kColorBackgroundLight100,
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  final List<GuestClass> guestClass = [
    GuestClass("Airtime/Data", AssetPaths.airtime),
    GuestClass("CableTV", AssetPaths.television),
    GuestClass("Water Bill", AssetPaths.waterTap),
    GuestClass("Electricity", AssetPaths.electricity),
    GuestClass("Education", AssetPaths.education),
    GuestClass("Internet", AssetPaths.internet),
    GuestClass("Tickets", AssetPaths.airplane),
    GuestClass("Vouchers", AssetPaths.voucher),
    GuestClass("Betting", AssetPaths.betting),
  ];
}

class GuestClass {
  final String title;
  final String icon;

  GuestClass(this.title, this.icon);
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool obscure = true;
  PageController _controller = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: kMediumPadding, right: kMediumPadding, top: kFullPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      welcome,
                      style: textTheme.headline3!.copyWith(
                        color: kDarkFill,
                      ),
                    ),
                    Text(
                      "Munachi",
                      style: textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: kDarkFill),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: kPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 20.0,
                        lineWidth: 4.0,
                        percent: 0.15,
                        backgroundColor: kPurple300,
                        center: Text(
                          "25%",
                          style: textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        progressColor: kPurpleColor,
                      ),
                      SizedBox(
                        width: kMediumPadding,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kBackgroundColor),
                        child: SvgPicture.asset(
                          AssetPaths.notification,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: kMediumPadding),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(kRegularPadding),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    totalBalance,
                    style: textTheme.headline3!.copyWith(
                      color: kPurpleLight,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "₦",
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                          ),
                          children: [
                            TextSpan(
                                text: obscure ? "****** " : "500,000.00 ",
                                style: textTheme.bodyText2!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  height: 1.5,
                                  fontFamily: "DMSans",
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: kPadding,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          child: obscure
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: kPrimaryWhite.withOpacity(0.5),
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  color: kPrimaryWhite.withOpacity(0.5),
                                )),
                    ],
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeIcons(
                        icon: AssetPaths.walletIcon,
                        onTap: () {},
                        text: fundWallet,
                      ),
                      HomeIcons(
                        icon: AssetPaths.swapIcon,
                        onTap: () {},
                        text: transfer,
                      ),
                      HomeIcons(
                        icon: AssetPaths.moneyBagIcon,
                        onTap: () {},
                        text: request,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Text(
              quickLink,
              style: textTheme.headline3!.copyWith(
                color: kDarkFill,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                children: List.generate(
                  guestHomeClass.length,
                  (index) => Column(
                    children: [
                      inkWell(
                        onTap: () {
                          pushTo(context, guestHomeClass[index].page);
                        },
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kColorBackgroundLight,
                          ),
                          padding: EdgeInsets.all(kMediumPadding),
                          child: SvgPicture.asset(
                            guestHomeClass[index].icon,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kRegularPadding,
                      ),
                      Text(
                        guestHomeClass[index].title,
                        style: textTheme.headline4,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            Container(
              height: 160,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              child: PageView(
                padEnds: false,
                children: [
                  Container(
                    padding: EdgeInsets.all(kMediumPadding),
                    margin: EdgeInsets.only(right: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSmallPadding),
                      image: DecorationImage(
                        image: AssetImage(AssetPaths.pageImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homePageText,
                          softWrap: true,
                          style: textTheme.bodyText1!.copyWith(
                              fontSize: 20,
                              color: kOffWhite,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: kSmallPadding,
                        ),
                        Text(
                          homePageSubText,
                          style: textTheme.headline4!.copyWith(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(kMediumPadding),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSmallPadding),
                      color: Colors.green,
                      // image: DecorationImage(
                      //   image: AssetImage(AssetPaths.pageImage),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homePageText,
                          softWrap: true,
                          style: textTheme.bodyText1!.copyWith(
                              fontSize: 20,
                              color: kOffWhite,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: kSmallPadding,
                        ),
                        Text(
                          homePageSubText,
                          style: textTheme.headline4!.copyWith(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
                controller: _controller,
                onPageChanged: _onChanged,
              ),
            ),
            SizedBox(
              height: kSmallPadding,
            ),
          ],
        ),
      ),
    );
  }
}

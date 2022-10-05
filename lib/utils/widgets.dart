import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constants.dart';
import 'package:pouchers/utils/strings.dart';

class LargeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool whiteButton;
  final bool outlineButton, isLoading;

  LargeButton({required this.title,
      required this.onPressed,
      this.outlineButton = false,
      this.isLoading = false,
      this.whiteButton = false});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          backgroundColor: MaterialStateProperty.all<Color>(
              whiteButton ? kPrimaryWhite : kPrimaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: kBorderSmallRadius,
              side: BorderSide(
                  color: outlineButton ? kPrimaryColor : kPrimaryColor),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(kMediumPadding),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? SpinKitThreeBounce(
                color: whiteButton ? kPrimaryColor : kPrimaryWhite,
                size: 20.0,
              )
            : Text(
                title,
                style: textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: whiteButton ? kPrimaryTextColor : kPrimaryWhite),
              ),
      ),
    );
  }
}

class LargeLoadingButton extends StatelessWidget {
  final bool whiteButton;
  final bool outlineButton;

  LargeLoadingButton({this.outlineButton = false, this.whiteButton = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              whiteButton ? kPrimaryWhite : kPrimaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: kBorderSmallRadius,
              side: BorderSide(
                  color: outlineButton ? kPrimaryWhite : kPrimaryColor),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
        ),
        onPressed: () {},
        child: SpinKitThreeBounce(
          color: whiteButton ? kPrimaryColor : kPrimaryWhite,
          size: 22.0,
        ),
      ),
    );
  }
}

class InitialPage extends StatelessWidget {
  final Widget child;
  final bool noBackButton;

  const InitialPage({
    Key? key,
    required this.child,
    this.noBackButton = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        leading: noBackButton ? SizedBox() : IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: kMediumPadding, vertical: kSmallPadding),
            child: child),
      ),
    );
  }
}

class OnBoardingWidget extends StatelessWidget {
  final bool isRight;
  final String text, subText;

  const OnBoardingWidget(
      {Key? key,
      required this.isRight,
      required this.text,
      required this.subText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment:
          isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 7.5,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: kPadding,
                ),
                margin: EdgeInsets.only(left: kLargePadding, right: kSmallPadding),
                height: MediaQuery.of(context).size.height / 10,
                decoration: BoxDecoration(
                  color: kPrimaryWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kPadding),
                    topRight: Radius.circular(kPadding),
                    bottomRight: Radius.circular(kPadding),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "₦", style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor,
                              fontSize: 16,
                            ),
                            children: [
                          TextSpan(
                            text: text, style: textTheme.subtitle2
                          )
                        ])),
                    SizedBox(
                      height: kPadding,
                    ),
                    Text(
                      subText,
                      style: textTheme.headline5,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 3,
                child: Container(
                    padding: EdgeInsets.all(kRegularPadding),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kBackgroundColor,
                      border: Border.all(
                        width: 4,
                        color: kPrimaryWhite,
                      ),
                    ),
                    child: Image.asset(
                      AssetPaths.send,
                    )),
              ),
              Positioned(
                right: 0,
                bottom: kMicroPadding,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(kPadding),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff029650),
                  ),
                  child: Icon(Icons.check,
                    color: kPrimaryWhite,
                    size: 12),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class OnBoardingWidget2 extends StatelessWidget {
  final bool isRight;
  final String text, subText, path;
  final Color color;

  const OnBoardingWidget2(
      {Key? key,
      required this.isRight,
      required this.text,
      required this.subText,
      required this.path,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment:
          isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: kPrimaryWhite,
            borderRadius: BorderRadius.circular(kRegularPadding),
            border: Border.all(width: 1, color: color),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(path),
              RichText(
                  text: TextSpan(
                      text: "₦",
                      style: TextStyle( fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                        fontSize: 18,
                      ),
                      children: [
                    TextSpan(
                      text: text,
                      style: textTheme.subtitle2!.copyWith(fontSize: 18),
                    )
                  ])),
              Text(
                subText,
                style: textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String icon;
  bool isActive;

  NavBarItem(this.icon, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "${imgPath}$icon", height: 40,
      color: isActive ? kPrimaryColor : kDarkGrey,
    );
  }
}

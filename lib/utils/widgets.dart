import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';

class LargeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool whiteButton;
  final Color? disableColor;
  final bool outlineButton, isLoading, customColor, download;

  LargeButton(
      {required this.title,
      required this.onPressed,
      this.disableColor,
      this.outlineButton = false,
      this.customColor = false,
      this.isLoading = false,
      this.download = false,
      this.whiteButton = false});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(kTransparent),
          elevation: MaterialStateProperty.all<double>(0.0),
          backgroundColor: MaterialStateProperty.all<Color>(whiteButton
              ? kPrimaryWhite
              : customColor
                  ? kPurpleColor
                  : disableColor != null
                      ? disableColor!
                      : kPrimaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: kBorderSmallRadius,
              side: BorderSide(
                  color: outlineButton
                      ? kPrimaryColor
                      : disableColor != null
                          ? disableColor!
                          : kPrimaryColor),
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
                    color: download
                        ? kPrimaryColor
                        : whiteButton
                            ? kPrimaryTextColor
                            : kPrimaryWhite),
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
  final Widget? bottomSheet;
  final bool noBackButton, addSpace;
  final Function()? onTap;
  final String? title;
  final Color? color, titleColor;

  const InitialPage(
      {Key? key,
      required this.child,
      this.title,
      this.titleColor,
      this.onTap,
      this.color,
        this.bottomSheet,
      this.addSpace = true,
      this.noBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: color ?? kPrimaryWhite,
      bottomSheet: bottomSheet,
      appBar: AppBar(
        title: Text(
          title == null ? "" : title!,
          style: textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: titleColor ?? kPrimaryTextColor),
        ),
        centerTitle: title != null ? true : false,
        backgroundColor: kTransparent,
        leading: noBackButton
            ? SizedBox()
            : IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: titleColor ?? kPrimaryGrey,
                ),
                onPressed: onTap == null ? () => Navigator.pop(context) : onTap,
              ),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: addSpace ? kMediumPadding : 0,
                vertical: addSpace ? kSmallPadding : 0),
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
                margin:
                    EdgeInsets.only(left: kLargePadding, right: kSmallPadding),
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
                            text: "₦",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor,
                              fontSize: 16,
                            ),
                            children: [
                          TextSpan(text: text, style: textTheme.subtitle2)
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
                  child: Icon(Icons.check, color: kPrimaryWhite, size: 12),
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
              SvgPicture.asset(path),
              RichText(
                  text: TextSpan(
                      text: "₦",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
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
    return SvgPicture.asset(
      "${iconPath}$icon",
      height: 24,
      color: isActive ? kPrimaryColor : kDarkGrey,
    );
  }
}

class SpinKitDemo extends StatelessWidget {
  final double? size;
  final Color? color;

  const SpinKitDemo({Key? key, this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: color ?? kPrimaryColor,
      size: size ?? 50.0,
    );
  }
}

Future<dynamic> buildShowModalBottomSheet(BuildContext context, Widget widget) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(51),
          topRight: Radius.circular(51),
        ),
      ),
      context: context,
      builder: (ctx) => widget);
}

class SuccessMessage extends StatelessWidget {
  final String text, subText;
  final Function() onTap;

  const SuccessMessage(
      {Key? key,
      required this.text,
      required this.subText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AssetPaths.success, height: 200, width: 200),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Text(
                    text,
                    style: textTheme.headline1,
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    subText,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyText1!
                        .copyWith(fontWeight: FontWeight.normal, height: 1.6),
                  ),
                ],
              ),
            ),
            LargeButton(
                title: continueText,
                disableColor: kPurpleColor,
                onPressed: onTap),
            SizedBox(
              height: kMediumPadding,
            ),
          ],
        ));
  }
}

Widget makeDismissible(
        {required Widget child, required BuildContext context}) =>
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: GestureDetector(
        onTap: () {},
        child: child,
      ),
    );

class PinCodeTextFieldWidget extends StatelessWidget {
  final Function(String?) onSaved;
  final Function(String) onChanged;
  final MainAxisAlignment align;
  final int pinLength;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  const PinCodeTextFieldWidget(
      {Key? key,
      required this.onSaved,
      required this.onChanged,
      required this.pinLength,
      this.focusNode,
      this.controller,
      required this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return PinCodeTextField(
        keyboardType: TextInputType.number,
        enableActiveFill: true,
        mainAxisAlignment: align,
        animationDuration: const Duration(milliseconds: 300),
        cursorColor: kPrimaryColor,
        controller: controller,
        errorTextSpace: 25,
        focusNode: focusNode,
        validator: (val) {
          if (val!.isEmpty) {
            return emptyField;
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(6),
        ],
        textStyle: textTheme.subtitle1,
        hintStyle: TextStyle(fontWeight: FontWeight.bold),
        pinTheme: PinTheme(
          fieldWidth: 48,
          shape: PinCodeFieldShape.box,
          fieldOuterPadding: align == MainAxisAlignment.spaceBetween
              ? null
              : EdgeInsets.only(right: kSmallPadding),
          borderWidth: 1.5,
          selectedColor: kPrimaryColor,
          inactiveColor: kTransparent,
          activeColor: kTransparent,
          selectedFillColor: kBackgroundColor,
          activeFillColor: kBackgroundColor,
          inactiveFillColor: kBackgroundColor,
          borderRadius: BorderRadius.circular(3),
        ),
        appContext: context,
        length: pinLength,
        onChanged: onChanged);
  }
}

class SlideBar extends StatelessWidget {
  final int index;
  final int currentPage;

  SlideBar({required this.index, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width: 8,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _colorPage(index, currentPage),
      ),
    );
  }

  Color _colorPage(int index, int currentPage) {
    if (index == 0 && currentPage == 0) {
      return kPrimaryColor;
    } else if (index == 1 && currentPage == 1) {
      return kPrimaryColor;
    } else if (index == 2 && currentPage == 2) {
      return kPrimaryColor;
    } else {
      return kLightPurple;
    }
  }
}


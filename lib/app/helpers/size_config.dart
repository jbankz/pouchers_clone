import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  void init(BuildContext context) {

    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
    _safeAreaHorizontal = _mediaQueryData!.padding.left +
        _mediaQueryData!.padding.right;
    _safeAreaVertical = _mediaQueryData!.padding.top +
        _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! -
        _safeAreaHorizontal!) * 50;
    safeBlockVertical = (screenHeight! -
        _safeAreaVertical!) / 100;
  }
}

class NairaWidget extends StatelessWidget {
  const NairaWidget({Key? key,
    required this.text,
    required this.textStyle1,
    required this.textStyle2,
    this.addSign = false,
    this.sign
   })
      : super(key: key);

  final String text;
      final String? sign;
  final bool addSign;
  final TextStyle textStyle1, textStyle2;


  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: addSign ? "$sign ₦" : "₦",
        children: [
          TextSpan(text: text, style: textStyle2,   ),
        ],
        style: textStyle1
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LargeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool whiteButton;
  final bool outlineButton, isLoading;
  LargeButton(
      {required this.title,
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
        onPressed: onPressed,
        child: isLoading
            ? SpinKitThreeBounce(
          color: whiteButton ? kPrimaryColor : kPrimaryWhite,
          size: 20.0,
        )
            : Text(
          title,
          style: textTheme.bodyText1!.copyWith(
              color: whiteButton ? kPrimaryColor : kPrimaryWhite),
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

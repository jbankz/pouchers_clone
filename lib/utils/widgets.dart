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
          elevation: MaterialStateProperty.all<double>(
              0.0),
          backgroundColor: MaterialStateProperty.all<Color>(
              whiteButton ? kPrimaryWhite : kPrimaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: kBorderSmallRadius,
              side: BorderSide(
                  color: outlineButton ? Color(0xffCCD0DB) : kPrimaryColor),
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

class SlideBar extends StatelessWidget {
  final int index;
  final int currentPage;

  SlideBar({required this.index, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 5,
      width:  20,
      margin: EdgeInsets.symmetric(vertical: kMacroPadding, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: _colorPage(index, currentPage),
      ),
    );
  }

  Color _colorPage(int index, int currentPage) {
    if (index == 0 && currentPage == 0) {
      return kPrimaryColor;
    } else if (index == 1 && currentPage == 1) {
      return kPrimaryColor;
    }  else {
      return Colors.grey;
    }
  }
}

class InitialPage extends StatelessWidget {
  final Widget child;
  const InitialPage({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=> Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding, vertical: kSmallPadding),
            child: child
        ),
      ),
    );
  }
}

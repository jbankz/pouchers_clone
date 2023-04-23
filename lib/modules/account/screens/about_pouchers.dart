import 'package:flutter/material.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class AboutPouchers extends StatelessWidget {
  const AboutPouchers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: aboutUs,
      child: ListenerPage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: kLargePadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kRegularPadding),
                  color: kPrimaryColor,
                ),
                child: Text(
                  wePouchers,
                  style: textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: kMicroPadding,
              ),
              Text(
                wePouchersSub,
                style: textTheme.headline2!.copyWith(
                  color: kLightColor400,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

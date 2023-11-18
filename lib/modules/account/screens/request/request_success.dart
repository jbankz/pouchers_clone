import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:Pouchers/modules/make_payment/screens/make_payment_widgets.dart';
import 'package:Pouchers/modules/make_payment/screens/transaction_receipt.dart';
import 'package:Pouchers/modules/schedule_purchase/screens/schedule_transfer.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'dart:math' as math;

class RequestSuccess extends StatelessWidget {
  final String text;

  const RequestSuccess({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        noBackButton: true,
        child: ListenerPage(
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
                      text == "decline"
                          ? "Request declined"
                          : "Payment successful",
                      style: textTheme.headline1,
                    ),
                    SizedBox(
                      height: kPadding,
                    ),
                    Text(
                      text == "decline"
                          ? "Your have successfully declined the money request!"
                          : "Your have successfully paid the money request!",
                      textAlign: TextAlign.center,
                      style: textTheme.bodyText1!
                          .copyWith(fontWeight: FontWeight.normal, height: 1.6),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kMacroPadding,
              ),
              LargeButton(
                  title: continueText,
                  disableColor: kPurpleColor,
                  onPressed: () {
                    pushToAndClearStack(
                      context,
                      TabLayout(
                        gottenIndex: 0,
                      ),
                    );
                  }),
              SizedBox(
                height: kMediumPadding,
              ),
            ],
          ),
        ));
  }
}

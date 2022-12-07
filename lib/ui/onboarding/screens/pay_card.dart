import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/onboarding/screens/guest_widget.dart';
import 'package:pouchers/ui/onboarding/screens/welcome_guest.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class PayWithCard extends StatefulWidget {
  static const String routeName = "payWithCard";
  final bool? isCable;

  const PayWithCard({
    Key? key,
    this.isCable = false,
  }) : super(key: key);

  @override
  State<PayWithCard> createState() => _PayWithCardState();
}

class _PayWithCardState extends State<PayWithCard> {
  String? _cardNo;
  String? _expiry;
  String? _cvv;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: payWithDebit,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Text(
                  enterCardDetails,
                  style: textTheme.subtitle1,
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                TextInputNoIcon(
                  textTheme: textTheme,
                  text: cardNumberLower,
                  hintText: enterCardNumber,
                  onSaved: (val) => setState(() => _cardNo = val),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return emptyField;
                    } else if (val.length < 2) {
                      return lessValueField;
                    } else {
                      return null;
                    }
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextInputNoIcon(
                        textTheme: textTheme,
                        text: expiryText,
                        hintText: monthFormat,
                        onSaved: (val) => setState(() => _cardNo = val),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return emptyField;
                          } else if (val.length < 2) {
                            return lessValueField;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: kMediumPadding,
                    ),
                    Expanded(
                      child: TextInputNoIcon(
                        textTheme: textTheme,
                        text: cvvText,
                        hintText: cvvText,
                        onSaved: (val) => setState(() => _cardNo = val),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return emptyField;
                          } else {
                            return null;
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          PayWithAmount(
            amount: "4,000",
            text: "$pay ",
            onTap: () {
              pushTo(
                  context,
                  SuccessMessage(
                      text: widget.isCable! ? dataSuccess : rechargeSuccessful,
                      subText: widget.isCable!
                          ? deliveredPurchase
                          : rechargeSuccessfulSub,
                      onTap: () {
                        Navigator.popUntil(
                            context,
                            (route) =>
                                route.settings.name == WelcomeGuest.routeName);
                      }));
            },
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Text(
            "Secured by Paga",
            style: textTheme.headline4!
                .copyWith(color: kColorOrange, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class UtilityModal extends StatefulWidget {
  final List<GetUtilitiesData> utilities;

  const UtilityModal({Key? key, required this.utilities}) : super(key: key);

  @override
  State<UtilityModal> createState() => _UtilityModalState();
}

class _UtilityModalState extends State<UtilityModal> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.5,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kMicroPadding),
                topRight: Radius.circular(kMicroPadding),
              ),
              color: kPrimaryWhite),
          child: ListView(
            controller: controller,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: kMacroPadding,
                  height: 5,
                  decoration: BoxDecoration(
                    color: kPurpleColor200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                selectProvider,
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...widget.utilities.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: kRegularPadding),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: kRegularPadding),
                        child: inkWell(
                          onTap: () {
                            Navigator.pop(context, e);
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                color: kIconGrey,
                              ),
                              // ClipRRect(
                              //   child: Image.asset(
                              //     e.icon,
                              //   ),
                              //   borderRadius: BorderRadius.circular(116),
                              // ),
                              SizedBox(
                                width: kRegularPadding,
                              ),
                              Text(
                                e.billername!,
                                style: textTheme.subtitle1,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSmallPadding,
                      ),
                      Divider(
                        color: kLightPurple,
                        thickness: 1,
                      )
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
}

class SubscriptionModal extends StatefulWidget {
  final List<PaymentItem> paymentItem;

  const SubscriptionModal({Key? key, required this.paymentItem})
      : super(key: key);

  @override
  State<SubscriptionModal> createState() => _SubscriptionModalState();
}

class _SubscriptionModalState extends State<SubscriptionModal> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: widget.paymentItem.isEmpty ? 0.2: 0.5,
        maxChildSize: widget.paymentItem.isEmpty? 0.2 : 0.5,
        minChildSize: widget.paymentItem.isEmpty? 0.2 : 0.5,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kMicroPadding),
                topRight: Radius.circular(kMicroPadding),
              ),
              color: kPrimaryWhite),
          child: ListView(controller: controller, children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                width: kMacroPadding,
                height: 5,
                decoration: BoxDecoration(
                  color: kPurpleColor200,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            Text(
              subType,
              style: textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            widget.paymentItem.isEmpty
                ? Text(
                    "No Subscription type for this category",
                    style: textTheme.subtitle1,
              textAlign: TextAlign.center,
                  )
                : Column(
                    children: widget.paymentItem
                        .map(
                          (e) => Padding(
                            padding:
                                const EdgeInsets.only(bottom: kRegularPadding),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kRegularPadding),
                                  child: inkWell(
                                    onTap: () {
                                      Navigator.pop(context, e);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          e.paymentitemname!,
                                          style: textTheme.subtitle1,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: "₦",
                                            style: TextStyle(
                                              color: kIconGrey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${double.parse(e.amount!) / 100}",
                                                style: textTheme.subtitle1!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: kIconGrey),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: kSmallPadding,
                                ),
                                Divider(
                                  color: kLightPurple,
                                  thickness: 1,
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  )
          ]),
        ),
      ),
    );
  }
}

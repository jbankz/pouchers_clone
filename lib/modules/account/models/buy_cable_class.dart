import 'package:flutter/material.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/constant/ui_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

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
        initialChildSize: widget.utilities.isEmpty ? 0.25 : 0.5,
        maxChildSize: widget.utilities.isEmpty ? 0.25 : 0.5,
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
              widget.utilities.isEmpty
                  ? Text(
                      "No Provider available",
                      style: textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    )
                  : Column(
                      children: widget.utilities
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kRegularPadding),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: kRegularPadding),
                                    child: inkWell(
                                      onTap: () {
                                        Navigator.pop(context, e);
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              e.name!,
                                              style: textTheme.subtitle1,
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
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionModal extends StatefulWidget {
  final List<Service> paymentItem;
  final String? threshold;
  final String? discountValue;

  const SubscriptionModal(
      {Key? key, required this.paymentItem, this.threshold, this.discountValue})
      : super(key: key);

  @override
  State<SubscriptionModal> createState() => _SubscriptionModalState();
}

class _SubscriptionModalState extends State<SubscriptionModal> {
  @override
  Widget build(BuildContext context) {
    print("subscription modal${widget.threshold}");
    TextTheme textTheme = Theme.of(context).textTheme;
    print(widget.discountValue);
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: widget.paymentItem.isEmpty ? 0.25 : 0.5,
        maxChildSize: widget.paymentItem.isEmpty ? 0.25 : 0.5,
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
                                        Expanded(
                                          child: Text(
                                            e.name!,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.subtitle1,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            e.price != null && e.price != 0 ? RichText(
                                              text: TextSpan(
                                                text: "₦",
                                                style: TextStyle(
                                                  color: kIconGrey,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: "${e.price?? "0"}",
                                                    style: textTheme.subtitle1!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kIconGrey),
                                                  )
                                                ],
                                              ),
                                            ) : const SizedBox(),
                                            widget.threshold == "0" ||
                                                    widget.discountValue == "0"
                                                ? SizedBox()
                                                : double.parse(widget
                                                            .threshold ?? "0") <=
                                                        e.price!
                                                    ? Container(
                                                        padding: EdgeInsets.all(
                                                            kPadding),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  kLargePadding),
                                                          color: kPurpleColor,
                                                        ),
                                                        child: Text(
                                                          "${widget.discountValue ?? 0}% cashback",
                                                          style: textTheme
                                                              .headline4!
                                                              .copyWith(
                                                            color: kLightPurple,
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                          ],
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

class DataModal extends StatefulWidget {
  final List<MobileOperatorService> paymentItem;
  final String? threshold;
  final String? discountValue;

  const DataModal(
      {Key? key, required this.paymentItem, this.threshold, this.discountValue})
      : super(key: key);

  @override
  State<DataModal> createState() => _DataModalState();
}

class _DataModalState extends State<DataModal> {


  @override
  Widget build(BuildContext context) {
    print("data${widget.threshold}");
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: widget.paymentItem.isEmpty ? 0.25 : 0.5,
        maxChildSize: widget.paymentItem.isEmpty ? 0.25 : 0.5,
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
                                const EdgeInsets.only(bottom: kSmallPadding),
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
                                        Expanded(
                                          child: Text(
                                            e.serviceName ?? "",
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.subtitle1,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
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
                                                        "${e.servicePrice ?? ""}",
                                                    style: textTheme.subtitle1!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kIconGrey),
                                                  )
                                                ],
                                              ),
                                            ),
                                            widget.threshold == "0" || widget.threshold == null ||
                                                    widget.discountValue == "0"
                                                ? SizedBox()
                                                : double.parse(widget
                                                            .threshold!) <=
                                                        e.servicePrice!
                                                    ? Container(
                                                        padding: EdgeInsets.all(
                                                            kPadding),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  kLargePadding),
                                                          color: kPurpleColor,
                                                        ),
                                                        child: Text(
                                                          "${widget.discountValue}% cashback",
                                                          style: textTheme
                                                              .headline4!
                                                              .copyWith(
                                                            color: kLightPurple,
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: kPadding,
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

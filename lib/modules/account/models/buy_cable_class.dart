import 'package:flutter/material.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class CableModal extends StatefulWidget {
  const CableModal({
    Key? key,
  }) : super(key: key);

  @override
  State<CableModal> createState() => _CableModalState();
}

class _CableModalState extends State<CableModal> {
  Widget _prefixIcon = SizedBox();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
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
              ...providerList.map(
                    (e) => Padding(
                  padding: const EdgeInsets.only(bottom: kRegularPadding),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: kRegularPadding),
                        child: inkWell(
                          onTap: () {
                            setState(() => _prefixIcon = Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin:
                                  EdgeInsets.symmetric(vertical: 10),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      e.icon,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(116),
                                  ),
                                ),
                                SizedBox(
                                  width: kRegularPadding,
                                ),
                                Text(
                                  e.title,
                                  style: textTheme.subtitle1,
                                )
                              ],
                            ));
                            Navigator.pop(context, _prefixIcon);
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  e.icon,
                                ),
                                borderRadius: BorderRadius.circular(116),
                              ),
                              SizedBox(
                                width: kRegularPadding,
                              ),
                              Text(
                                e.title,
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
  const SubscriptionModal({
    Key? key,
  }) : super(key: key);

  @override
  State<SubscriptionModal> createState() => _SubscriptionModalState();
}

class _SubscriptionModalState extends State<SubscriptionModal> {
  Widget _prefixIcon = SizedBox();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.7,
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
            ...subscriptionList.map(
                  (e) => Padding(
                padding: const EdgeInsets.only(bottom: kRegularPadding),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kRegularPadding),
                      child: inkWell(
                        onTap: () {
                          setState(
                                () => _prefixIcon = Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kMediumPadding),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e.title,
                                    style: textTheme.subtitle1,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "₦",
                                      style: TextStyle(
                                        color: kPrimaryTextColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: e.icon,
                                            style: textTheme.subtitle1)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                          Navigator.pop(context, _prefixIcon);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.title,
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
                                    text: e.icon,
                                    style: textTheme.subtitle1!.copyWith(
                                        fontWeight: FontWeight.w500,
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
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class VoucherItems {
  final String value, code, expiry, image;
  final String? sign;

  VoucherItems(
      {required this.value,
      required this.code,
      required this.expiry,
      required this.image, this.sign});

  @override
  String toString() {
    return 'VoucherItems{value: $value, code: $code, expiry: $expiry, image: $image}';
  }
}

class VoucherModal extends StatefulWidget {
  const VoucherModal({
    Key? key,
  }) : super(key: key);

  @override
  State<VoucherModal> createState() => _VoucherModalState();
}

class _VoucherModalState extends State<VoucherModal> {
  String _value = "";
  int currentIndex = -1;
  List<VoucherItems> voucherItems = [
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: ""),
    VoucherItems(value: "#12345645", code: "5,000", expiry: "", image: "")
  ];

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
                availableVouchers,
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...voucherItems.mapIndexed(
                (index, element) => Padding(
                  padding: const EdgeInsets.only(
                      bottom: kRegularPadding, right: kSmallPadding),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: kRegularPadding),
                        child: inkWell(
                          onTap: () {
                            setState(() {
                              _value = element.value;
                              currentIndex = index;
                            });
                          Navigator.pop(context, _value);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: currentIndex != index
                                        ? kSecondaryTextColor
                                        : kPrimaryColor,
                                    width: 1.5,
                                  ),
                                ),
                                child: currentIndex == index
                                    ? Container(
                                        height: kSmallPadding,
                                        width: kSmallPadding,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kPrimaryColor,
                                        ),
                                      )
                                    : SizedBox(
                                        height: kSmallPadding,
                                        width: kSmallPadding,
                                      ),
                              ),
                              SizedBox(
                                width: kSmallPadding,
                              ),
                              Expanded(
                                child: Text(
                                  element.value,
                                  style: textTheme.headline2!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: currentIndex != index
                                          ? kSecondaryTextColor
                                          : kPrimaryColor),
                                ),
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "₦",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: kColorGreen,
                                        fontSize: 16,
                                      ),
                                      children: [
                                    TextSpan(
                                      text: element.code,
                                      style: textTheme.headline2!.copyWith(
                                        color: kColorGreen,
                                      ),
                                    )
                                  ])),
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

class ViewVoucherHistoryHeading extends StatelessWidget {
  final String text;
  final Color color, bgColor;
  final Function() onTap;

  const ViewVoucherHistoryHeading(
      {Key? key,
        required this.text,
        required this.onTap,
        required this.color,
        required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return inkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: kRegularPadding, vertical: kPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              kRegularPadding,
            ),
            color: bgColor),
        child: Text(
          text,
          style: textTheme.headline6!.copyWith(color: color),
        ),
      ),
    );
  }
}




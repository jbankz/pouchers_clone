import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/extras.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class GetProviderClass {
  final String title;
  final String icon;

  GetProviderClass({required this.title, required this.icon});
}

class ProviderRow {
  final String icon;

  const ProviderRow({required this.icon});
}

List<ProviderRow> provider = [
  ProviderRow(
    icon: AssetPaths.mtnLogoIcon,
  ),
  ProviderRow(
    icon: AssetPaths.gloIcon,
  ),
  ProviderRow(
    icon: AssetPaths.mobile9Icon,
  ),
  ProviderRow(
    icon: AssetPaths.airtelIcon,
  ),
];

class HomeIcons extends StatelessWidget {
  final String icon, text;
  final Function() onTap;

  const HomeIcons(
      {Key? key, required this.icon, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return inkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            child: SvgPicture.asset(
              icon,
              height: 24,
              width: 24,
            ),
            padding: EdgeInsets.all(kSmallPadding),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 255, 255, 0.9)),
          ),
          SizedBox(
            height: kPadding,
          ),
          Text(
            text,
            style: textTheme.headline6!.copyWith(color: kPurple200),
          )
        ],
      ),
    );
  }
}

class TransactionPinContainer extends ConsumerStatefulWidget {
  final bool isData, isCable;

  const TransactionPinContainer(
      {Key? key, required this.isData, this.isCable = false})
      : super(key: key);

  @override
  ConsumerState<TransactionPinContainer> createState() =>
      _TransactionPinContainerState();
}

class _TransactionPinContainerState
    extends ConsumerState<TransactionPinContainer> {
  List<int> pinPicked = [];
  List<bool> containerBoolean = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    containerBoolean = List.generate(containerIndex.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kMicroPadding),
            topRight: Radius.circular(kMicroPadding),
          ),
          color: kPrimaryWhite),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
          SizedBox(
            height: kMediumPadding,
          ),
          Text(
            enterPin,
            textAlign: TextAlign.center,
            style: textTheme.headline4!.copyWith(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                containerIndex.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: kRegularPadding),
                  height: kMediumPadding,
                  width: kMediumPadding,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: containerBoolean[index] == true
                          ? kPrimaryColor
                          : kPurpleColor300),
                ),
              ),
            ],
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: GridView.count(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
              children: List.generate(
                guestNumber.length,
                (index) => Column(
                  children: [
                    inkWell(
                      onTap: guestNumber[index].title == "Delete"
                          ? () {
                              if (pinPicked.length != 0) {
                                setState(() {
                                  pinPicked.removeLast();
                                  for (int i = 3;
                                      i <= containerBoolean.length;) {
                                    if (containerBoolean[i] == true) {
                                      setState(
                                          () => containerBoolean[i] = false);
                                      break;
                                    } else {
                                      i--;
                                    }
                                  }
                                });
                              }
                            }
                          : () {
                              if (pinPicked.length != 4) {
                                setState(() {
                                  pinPicked.add(
                                    int.parse(guestNumber[index].title),
                                  );
                                });
                                for (int i = 0; i < containerBoolean.length;) {
                                  if (containerBoolean[i] == false) {
                                    setState(() => containerBoolean[i] = true);
                                    break;
                                  } else {
                                    i++;
                                  }
                                }
                                ref.read(phoneProvider.notifier).state =
                                    pinPicked.length;
                                if (ref.watch(phoneProvider) == 4) {
                                  // Navigator.pop(context, pinPicked);

                                  pushTo(
                                    context,
                                    SuccessMessage(
                                        text: widget.isData
                                            ? dataSuccess
                                            : widget.isCable
                                                ? dataSuccess
                                                : rechargeSuccessful,
                                        subText: widget.isData
                                            ? dataSubSuccess
                                            : widget.isCable
                                                ? deliveredPurchase
                                                : rechargeSuccessfulSub,
                                        onTap: () {
                                          pushToAndClearStack(
                                            context,
                                            TabLayout(
                                              gottenIndex: 0,
                                            ),
                                          );
                                        }),
                                  );
                                }
                              }
                              print(pinPicked);
                            },
                      child: guestNumber[index].title == "Delete"
                          ? SvgPicture.asset(AssetPaths.backSpaceIcon)
                          : Container(
                              height: 35,
                              width: 35,
                              child: Text(
                                guestNumber[index].title,
                                style: textTheme.headline4!.copyWith(
                                    color: kDarkFill100,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22),
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AirtimeRow extends StatelessWidget {
  const AirtimeRow(
      {Key? key,
      required this.textTheme,
      required this.text,
      required this.subText,
      this.isNaira = false,
      this.isBold = false,
      required this.style})
      : super(key: key);

  final TextTheme textTheme;
  final String text, subText;
  final TextStyle style;
  final bool isNaira, isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textTheme.headline3!.copyWith(
            color: kIconGrey,
          ),
        ),
        isNaira
            ? RichText(
                text: TextSpan(
                  text: "₦",
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontWeight: isBold ? FontWeight.w700 : FontWeight.normal,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: subText,
                      style: style,
                    )
                  ],
                ),
              )
            : Text(
                subText,
                style: style,
              ),
      ],
    );
  }
}

class RechargeSummary extends StatelessWidget {
  const RechargeSummary({
    Key? key,
    required this.textTheme,
    required this.isData,
    this.isCable = false,
  }) : super(key: key);

  final TextTheme textTheme;
  final bool isData;
  final bool isCable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kMicroPadding),
            topRight: Radius.circular(kMicroPadding),
          ),
          color: kPrimaryWhite),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(kRegularPadding),
            height: 70,
            width: 70,
            decoration:
                BoxDecoration(color: kContainerColor, shape: BoxShape.circle),
            child: SvgPicture.asset(
              AssetPaths.mtnLogoIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            isData ? data : airtime,
            textAlign: TextAlign.center,
            style: textTheme.headline4!.copyWith(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: kLargePadding,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kRegularPadding, vertical: kSmallPadding),
            decoration: BoxDecoration(
              color: kContainerColor,
              borderRadius: BorderRadius.circular(kSmallPadding),
            ),
            child: Column(
              children: [
                AirtimeRow(
                  textTheme: textTheme,
                  text: recipient,
                  subText: "08031234567",
                  style: textTheme.headline3!.copyWith(
                      color: kPurpleColor, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: amountText,
                  subText: "4,000.00",
                  isNaira: true,
                  isBold: true,
                  style: textTheme.headline4!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: fee,
                  subText: "0.00",
                  isNaira: true,
                  style: textTheme.headline4!.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                AirtimeRow(
                  textTheme: textTheme,
                  text: cashBack,
                  subText: "0.00",
                  isNaira: true,
                  style: textTheme.headline4!.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: kLargePadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: SvgPicture.asset(
                        AssetPaths.walletIcon,
                        height: 22,
                        width: 22,
                      ),
                      decoration: BoxDecoration(
                          color: kLightPurple, shape: BoxShape.circle),
                      padding: EdgeInsets.all(kSmallPadding)),
                  Text(
                    "  $balance - ",
                    style: textTheme.headline4!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "₦",
                      style: TextStyle(
                        color: kPrimaryTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "6,945.04",
                          style: textTheme.headline4!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              inkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kRegularPadding, vertical: kSmallPadding),
                  decoration: BoxDecoration(
                      color: kPurpleColor,
                      borderRadius: BorderRadius.circular(kSmallPadding)),
                  child: Text(
                    fundWallet,
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: kPrimaryWhite,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: kPadding,
          ),
          Text(
            insufficient,
            style: textTheme.headline4!.copyWith(
              color: kColorOrange,
            ),
          ),
          SizedBox(
            height: kFullPadding,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0.0),
                backgroundColor: MaterialStateProperty.all<Color>(kPurpleColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: kBorderSmallRadius,
                    side: BorderSide(color: kPrimaryColor),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(kMediumPadding),
                ),
              ),
              onPressed: () async {
                final result = await buildShowModalBottomSheet(
                    context,
                    TransactionPinContainer(
                      isData: isData,
                      isCable: isCable,
                    ));
                print("result$result");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$pay ",
                    style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w700, color: kPrimaryWhite),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "₦",
                      style: TextStyle(
                        color: kPrimaryWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: "4,000",
                          style: textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: kPrimaryWhite),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

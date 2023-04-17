import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:pouchers/app/common/listener.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/ui_models_class.dart';
import 'package:pouchers/modules/onboarding/screens/guest_widget.dart';
import 'package:pouchers/modules/schedule_purchase/screens/schedule_airtime_topup.dart';
import 'package:pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class BuyAirtime extends ConsumerStatefulWidget {
  static const String routeName = "buyAirtime";
  final bool? isGuest;
  final String? name, email;

  const BuyAirtime({Key? key, this.isGuest, this.name, this.email})
      : super(key: key);

  @override
  ConsumerState<BuyAirtime> createState() => _BuyAirtimeState();
}

class _BuyAirtimeState extends ConsumerState<BuyAirtime> {
  TextEditingController contactController = TextEditingController();
  int currentIndex = -1;
  int dealCurrentIndex = -1;
  TextEditingController amountController = TextEditingController();
  String _amount = "";
  GetUtilitiesData? billerData;
  String? threshold;
  String? lastInputValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getUtilitiesProvider.notifier).getUtilities(utility: "airtime");
      widget.isGuest!
          ? null
          : ref
              .read(getDiscountProvider.notifier)
              .getDiscount(utility: "airtime");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: airtime,
      child: widget.isGuest! ?  airtimeColumn(textTheme, context) : ListenerPage(
        child: airtimeColumn(textTheme, context),
      ),
    );
  }

  Column airtimeColumn(TextTheme textTheme, BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                TextInputNoIcon(
                  textTheme: textTheme,
                  text: mobileNumber,
                  controller: contactController,
                  onChanged: (val) {
                    if (val!.isNotEmpty) {
                      setState(() {
                        contactController.text = val;
                      });
                    } else {
                      setState(() {
                        contactController.text = "";
                      });
                    }
                    contactController.selection = TextSelection.fromPosition(
                        TextPosition(offset: contactController.text.length));
                  },
                  inputFormatters: [LengthLimitingTextInputFormatter(11)],
                  icon: inkWell(
                    onTap: () async {
                      bool granted =
                          await FlutterContactPicker.requestPermission();
                      if (granted) {
                        final PhoneContact contact =
                            await FlutterContactPicker.pickPhoneContact();
                        setState(() {
                          String phoneReplaced = "";
                          String phoneReplaced1 = "";
                          String phoneReplaced2 = "";

                          phoneReplaced = contact.phoneNumber!.number!
                              .replaceAll("+234", "0");
                          phoneReplaced1 = phoneReplaced.replaceAll("234", "0");
                          phoneReplaced2 = phoneReplaced1.replaceAll(" ", "");

                          contactController.text = phoneReplaced2;
                        });
                        contactController.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset: contactController.text.length));
                      }
                    },
                    child: SvgPicture.asset(
                      AssetPaths.contactBook,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(
                  height: kPadding,
                ),
                Text(
                  selectProvider,
                  style: textTheme.headline3,
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                ref.watch(getUtilitiesProvider).when(
                      done: (provider) {
                        if (provider != null) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: provider.data!
                                .mapIndexed(
                                  (index, element) => inkWell(
                                    onTap: () {
                                      setState(() {
                                        currentIndex = index;
                                        billerData = element;
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                            padding:
                                                EdgeInsets.all(kRegularPadding),
                                            height: 70,
                                            width: 70,
                                            margin: EdgeInsets.only(
                                                right: kSmallPadding),
                                            decoration: BoxDecoration(
                                                color: currentIndex == index
                                                    ? kLightPurple
                                                    : kContainerColor,
                                                shape: BoxShape.circle),
                                            child: SvgPicture.asset(icon(
                                                provider.data![index]
                                                    .displayName!))),
                                        currentIndex == index
                                            ? Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        color: kPurpleColor,
                                                        shape: BoxShape.circle),
                                                    child: Icon(
                                                      Icons.check,
                                                      color: kPrimaryWhite,
                                                      size: 15,
                                                    )),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                      loading: () => SpinKitDemo(),
                      error: (val) => Text(
                        "No Provider for now",
                        style: textTheme.subtitle2,
                      ),
                    ),
                SizedBox(
                  height: kSmallPadding,
                ),
                widget.isGuest!
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            topDeal,
                            style: textTheme.headline3,
                          ),
                          SizedBox(
                            height: kSmallPadding,
                          ),
                          GridView.count(
                            primary: false,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            childAspectRatio:
                                SizeConfig.blockSizeHorizontal! / 3.4,
                            children: List.generate(
                              guestList.length,
                              (index) => Column(
                                children: [
                                  inkWell(
                                    onTap: () {
                                      buildShowModalBottomSheet(
                                          context, GuestDiscountModal());
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: kLightPurple),
                                            borderRadius: BorderRadius.circular(
                                                kSmallPadding)),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(kPadding),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      kSmallPadding),
                                                  topLeft: Radius.circular(
                                                      kSmallPadding),
                                                ),
                                                color: kPurpleColor,
                                              ),
                                              child: Text(
                                                "2% cashback",
                                                style: textTheme.headline4!
                                                    .copyWith(
                                                  color: kLightPurple,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: kSmallPadding,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                text: "₦",
                                                style: TextStyle(
                                                  color: kPrimaryTextColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: guestList[index].icon,
                                                    style: textTheme.subtitle1!
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: kRegularPadding,
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : ref.watch(getDiscountProvider).when(
                        loading: () {
                          return SpinKitDemo();
                        },
                        error: (val) => SizedBox(),
                        done: (done) {
                          if (done != null) {
                            threshold = done.data!.threshold;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  topDeal,
                                  style: textTheme.headline3,
                                ),
                                SizedBox(
                                  height: kSmallPadding,
                                ),
                                GridView.count(
                                  primary: false,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: 3,
                                  childAspectRatio:
                                      SizeConfig.blockSizeHorizontal! / 3.4,
                                  children: List.generate(
                                    guestList.length,
                                    (index) => Column(
                                      children: [
                                        inkWell(
                                          onTap: () {
                                            widget.isGuest!
                                                ? buildShowModalBottomSheet(
                                                    context,
                                                    GuestDiscountModal())
                                                : setState(() {
                                                    amountController.text =
                                                        guestList[index].icon;
                                                    _amount =
                                                        guestList[index].icon;
                                                    dealCurrentIndex = index;
                                                  });
                                            amountController.selection =
                                                TextSelection.fromPosition(
                                                    TextPosition(
                                                        offset: amountController
                                                            .text.length));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      dealCurrentIndex == index
                                                          ? kLightPurple
                                                          : kTransparent,
                                                  border: Border.all(
                                                      color: kLightPurple),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          kSmallPadding)),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(
                                                        kPadding),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                kSmallPadding),
                                                        topLeft:
                                                            Radius.circular(
                                                                kSmallPadding),
                                                      ),
                                                      color: kPurpleColor,
                                                    ),
                                                    child:
                                                        done.data!.threshold ==
                                                                null
                                                            ? Text(
                                                                "0% cashback",
                                                                style: textTheme
                                                                    .headline4!
                                                                    .copyWith(
                                                                  color:
                                                                      kLightPurple,
                                                                ),
                                                              )
                                                            : Text(
                                                                double.parse(done
                                                                            .data!
                                                                            .threshold!) <=
                                                                        double.parse(
                                                                            guestList[index].icon)
                                                                    ? "${done.data!.discountValue}% cashback"
                                                                    : "0% cashback",
                                                                style: textTheme
                                                                    .headline4!
                                                                    .copyWith(
                                                                  color:
                                                                      kLightPurple,
                                                                ),
                                                              ),
                                                  ),
                                                  SizedBox(
                                                    height: kSmallPadding,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      text: "₦",
                                                      style: TextStyle(
                                                        color:
                                                            kPrimaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: guestList[index]
                                                              .icon,
                                                          style: textTheme
                                                              .subtitle1!
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: kRegularPadding,
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          } else {
                            return SizedBox();
                          }
                        }),
                SizedBox(
                  height: kSmallPadding,
                ),
                Text(
                  enterAmount,
                  style: textTheme.headline6,
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
                  cursorColor: kPrimaryColor,
                  controller: amountController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val != null || val!.isNotEmpty) if (val
                        .startsWith("0")) {
                      return "Amount cannot start with zero";
                    } else
                      return null;
                  },
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      if (lastInputValue != val) {
                        lastInputValue = val;
                        setState(() {
                          dealCurrentIndex = -1;
                        });
                      }
                    }
                    setState(() {
                      _amount = val;
                      amountController.text = val;
                      amountController.selection = TextSelection.fromPosition(
                        TextPosition(offset: amountController.text.length),
                      );
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    prefix: RichText(
                      text: TextSpan(
                        text: "₦  ",
                        style: TextStyle(
                          color: kPrimaryTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    fillColor: kBackgroundColor,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(kSmallPadding),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(kSmallPadding),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSmallPadding),
                      borderSide: BorderSide(color: kColorRed),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSmallPadding),
                      borderSide: BorderSide(color: kColorRed),
                    ),
                  ),
                ),
                SizedBox(
                  height: kMicroPadding,
                ),
                widget.isGuest!
                    ? SizedBox()
                    : Scheduling(
                        text: scheduleAirtime,
                        subtext: scheduleAirtimeSub,
                        onTap: () => pushTo(
                            context,
                            ScheduleAirtimeTopUp(
                              amount: amountController.text,
                              contactNumber: contactController.text,
                              billerData: billerData,
                            ),
                            settings: RouteSettings(
                                name: ScheduleAirtimeTopUp.routeName)),
                      ),
                SizedBox(
                  height: kMicroPadding,
                )
              ],
            ),
          ),
          LargeButton(
            title: continueText,
            disableColor: amountController.text.isEmpty ||
                    _amount.isEmpty ||
                    _amount.startsWith("0") ||
                    billerData == null ||
                    contactController.text.isEmpty
                ? kPurpleColor100
                : kPrimaryColor,
            outlineButton: false,
            onPressed: amountController.text.isEmpty ||
                    contactController.text.isEmpty ||
                    billerData == null ||
                    _amount.isEmpty ||
                    _amount.startsWith("0")
                ? () {

                  }
                : () {

                    if (double.parse(amountController.text) > 10000 &&
                        widget.isGuest!) {
                      buildShowModalBottomSheet(
                          context, GuestMaximumAmountModal());
                    } else {
                      buildShowModalBottomSheet(
                        context,
                        RechargeSummary(
                          textTheme: textTheme,
                          amount: amountController.text,
                          category: "airtime-purchase",
                          isGuest: widget.isGuest!,
                          name: widget.name,
                          email: widget.email,
                          threshold: threshold ?? "0",
                          recipientNo: contactController.text,
                          billerName: billerData!.name!,
                          billerId: billerData!.operatorpublicid!,
                          billerLogo: icon(billerData!.displayName!),
                        ),
                      );
                    }
                  },
          )
        ],
      );
  }

  String icon(String displayName) {
    String icon = "";
    switch (displayName) {
      case "MTN":
        return airtimeProvider[0].icon;
      case "GLO":
        return airtimeProvider[1].icon;
      case "Airtel":
        return airtimeProvider[3].icon;
      default:
        return airtimeProvider[2].icon;
    }
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/account/disable_account/disable_modal.dart';
import 'package:pouchers/ui/make_payment/screens/make_payment_widgets.dart';
import 'package:pouchers/ui/make_payment/screens/transfer_success.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class TransferPoucherFriend extends StatefulWidget {
  static const String routeName = "transferPoucherFriend";
  final bool? isRequestMoney;

  const TransferPoucherFriend({Key? key, this.isRequestMoney})
      : super(key: key);

  @override
  State<TransferPoucherFriend> createState() => _TransferPoucherFriendState();
}

class _TransferPoucherFriendState extends State<TransferPoucherFriend> {
  List<int> pinPicked = [];
  List<int> decimalPinPicked = [];
  String wholeText = "0";
  String decimalText = "00";
  bool wholeTextString = true;
  FocusNode _focusNode = FocusNode();
  bool visible = false;
  String noteText = addNote;
  TextEditingController noteController = TextEditingController();
  Map<String, dynamic> contactInfo = {};

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      addSpace: false,
      color: kPrimaryColor,
      titleColor: kPrimaryWhite,
      title: widget.isRequestMoney! ? requestMoney : transferMoney,
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                child: ListView(
                  children: [
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    widget.isRequestMoney!
                        ? SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: SvgPicture.asset(
                                    AssetPaths.walletIcon,
                                    height: kRegularPadding,
                                    width: kRegularPadding,
                                  ),
                                  decoration: BoxDecoration(
                                      color: kLightPurple,
                                      shape: BoxShape.circle),
                                  padding: EdgeInsets.all(kSmallPadding)),
                              Text(
                                "  $balance - ",
                                style: textTheme.subtitle2!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: kLightPurple,
                                  fontFamily: "DMSans",
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "₦",
                                  style: TextStyle(
                                    color: kLightPurple,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "26,945",
                                      style: textTheme.subtitle2!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: kLightPurple,
                                        fontFamily: "DMSans",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: kMicroPadding,
                    ),
                    inkWell(
                      onTap: () async {
                        Map<String, dynamic> result =
                            await buildShowModalBottomSheet(
                          context,
                          TransferModal(isRequest: widget.isRequestMoney!),
                        );
                        setState(() {
                          contactInfo = result;
                        });
                        print("result$contactInfo");
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: kMacroPadding,
                            right: kMacroPadding,
                            top: kMacroPadding,
                            bottom: kSmallPadding),
                        decoration: BoxDecoration(
                            color: kPrimaryWhite,
                            borderRadius: BorderRadius.circular(kSmallPadding)),
                        child: Column(
                          children: [
                            contactInfo["phoneNumber"] == null
                                ? Row(
                                    children: [
                                      Text(
                                        "@ ",
                                        style: textTheme.subtitle1!.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget.isRequestMoney!
                                              ? " $selectRecipient"
                                              : " $enterPoucherTag",
                                          style: textTheme.subtitle1!.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: widget.isRequestMoney!
                                                  ? kPrimaryTextColor
                                                  : kIconGrey),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(kPadding),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kPrimaryColor),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 12,
                                          color: kPrimaryWhite,
                                        ),
                                      )
                                    ],
                                  )
                                : Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(116),
                                        child: CachedNetworkImage(
                                            height: 40,
                                            width: 40,
                                            imageUrl:
                                                contactInfo["profilePicture"],
                                            placeholder: (context, url) =>
                                                Container(
                                                  color: Colors.transparent,
                                                  height: 40,
                                                  width: 40,
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              kPrimaryColor),
                                                    ),
                                                  ),
                                                ),
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url,
                                                    error) =>
                                                Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kPrimaryColor),
                                                  child: Text(
                                                      "${contactInfo["firstName"]!.substring(0, 1).toUpperCase()}${contactInfo["lastName"]!.substring(0, 1).toUpperCase()}",
                                                      style: textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                              fontSize: 22)),
                                                )),
                                      ),
                                      SizedBox(
                                        width: kRegularPadding,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${contactInfo["firstName"]} ${contactInfo["lastName"]}",
                                          style: textTheme.headline4!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(kPadding),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kPrimaryColor),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 12,
                                          color: kPrimaryWhite,
                                        ),
                                      )
                                    ],
                                  ),
                            SizedBox(
                              height: kSmallPadding,
                            ),
                            inkWell(
                              onTap: () {
                                setState(() {
                                  visible = true;
                                });
                                _focusNode.requestFocus();
                                print("here");
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$noteText ",
                                    style: textTheme.headline3,
                                  ),
                                  Icon(Icons.arrow_forward)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kFullPadding,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "₦",
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 42,
                          ),
                          children: [
                            TextSpan(
                                text: wholeText,
                                style: textTheme.headline3!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: kPrimaryWhite,
                                  fontSize: 42,
                                )),
                            TextSpan(
                                text: ".",
                                style: textTheme.headline3!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: kBackgroundColor.withOpacity(0.5),
                                  fontSize: 22,
                                )),
                            TextSpan(
                                text: decimalText,
                                style: textTheme.headline3!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: kBackgroundColor.withOpacity(0.5),
                                  fontSize: 22,
                                )),
                          ]),
                    ),
                    SizedBox(
                      height: kFullPadding,
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
                          guestNumberDot.length,
                          (index) => Column(
                            children: [
                              inkWell(
                                onTap: guestNumberDot[index].title == "Delete"
                                    ? () {
                                        wholeTextString
                                            ? setState(() {
                                                if (pinPicked.isNotEmpty) {
                                                  pinPicked.removeLast();
                                                  if (pinPicked.isEmpty) {
                                                    wholeText = "0";
                                                  } else {
                                                    wholeText =
                                                        pinPicked.join("");
                                                  }
                                                }
                                              })
                                            : setState(() {
                                                if (decimalPinPicked
                                                    .isNotEmpty) {
                                                  decimalPinPicked.removeLast();
                                                  if (decimalPinPicked
                                                      .isEmpty) {
                                                    decimalText = "00";
                                                    wholeTextString = true;
                                                  } else {
                                                    decimalText =
                                                        decimalPinPicked
                                                            .join("");
                                                  }
                                                }
                                              });
                                      }
                                    : guestNumberDot[index].title == "."
                                        ? () {
                                            setState(() {
                                              wholeTextString = false;
                                            });
                                          }
                                        : () {
                                            wholeTextString
                                                ? setState(() {
                                                    pinPicked.add(
                                                      int.parse(
                                                          guestNumberDot[index]
                                                              .title),
                                                    );
                                                    if (pinPicked.first == 0) {
                                                      pinPicked.removeAt(0);
                                                      wholeText = "0";
                                                    } else {
                                                      wholeText =
                                                          pinPicked.join("");
                                                    }
                                                  })
                                                : setState(() {
                                                    if (decimalPinPicked
                                                            .length !=
                                                        2) {
                                                      decimalPinPicked.add(
                                                        int.parse(
                                                            guestNumber[index]
                                                                .title),
                                                      );
                                                      decimalText =
                                                          decimalPinPicked
                                                              .join("");
                                                    }
                                                  });
                                          },
                                child: guestNumberDot[index].title == "Delete"
                                    ? SvgPicture.asset(
                                        AssetPaths.backSpaceIcon,
                                        color: kPrimaryWhite,
                                      )
                                    : Container(
                                        height: 35,
                                        width: 35,
                                        child: Text(
                                          guestNumberDot[index].title,
                                          style: textTheme.headline4!.copyWith(
                                              color: kPrimaryWhite,
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
                    LargeButton(
                      disableColor: kPurpleDeep,
                      title: widget.isRequestMoney! ? request : transfer,
                      onPressed: () {
                        buildShowModalBottomSheet(
                          context,
                          DisableModal(
                              textTheme: textTheme,
                              buttonText: confirm,
                              title: pleaseConfirm,
                              widget: RichText(
                                text: TextSpan(
                                    text: widget.isRequestMoney!
                                        ? aboutRequest
                                        : aboutTransfer,
                                    style: TextStyle(
                                      color: kIconGrey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " ₦120",
                                        style: TextStyle(
                                          color: kPrimaryTextColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      TextSpan(
                                          text: " to ",
                                          style: textTheme.headline3!.copyWith(
                                            color: kIconGrey,
                                          )),
                                      TextSpan(
                                          text: "Tola Adewunmi",
                                          style: textTheme.headline4!.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ]),
                              ),
                              subTitle: "",
                              color: kPrimaryColor),
                        ).then((value) {
                          if (value == "yes") {
                            buildShowModalBottomSheet(
                                context,
                                TransactionPinContainer(
                                  isData: false,
                                  isCard: false,
                                  isFundCard: false,
                                  isTransfer: true,
                                  doTransfer: () {
                                    pushTo(context, TransferSuccess(text: "tag",));
                                  },
                                ));
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: visible,
              child: Container(
                padding: EdgeInsets.all(
                  kMediumPadding,
                ),
                decoration: BoxDecoration(
                    color: kPrimaryWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kSmallPadding),
                        topRight: Radius.circular(kSmallPadding))),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: iconList
                            .map(
                              (e) => inkWell(
                                onTap: () {
                                  print(e);
                                },
                                child: Container(
                                    child: Image.asset(e),
                                    decoration: BoxDecoration(
                                        color: kLightPurple,
                                        shape: BoxShape.circle),
                                    padding: EdgeInsets.all(kSmallPadding)),
                              ),
                            )
                            .toList()),
                    SizedBox(
                      height: kRegularPadding,
                    ),
                    TextInputNoIcon(
                      textTheme: textTheme,
                      focusNode: _focusNode,
                      widget: SizedBox(),
                      addSpace: false,
                      controller: noteController,
                      suffixIcon: inkWell(
                        onTap: () {
                          setState(() {
                            visible = false;
                            noteText = noteController.text;
                            noteController.clear();
                          });
                          _focusNode.unfocus();
                        },
                        child: Text(
                          send,
                          style: textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

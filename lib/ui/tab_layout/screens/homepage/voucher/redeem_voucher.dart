import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/tab_layout/models/buy_cable_class.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/voucher_widgets.dart';
import 'package:pouchers/ui/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class RedeemVoucher extends StatefulWidget {
  static const String routeName = "redeemVoucher";

  const RedeemVoucher({Key? key}) : super(key: key);

  @override
  State<RedeemVoucher> createState() => _RedeemVoucherState();
}

class _RedeemVoucherState extends State<RedeemVoucher> {
  String _value = "#12345647";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: redeemVouchers,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            enterVoucherCode,
            style: textTheme.headline6,
          ),
          SizedBox(
            height: kSmallPadding,
          ),
          Container(
            padding: EdgeInsets.all(kRegularPadding),
            decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(kSmallPadding)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _value,
                  style: textTheme.headline2!.copyWith(
                      color: _value != "#12345647"
                          ? kPrimaryTextColor
                          : kLightColor200),
                ),
                inkWell(
                    onTap: () async {
                      final result = await buildShowModalBottomSheet(
                          context, VoucherModal());
                      if (result != null) {
                        setState(() => _value = result);
                      }
                    },
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                      color: kSecondaryTextColor,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _value == "#12345647"
              ? SizedBox()
              : Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  height: 200,
                  decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: BorderRadius.circular(kRegularPadding)),
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: kPrimaryWhite,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                AssetPaths.voucherImage,
                              ))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: SvgPicture.asset(
                              AssetPaths.pouIcon,
                              color: kPurple100,
                              height: constraints.maxHeight / 1.5,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        AssetPaths.poucherTextImage,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            value,
                                            style: textTheme.headline3!
                                                .copyWith(
                                                    color: kLightPurple,
                                                    fontSize: 8),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: "₦",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12,
                                                      color: kPrimaryWhite),
                                                  children: [
                                                TextSpan(
                                                  text: "5,000",
                                                  style: textTheme.bodyText2!
                                                      .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "DMSans",
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ])),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            code,
                                            style: textTheme.headline3!
                                                .copyWith(
                                                    color: kLightPurple,
                                                    fontSize: 8),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(_value,
                                              style:
                                                  textTheme.bodyText2!.copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "DMSans",
                                                fontSize: 12,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: kPadding,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              expiryText,
                                              style: textTheme.headline3!
                                                  .copyWith(
                                                      color: kLightPurple,
                                                      fontSize: 8),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("12/04/2022",
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                style: textTheme.bodyText2!
                                                    .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "DMSans",
                                                  fontSize: 10,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                              padding: EdgeInsets.only(
                                  top: constraints.maxHeight / 5,
                                  left: constraints.maxWidth / 7,
                                  right: 20,
                                  bottom: 20),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
          SizedBox(
            height: kLargePadding,
          ),
          LargeButton(
              title: redeemVouchers.substring(0, 14),
              onPressed: () {
                pushTo(
                    context,
                    SuccessMessage(
                      text: dataSuccess,
                      subText: redeemVoucherSuccessful,
                      onTap: () {
                        pushToAndClearStack(
                            context,
                            TabLayout(
                              gottenIndex: 0,
                            ));
                      },
                    ));
              })
        ],
      ),
    );
  }
}

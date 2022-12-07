import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class GiftVoucher extends StatefulWidget {
  static const String routeName = "giftVoucher";

  const GiftVoucher({Key? key}) : super(key: key);

  @override
  State<GiftVoucher> createState() => _GiftVoucherState();
}

class _GiftVoucherState extends State<GiftVoucher> {
  String _value = "#12345647";
  String _voucherType = onlyEmailText;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: giftVoucher,
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
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
            height: kMicroPadding,
          ),
          Row(
            children: [
              inkWell(
                onTap: () {
                  setState(() => _voucherType = onlyEmailText);
                },
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _voucherType == onlyEmailText
                              ? kPrimaryColor
                              : kSecondaryTextColor,
                          width: 1.5,
                        ),
                      ),
                      child: _voucherType == onlyEmailText
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
                    Text(
                      onlyEmailText,
                      style: textTheme.headline3!
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: kRegularPadding,
              ),
              inkWell(
                onTap: () {
                  setState(() => _voucherType = poucherTag);
                },
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _voucherType == poucherTag
                              ? kPrimaryColor
                              : kSecondaryTextColor,
                          width: 1.5,
                        ),
                      ),
                      child: _voucherType == poucherTag
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
                    Text(
                      poucherTag,
                      style: textTheme.headline3!
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: kSmallPadding,
          ),
          TextInputNoIcon(
            textTheme: textTheme,
            widget: SizedBox(),
            hintText: enterEmail,
          ),
          SizedBox(
            height: kLargePadding,
          ),
          LargeButton(
              title: giftVoucher.substring(0, 12),
              onPressed: () {
                buildShowModalBottomSheet(
                  context,
                  TransactionPinContainer(
                    isData: false,
                    isCard: false,
                    isFundCard: false,
                    isGiftVoucher: true,
                  ),
                );
              }),
          SizedBox(
            height: kMicroPadding,
          ),
          Text(
            sendCodeVia,
            style: textTheme.headline6!.copyWith(color: kIconGrey),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: kPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetPaths.facebookIcon),
              SizedBox(
                width: kSmallPadding,
              ),
              SvgPicture.asset(AssetPaths.whatsappIcon),
              SizedBox(
                width: kSmallPadding,
              ),
              SvgPicture.asset(AssetPaths.instagramIcon),
            ],
          )
        ],
      ),
    );
  }
}

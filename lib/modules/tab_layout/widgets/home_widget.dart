import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/make_payment/screens/make_payment_widgets.dart';
import 'package:pouchers/modules/make_payment/screens/transfer_poucher_friend.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class HomeModal extends StatelessWidget {
  const HomeModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: Align(
        alignment: Alignment(0, 1),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: kPrimaryWhite,
              borderRadius: BorderRadius.circular(kMediumPadding)),
          padding: EdgeInsets.only(
              left: kMediumPadding,
              right: kMediumPadding,
              bottom: kLargePadding,
              top: kPadding),
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kMediumPadding)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: kMacroPadding,
                    height: 3,
                    decoration: BoxDecoration(
                      color: kPurpleColor200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                Center(
                  child: Text(
                    transferMoney,
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                TransferRow(
                  textTheme: textTheme,
                  text: poucherFriend,
                  subText: poucherFriendSub,
                  isFree: true,
                  onTap: () {
                    Navigator.pop(context);
                    pushTo(
                      context,
                      TransferPoucherFriend(isRequestMoney: false,),
                      settings: const RouteSettings(
                          name: TransferPoucherFriend.routeName),
                    );
                  },
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                TransferRow(
                  textTheme: textTheme,
                  text: bankAccount,
                  subText: bankAccountSub,
                  onTap: () {
                    Navigator.pop(context);
                    buildShowModalBottomSheet(context, BankAccountModal());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransferRow extends StatelessWidget {
  const TransferRow(
      {Key? key,
      required this.textTheme,
      required this.text,
      required this.subText,
      this.isFree = false,
      required this.onTap})
      : super(key: key);

  final TextTheme textTheme;
  final String text, subText;
  final bool isFree;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: kContainerColor),
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(AssetPaths.moreIcon),
          ),
          SizedBox(
            width: kSmallPadding,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style:
                    textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                subText,
                style: textTheme.headline3,
              )
            ],
          )),
          isFree
              ? Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 2, horizontal: kSmallPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kPadding),
                      color: kIconPink),
                  child: Text(
                    free,
                    style: textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      fontFamily: "DMSans",
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}



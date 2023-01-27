import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/modules/account/two_factor_auth/copy_code.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class FundWallet extends StatelessWidget {
  static const String routeName = "fundWallet";

  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  FundWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title:
          "${fundWallet.split(" ").first} ${fundWallet.split(" ").last.substring(0, 1)}${fundWallet.split(" ").last.substring(1)}",
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: kMacroPadding,
                    horizontal: kMediumPadding,
                  ),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(kRegularPadding),
                  ),
                  child: Column(
                    children: [
                      Text(
                        accNumber,
                        style: textTheme.headline3,
                      ),
                      SizedBox(
                        height: kPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${userProfile.walletDetails!.accountNumber}",
                            style: textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 32,
                            ),
                          ),
                          SizedBox(
                            width: kPadding,
                          ),
                          inkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                      "${userProfile.walletDetails!.accountNumber}"));
                              showSuccessBar(context, "Copied");
                            },
                            child: SvgPicture.asset(
                              AssetPaths.copyIcon,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: kMacroPadding,
                      ),
                      buildFundRow(textTheme, accName, userProfile.walletDetails!.accountName == null ? "Paga" : "${userProfile.walletDetails!.accountName}"),
                      SizedBox(
                        height: kMediumPadding,
                      ),
                      buildFundRow(textTheme, bankName, userProfile.walletDetails!.bankProvider == "" ? "Paga" : "${userProfile.walletDetails!.bankProvider}" ),
                    ],
                  ),
                ),
                SizedBox(
                  height: kLargePadding,
                ),
                Text(
                  fundAccount,
                  style: textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                CopyCodeRow(
                  textTheme: textTheme,
                  text: logToApp,
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AssetPaths.faIcon),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 4,
                    ),
                    // “Transfer Money” or “Send Money”
                    Expanded(
                        child: RichText(
                      text: TextSpan(
                          text: "$select ",
                          style:
                              textTheme.headline3!.copyWith(color: kIconGrey),
                          children: [
                            TextSpan(
                              text: "\"Transfer Money\"",
                              style: textTheme.headline3!.copyWith(
                                color: kIconGrey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: orText,
                              style: textTheme.headline3!
                                  .copyWith(color: kIconGrey),
                            ),
                            TextSpan(
                              text: "\"Send Money\"",
                              style: textTheme.headline3!.copyWith(
                                color: kIconGrey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ]),
                    ))
                  ],
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                CopyCodeRow(
                  textTheme: textTheme,
                  text: selectBank,
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                CopyCodeRow(
                  textTheme: textTheme,
                  text: "$enterAccNo \"${userProfile.walletDetails!.accountNumber}\""
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                CopyCodeRow(
                  textTheme: textTheme,
                  text: confirmTransPin,
                ),
              ],
            ),
          ),
          LargeButton(
            title: completedPayment,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Row buildFundRow(TextTheme textTheme, String text, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textTheme.headline3!.copyWith(
            color: kIconGrey,
          ),
        ),
        Text(
          subtitle,
          style: textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
